package com.dongxi.goods.other;

import com.dongxi.goods.entity.User;
import com.dongxi.goods.service.IUserSV;
import com.dongxi.goods.util.BaseDao;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.springframework.context.support.GenericXmlApplicationContext;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.sql.*;
import java.util.*;
import java.util.Date;

/**
 * @Author: huangdx_gx
 * @Decscription: 把数据库表写到Excel上
 * @date: 2018/3/6 - 11:47
 * @see: com.dongxi.goods.other
 */
public class ExcelWriteUtil {
    private  static  final Log log = LogFactory.getLog(ExcelWriteUtil.class);

    //第一步，创建workbook对应的一个Excel文件
    private  static HSSFWorkbook workbook = new HSSFWorkbook();
    private static  HSSFSheet sheet = null;

    /**
     * 1.创建单元格，设置表头
     * @param sheetName
     * @param columname
     */
    public  static  void createExcel(String sheetName,String columname){
        String[] columns = columname.split(",");
        //第二步，在workbook中创建一个sheet对应Excel中的sheet
         sheet = workbook.createSheet(sheetName);
        //第三步，在sheet表中添加表头第0行，老版本的poi对sheet的行列有限制
        HSSFRow row = sheet.createRow(0);

        //创建两种单元格式
        CellStyle cs = workbook.createCellStyle();//用于表头标题的单元格式

        //创建两种字体
        Font f = workbook.createFont();//用于表头标题的单元格式的字体


        //创建第一种字体样式（用于列名）
        f.setFontHeightInPoints((short) 10);
        f.setColor(IndexedColors.BLACK.getIndex());
        f.setBoldweight(Font.BOLDWEIGHT_BOLD);



        //设置第一种单元格式的样式（用于列）
        cs.setFont(f);
        cs.setBorderLeft(CellStyle.BORDER_THIN);
        cs.setBorderRight(CellStyle.BORDER_THIN);
        cs.setBorderTop(CellStyle.BORDER_THIN);
        cs.setBorderBottom(CellStyle.BORDER_THIN);
        cs.setAlignment(CellStyle.ALIGN_CENTER);



        //第四步，创建单元格，设置表头
        HSSFCell cell = null;
        if (columns.length>0){
            for (int i=0;i<columns.length;i++){
                cell= row.createCell(i);
                cell.setCellValue(columns[i]);
                sheet.setColumnWidth((short)i,(short)(37.7*150)); //手动设置列宽。第一个参数表示要为第几列设；第二个参数表示列的宽度，n为列高的像素数。
               cell.setCellStyle(cs);
                log.debug("表头"+(i+1)+":"+columns[i]);
            }
        }


    }

    /**
     * 2.写入excel
     * @param lists
     * @param sheet
     * @param obj
     */
    public static   void  writeDataToExcel(List<List<String>> lists,HSSFSheet  sheet,Object obj){
        //创建单元格式
        CellStyle cs2 = workbook.createCellStyle();//用于单元格每一行的单元格式
        //创建字体样式
        Font f2 = workbook.createFont();
        //创建第二种字体样式（用于值）
        f2.setFontHeightInPoints((short) 10);
        f2.setColor(IndexedColors.BLACK.getIndex());
        //设置第二种单元格式的样式（用于值）
        cs2.setFont(f2);
        cs2.setBorderLeft(CellStyle.BORDER_THIN);
        cs2.setBorderRight(CellStyle.BORDER_THIN);
        cs2.setBorderTop(CellStyle.BORDER_THIN);
        cs2.setBorderBottom(CellStyle.BORDER_THIN);
        cs2.setAlignment(CellStyle.ALIGN_CENTER);
        //获取要写入表格的列数
        String[] coumns = null;
        if (obj !=null){
            coumns   = obj.toString().split(",");
        }
        if (lists != null && lists.size()>0) {
            for (int i = 0; i < lists.size(); i++) {//总行数
                //row行，cell方格，row和cell都是从0开始计数的
                //第一行我我们已经设置了 set数据，我们要从第二行开始
                HSSFRow row = sheet.createRow(i + 1);//刚才已经建了一行，现在是第二行，要i+1
                int j=0;
                if (lists.get(i).get(j) != null && lists.get(i).size()>0){
                    for (; j<lists.get(i).size(); j++){//遍历内嵌list的值
                        Cell cell = row.createCell(j);
                        cell.setCellValue(lists.get(i).get(j));//list里面装list，先拿到第一层的list，再拿第二层的list的一行的列的值
                        cell.setCellStyle(cs2);//把刚才配置好的表格长宽字体加入表格的配置
                        log.debug("单元格第"+(i+1)+"行的数据："+row.getCell(j)+" ");
                    }
                }
            }
        }
    }


    /**
     * 3.保存到本地硬盘
     */
    public static   void  saveExcel(Workbook workbook){
        String ExcelName =  DateFormatUtils.format(new Date(),"yyyyMMdd");
        char c=(char)(int)(Math.random()*26+97);
        StringBuffer sf = new StringBuffer();
        String  pathName =  sf.append(ExcelName).append(c).append(".xls").toString();
        FileOutputStream fos;
        try {
            fos = new FileOutputStream("F:\\"+pathName);
            workbook.write(fos);
            log.debug("写入成功！");
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /***
     * 封装从数据库查询出来的数据
     * @return
     * @throws SQLException
     */
    public static   List<List<String>> getList() throws SQLException {
        String url ="jdbc:mysql://localhost:3306/goods?&useUnicode=true&characterEncoding=UTF-8&useSSL=true&serverTimezone=GMT%2B8";
        String username = "root";
        String password = "123456";
       PreparedStatement ps= null;
       ResultSet rs= null;
       Connection connection=DriverManager.getConnection(url,username,password);
        List<List<String>> lists = new ArrayList<List<String>>();
        try {
       String sql = "select * from t_user";
            if (connection != null) {
                ps = connection.prepareStatement(sql);
            }
                rs = ps.executeQuery();
            while (rs.next()){
                ArrayList<String> rsList = new ArrayList<String>();
                if (rs.getObject("user_name") != null){
                    rsList.add(rs.getObject("user_name").toString());
                }
                if (rs.getObject("login_name") != null){
                    rsList.add(rs.getObject("login_name").toString());
                }
                if (rs.getObject("login_pwd") !=null){
                    rsList.add(rs.getObject("login_pwd").toString());
                }
                if (rs.getObject("user_phone") != null){
                    rsList.add(rs.getObject("user_phone").toString());
                }
                if (rs.getObject("user_address") != null){
                   rsList.add(rs.getObject("user_address").toString());
                }
                lists.add(rsList);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (ps !=null)ps.close();
            if (connection != null)connection.close();
            if (rs != null)rs.close();
        }
        return  lists;
    }


    public  static  void  main(String[] args) throws Exception {
       /* String chars = "abcdefghijklmnopqrstuvwxyz";
        chars.charAt((int)(Math.random() * 26));*/
        String column = "用户名,登录名,登录密码,用户号码,用户地址";
        ExcelWriteUtil writeUtil = new ExcelWriteUtil();
       List<List<String>> list = getList();
       String sheetName =  DateFormatUtils.format(new Date(),"yyyyMMdd");
        char c=(char)(int)(Math.random()*26+97);
       createExcel(sheetName+c,column);
       writeDataToExcel(list,sheet,column);
       saveExcel(workbook);





    }
}

