package com.dongxi.goods.service;

import com.dongxi.goods.entity.Product;

import java.util.List;

/**
 * @Author: huangdx_gx
 * @Decscription: what is the class useing for
 * @date: 2018/2/7 - 23:21
 * @see: com.dongxi.goods.service
 */
public interface IProductSV {
    /***后台接口方法*/
    /**
     * 查询商品列表
     * @return
     */
    public List<Product> getProductList(Product product);

    /**
     * 添加商品
     * @param product
     */
    void  addProduct(Product product);

    /**
     * 通过主键查询商品信息
     * @param product
     * @return
     */
    Product getProductByPrimaryKey(Product product);

    /**
     * 更新商品信息
     * @param product
     */
    void updatePrduct(Product product);

    /**
     * 删除商品信息
     * @param product
     */
    void  deleteProduct(Product product);

    /****前台接口方法**/
    /**
     * 查询最新上架商品
     * @param num
     * @return
     */
    List<Product> getNewProductlist(int num);

    /***
     * 模糊查询商品信息
     * @param name
     * @param categoryId
     * @return
     */
    List<Product> getProductlistBycase(String name , int categoryId);

}
