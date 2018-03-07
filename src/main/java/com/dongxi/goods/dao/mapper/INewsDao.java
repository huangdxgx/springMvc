package com.dongxi.goods.dao.mapper;

import com.dongxi.goods.entity.News;
import org.springframework.stereotype.Repository;

@Repository
public interface INewsDao {
    int deleteByPrimaryKey(Integer nId);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer nId);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
}