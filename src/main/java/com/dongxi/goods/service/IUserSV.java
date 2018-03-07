package com.dongxi.goods.service;

import com.dongxi.goods.entity.User;

import java.util.List;

/**
 * @Author: huangdx_gx
 * @Decscription: 用户业务层
 * @date: 2018/2/7 - 20:20
 * @see: com.dongxi.goods.service.interfaces
 */
public interface IUserSV {
    /**
     * 用户注册
     * @param loginName
     * @param loginPwd
     *
     */
    public  void  addUser(String loginName, String loginPwd);

    /**
     * 删除用户
     * @param userId
     * @return
     */
    public  boolean deleteUser(int userId);

    /**
     * t通过userId获取用户信息
     * @param userId
     * @return
     */
    public User getUserByUserId(int userId);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    public  boolean updateUser(User user);

    /**
     * 查询所有用户
     * @return
     */
    public List<User> getUserListAll();

    /**
     * 用户登录
     * @param loginNam
     * @param loginPwd
     * @return
     */
    public  User getUserLogin(String loginNam,String loginPwd);

    /**
     * 检验用户是否存在
     * @param loginName
     * @return
     */
    public  User getUserByLoginName(String loginName);

    /**
     * 模糊查询用户
     * @param name
     * @return
     */
    public  List<User> getUserList(String name);
}
