package com.dongxi.goods.service.impl;

import com.dongxi.goods.dao.mapper.ICategoryDao;
import com.dongxi.goods.entity.Category;
import com.dongxi.goods.service.ICategorySV;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: huangdx_gx
 * @Decscription: what is the class useing for
 * @date: 2018/2/9 - 16:35
 * @see: com.dongxi.goods.service.impl
 */
@Service
public class CategorySvImpl implements ICategorySV{
    private  static  final Log log = LogFactory.getLog(CategorySvImpl.class);

    @Autowired
    private ICategoryDao categoryDao;
    /**
     * 查询商品分类
     * @return
     */
    public List<Category> getCategorylist(Category category) {
        return     categoryDao.selectCategorylist(category);

    }
}

