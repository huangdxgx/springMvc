package com.dongxi.goods.dao.mapper;

import com.dongxi.goods.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProductDao {
    int deleteByPrimaryKey(Integer pId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer pId);

    List<Product> selectProductAll();

    List<Product> getNewProductlist(@Param("num") int num);

    List<Product> querySelective(Product product);

    List<Product> getProductlistBycase(@Param("name") String name,@Param("categoryId") int categoryId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}