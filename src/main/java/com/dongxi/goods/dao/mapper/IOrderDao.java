package com.dongxi.goods.dao.mapper;

import com.dongxi.goods.entity.Order;
import org.springframework.stereotype.Repository;

@Repository
public interface IOrderDao {
    int deleteByPrimaryKey(Integer oId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer oId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}