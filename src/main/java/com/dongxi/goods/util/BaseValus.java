package com.dongxi.goods.util;



/**
 * 静态参数
 */
public class BaseValus {
   private static  final  String USER_ADMIN = "adminName";//管理员
    private static  final  String LOGIN_ACTION = "/user/login.action";//登录action
    private  static  final String CHECK_USER = "/user/checkName.action";//检验用户
    private  static  final  String REGISTER_USER = "/user/registerUser.action";//用户注册
    private  static  final  String PRODUCT_LIST = "/product/productlist.action";
    private  static  final  String ELECTRONICS_LIST = "/product/electronics.action";
    private  static  final  String MENS_LIST = "/product/mens.action";
    private  static  final  String WOMENS_LIST = "/product/womens.action";
    private  static  final  String SEARCH_LIST = "/product/search1.action";
    private  static  final  String SEARCHLIST = "search";
    private  static  final  Integer  ADMIN=1;
    private  static  final  Integer COMMON_USER= 2;


    public static Integer getADMIN() {
        return ADMIN;
    }
    public static Integer getCommonUser() {
        return COMMON_USER;
   }
    public static String getProductList() {
        return PRODUCT_LIST;
    }

    public static String getElectronicsList() {
        return ELECTRONICS_LIST;
    }

    public static String getMensList() {
        return MENS_LIST;
    }

    public static String getWomensList() {
        return WOMENS_LIST;
    }

    public static String getSearchList() {
        return SEARCH_LIST;
    }

    public static String getSEARCHLIST() {
        return SEARCHLIST;
    }


    public static String getUserAdmin() {
        return USER_ADMIN;
    }

    public static String getLoginAction() {
        return LOGIN_ACTION;
    }

    public static String getCheckUser() {
        return CHECK_USER;
    }

    public static String getRegisterUser() {
        return REGISTER_USER;
    }




 }

