package com.dongxi.goods.dao.mapper;

import com.dongxi.goods.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUserDao {
    int deleteByPrimaryKey(Integer userId);

    int insert(User user);

    int insertSelective(User user);

    User selectByPrimaryKey(Integer userId);

    List<User> selectUserAll();

    User  querySelective(User user);

   User getUserBylogNameAndLogPwd(User user);

   List<User>  selectByAnyWays(@Param("name")String name);

    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User user);
}