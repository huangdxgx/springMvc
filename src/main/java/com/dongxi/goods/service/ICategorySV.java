package com.dongxi.goods.service;

import com.dongxi.goods.entity.Category;

import java.util.List;

/**
 * @Author: huangdx_gx
 * @Decscription: what is the class useing for
 * @date: 2018/2/9 - 16:34
 * @see: com.dongxi.goods.service
 */
public interface ICategorySV {
    /**
     * 查询商品分类
     * @return
     */
    List<Category> getCategorylist(Category category);
}
