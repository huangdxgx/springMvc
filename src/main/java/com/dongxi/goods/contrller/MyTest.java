package com.dongxi.goods.contrller;

import com.dongxi.goods.entity.User;

/**
 * @Author: huangdx_gx
 * @Decscription: what is the class useing for
 * @date: 2018/3/7 - 21:35
 * @see: com.dongxi.goods.contrller
 */
public class MyTest {
    public  static  void  main(String[] args){
        System.out.println("这是我的一个小测试！");
        User user = new User();
        user.setUserId(1);
        user.setUserAddress("南宁");
        user.setUserPhone("18778989157");
        user.setLoginPwd("123456");
        user.setLoginName("dongxi");
    }
}

