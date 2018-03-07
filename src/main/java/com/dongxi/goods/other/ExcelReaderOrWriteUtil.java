package com.dongxi.goods.other;


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**读取excel表格的数据进行处理
 * 将每行放到一个list中，然后每行的每列放入到一个list中，这里再根据自己需求去对表中数据进行处理：
 * @Author: huangdx_gx
 * @Decscription: poi解析Excel
 * @date: 2018/3/6 - 10:07
 * @see: com.dongxi.goods.other
 */
public class ExcelReaderOrWriteUtil {

    /**
     * 根据fileType不同读取Excel文件
     * @param path
     * @return
     */
    public  static List<List<String>> readExcel(String path){
        String fileType = path.substring(path.lastIndexOf(".")+1);//获取以.开始位置+1到字符串结尾之间的串，即拿到文件的后缀名
        //return  a list  contains many list
        List<List<String>> lists = new ArrayList<List<String>>();//返回一个lists里面包含很多个list
        //读取Excel文件
        InputStream is  = null;
        try {
            is = new FileInputStream(path);
            //获取工作薄
            Workbook wb = null;
            if (fileType.equals("xls")){
                wb = new HSSFWorkbook(is);
            }else  if (fileType.equals("xlsx")){
                wb = new XSSFWorkbook(is);
            }else {
                return  null;
            }
            //读取第一个工作页sheet
            Sheet  sheet = wb.getSheetAt(0);
            //第一行为标题
            for (Row row : sheet){
                ArrayList<String> list = new ArrayList<String>();
                for (Cell cell : row){
                    //根据不同类型转化成字符串
                    cell.setCellType(Cell.CELL_TYPE_STRING);
                    list.add(cell.getStringCellValue());
                }
                lists.add(list);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (is !=null){
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return  lists;
    }


    /**
     * 创建Excel.xls
     * @param lists  需要写入xls的数据
     * @param title 列标题
     * @param name 文件名
     * @return
     */
    public  static  Workbook crearExcel (List<List<String>> lists,String title, String name){
        System.out.println(lists);
        String[] titles = title.split(",");
        //创建工作薄
        Workbook wb = new HSSFWorkbook();
        //创建第一个sheet（页），并命名
        Sheet sheet = wb.createSheet(name);
        //手动设置列宽。第一个参数表示要为第几列设；第二个参数表示列的宽度，n为列高的像素数。
        for (int i= 0;i<titles.length;i++){
            sheet.setColumnWidth((short) i,(short) (35.7*150));
        }

        //创建第一行
        Row row = sheet.createRow((short) 0);

        //创建两种单元格格式
        CellStyle cs = wb.createCellStyle();
        CellStyle cs2 = wb.createCellStyle();

        //创建两种字体
        Font f = wb.createFont();
        Font f2= wb.createFont();

        //创建第一种字体样式（用于列名）
        f.setFontHeightInPoints((short) 10);
        f.setColor(IndexedColors.BLACK.getIndex());
        f.setBoldweight(Font.BOLDWEIGHT_BOLD);

        //创建第二种字体样式（用于值）
        f2.setFontHeightInPoints((short)10);
        f2.setColor(IndexedColors.BLACK.getIndex());

        //设置第一种单元格的样式（用于列）
        cs.setFont(f);
        cs.setBorderLeft(CellStyle.BORDER_THIN);
        cs.setBorderRight(CellStyle.BORDER_THIN);
        cs.setBorderTop(CellStyle.BORDER_THIN);
        cs.setBorderBottom(CellStyle.BORDER_THIN);
        cs.setAlignment(CellStyle.ALIGN_CENTER);//居中

        //设置第二种单元格的样式（用于值）
        cs2.setFont(f2);
        cs2.setBorderLeft(CellStyle.BORDER_THIN);
        cs2.setBorderRight(CellStyle.BORDER_THIN);
        cs2.setBorderTop(CellStyle.BORDER_THIN);
        cs2.setBorderBottom(CellStyle.BORDER_THIN);
        cs2.setAlignment(CellStyle.ALIGN_CENTER);

        //设置列名
        for (int i=0; i<titles.length;i++){
            Cell cell = row.createCell(i);
            cell.setCellValue(titles[i]);
            cell.setCellStyle(cs);
        }
        if (lists == null || lists.size() == 0){
            return  wb;
        }

        //设置每行每列的值
        for (short i=1; i<=lists.size();i++){//总行数
            //row行，cell 方格，row 和cell 都是从0开始计数的
            //创建一行，在页sheet上
            Row row1 = sheet.createRow((short) i);//第一行
            for (short j= 0;j<titles.length;j++){//第一行有多少列，然后在每列的单元格上set如数据
                //在row行上创建一个方格
                Cell cell = row1.createCell(j);
                cell.setCellValue(lists.get(i-1).get(j));//list里面装list，先拿到第一层的list，再拿第二层的list的一行的列的值
                cell.setCellStyle(cs2);//把刚才配置好的表格长宽字体加入表格的配置
            }
        }
        return  wb;
    }

    /**
     * 保存到本地硬盘
     * @param workbook
     */
    public  static void saveExcel( Workbook workbook){
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream("F:\\user2.xls");
            workbook.write(fos);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public  static  void  main(String[] args ){
        String path = "F:\\user.xls";
        String title ="用户名,登录名,登录密码,用户号码,用户地址";
        List<List<String>> lists = readExcel(path);
        Workbook workbook = crearExcel(lists,title,"用户表");
        saveExcel(workbook);
        for (List<String> list : lists){
            for (String strs : list){
                System.out.print(strs+" ");
            }
            System.out.println();

        }
    }

}

