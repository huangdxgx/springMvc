package com.dongxi.goods.util;


import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * @author yi
 * @date 2016年10月22日
 */

public class BaseDao {
    /**
     * 获得连接
     *
     * @return
     * @throws Exception
     */
    public Connection getConn() throws Exception {

        //读取配置文件db.properties的数据库相关属性
        //1.通过inputStream读取db.properties这个文件
        //1.读取jdbc.properties的数据库相关属性
        InputStream inputStream  = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
        //2.创建properties对象
        Properties p = new Properties();
        //3.读取配置文件内容到properties对象里
        p.load(inputStream);
        Class.forName(p.getProperty("jdbc.driver"));
        return DriverManager.getConnection(p.getProperty("jdbc.url"),p.getProperty("jdbc.username"),p.getProperty("jdbc.password"));

        /*
         * -***********************sqlserver2005数据库-*******************
         * Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); String
         * uri="jdbc:sqlserver://127.0.0.1:1433;DataBaseName=master"; return
         * DriverManager.getConnection(uri,"sa","123");
         */
    }

    public static void main(String[] args) {
        BaseDao bd = new BaseDao();
        try {
            Connection con = bd.getConn();
            if(con!=null){
                System.out.println("成功");
            }
        } catch (Exception e) {
            System.out.println("数据库连接失败");
            e.printStackTrace();
        }
    }

    /**
     * 关闭连接
     *
     * @param rs
     * @param sm
     * @param conn
     */
    public void closeAll(ResultSet rs, Statement sm, Connection conn)
            throws Exception {
        if (rs != null)
            rs.close();
        if (sm != null)
            sm.close();
        if (conn != null)
            conn.close();
    }

    /**
     * 增加,删除,修改
     *
     * @param sql
     * @param args
     * @return
     */
    public boolean executeUpdate(String sql, Object[] args) {
        boolean flag = false;//执行结果的标识
        Connection conn = null;//连接对象
        PreparedStatement sm = null;//执行者
        try {
            conn = this.getConn();//创建连接
            sm = conn.prepareStatement(sql);//将命令（sql语句）丢给执行者
            if (conn != null && args!=null) {//给执行者执行命令必要的参数（占位符赋值，占位符的个数跟参数个数一致）
                for (int i = 0; i < args.length; i++) {
                    sm.setObject(i + 1, args[i]);
                }
            }
            //执行sql语句，返回执行结果
            if (sm.executeUpdate() > 0) {
                flag = true;
            }
        } catch (Exception e) {
            System.out.println("执行非查询出错！");
            e.printStackTrace();
        } finally {
            try {//关闭资源
                this.closeAll(null, sm, conn);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

    /**
     * 查询方法
     *
     * @param sql
     * @param args
     * @return
     */
    public List executeQuery(String sql, Object[] args, Class clazz) {

        List list = new ArrayList();
        Connection conn = null;
        PreparedStatement sm = null;
        ResultSet rs = null;
        try {
            conn = this.getConn();//创建连接
            sm = conn.prepareStatement(sql);//创建执行者
            if (args != null) {//构造sql占位符值
                for (int i = 0; i < args.length; i++) {
                    sm.setObject(i + 1, args[i]);
                }
            }
            //执行查询
            rs = sm.executeQuery();
            //查询结构的返回
            while (rs.next()) {
                // 通过反射得到一个对象
                list.add(this.getObj(clazz, rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.closeAll(null, sm, conn);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public static Object getObj(Class clazz, ResultSet rs) throws Exception {
        // 所有的属性
        Field[] field = clazz.getDeclaredFields();
        Object info = clazz.newInstance();//创建实体对象
        for (int i = 0; i < field.length; i++) {
            String name = field[i].getName();
            // 得到方法名
            name = "set" + name.substring(0,1).toUpperCase() + name.substring(1);
            // 得到类型
            Class c = field[i].getType();
            // 得到方法
            Method method = clazz.getMethod(name, c);
            // 实现方法
            if(rs.getObject(i + 1)!=null){
                method.invoke(info, rs.getObject(i + 1));
            }
        }
        return info;
    }

}

