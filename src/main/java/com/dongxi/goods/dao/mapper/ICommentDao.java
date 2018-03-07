package com.dongxi.goods.dao.mapper;

import com.dongxi.goods.entity.Comment;
import org.springframework.stereotype.Repository;

@Repository
public interface ICommentDao {
    int deleteByPrimaryKey(Integer commentId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer commentId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}