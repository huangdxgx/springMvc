package com.dongxi.goods.dao.mapper;

import com.dongxi.goods.entity.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICategoryDao {
    int deleteByPrimaryKey(Integer cId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer cId);

    List<Category> selectCategoryAll();

    List<Category> selectCategorylist(Category category);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}