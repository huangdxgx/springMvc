package com.dongxi.goods.dao.mapper;

import com.dongxi.goods.entity.SaleItem;

public interface ISaleItemDao {
    int deleteByPrimaryKey(Integer sId);

    int insert(SaleItem record);

    int insertSelective(SaleItem record);

    SaleItem selectByPrimaryKey(Integer sId);

    int updateByPrimaryKeySelective(SaleItem record);

    int updateByPrimaryKey(SaleItem record);
}