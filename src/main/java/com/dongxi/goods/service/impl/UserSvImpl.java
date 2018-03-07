package com.dongxi.goods.service.impl;

import com.dongxi.goods.dao.mapper.IUserDao;
import com.dongxi.goods.entity.User;
import com.dongxi.goods.service.IUserSV;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: huangdx_gx
 * @Decscription: what is the class useing for
 * @date: 2018/2/7 - 20:03
 * @see: com.dongxi.goods.service.impl
 */
@Service
public class UserSvImpl  implements IUserSV{
private  static  final Log log = LogFactory.getLog(UserSvImpl.class);
@Autowired
private IUserDao userDao;
    /**
     * 用户注册
     * @param loginName
     * @param loginPwd
     *
     */
    public void addUser(String loginName, String loginPwd) {
        log.debug("登录名："+loginName+"登录密码："+loginPwd);
        User user = new User();
        if (StringUtils.isNotBlank(loginName)){
            user.setLoginName(loginName);
        }
        if (StringUtils.isNotBlank(loginPwd)){
            user.setLoginPwd(loginPwd);
        }
            user.setUserStatus(2);
        userDao.insertSelective(user);

    }

    /**
     * 删除用户
     *
     * @param userId
     * @return
     */
    public boolean deleteUser(int userId) {
        if (userId !=-1){
            userDao.deleteByPrimaryKey(userId);
            return  true;
        }
        return false;
    }

    /**
     * t通过userId获取用户信息
     *
     * @param userId
     * @return
     */
    public User getUserByUserId(int userId) {
        if (userId != -1){
          return   userDao.selectByPrimaryKey(userId);
        }
        return null;
    }

    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    public boolean updateUser(User user) {
        if (user !=null){
            userDao.updateByPrimaryKeySelective(user);
            return  true;
        }
        return false;
    }

    /**
     * 查询所有用户
     *
     * @return
     */
    public List<User> getUserListAll() {
        List<User> userList = null;
        userList=  userDao.selectUserAll();
        if (userList!=null && userList.size()>0){
            return  userList;
        }
        return null;
    }

    /**
     * 用户登录
     *
     * @param loginNam
     * @param loginPwd
     * @return
     */
    public User getUserLogin(String loginNam, String loginPwd) {
        User user = new User();
        if (StringUtils.isNotBlank(loginNam)){
            user.setLoginName(loginNam);
        }
        if (StringUtils.isNotBlank(loginPwd)){
            user.setLoginPwd(loginPwd);
        }
        User user1=  userDao.getUserBylogNameAndLogPwd(user);
        if (user1 != null){
            return  user1;
        }
        return null;
    }

    /**
     * 检验用户是否存在
     *
     * @param loginName
     * @return
     */
    public User getUserByLoginName(String loginName) {
        User user = new User();
        if (StringUtils.isNotBlank(loginName)){
            user.setLoginName(loginName);
        }
        User user1 = userDao.querySelective(user);
        if (user1 !=null){
            return  user1;
        }
        return null;
    }

    /**
     * 模糊查询用户
     *
     * @param name
     * @return
     */
    public List<User> getUserList(String name) {
        return userDao.selectByAnyWays(name);
    }
}

