package com.dongxi.goods.service.impl;

import com.dongxi.goods.dao.mapper.IProductDao;
import com.dongxi.goods.entity.Product;
import com.dongxi.goods.service.IProductSV;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: huangdx_gx
 * @Decscription: what is the class useing for
 * @date: 2018/2/7 - 23:23
 * @see: com.dongxi.goods.service.impl
 */
@Service
public class ProductSvImpl implements IProductSV{
    private  static  final Log log = LogFactory.getLog(ProductSvImpl.class);
    @Autowired
    private IProductDao productDao;

    /**
     * 查询商品列表
     *
     * @return
     */
    public List<Product> getProductList(Product product) {
        return productDao.querySelective(product);
    }

    /**
     * 添加商品
     *
     * @param product
     */
    public void addProduct(Product product) {
        productDao.insertSelective(product);
    }

    /**
     * 通过主键查询商品信息
     *
     * @param product
     * @return
     */
    public Product getProductByPrimaryKey(Product product) {
        if (product.getpId() != null){
            return productDao.selectByPrimaryKey(product.getpId());
        }
        return null;
    }

    /**
     * 更新商品信息
     *
     * @param product
     */
    public void updatePrduct(Product product) {
        if (product.getpId() != null){
            productDao.updateByPrimaryKey(product);
        }

    }

    /**
     * 删除商品信息
     *
     * @param product
     */
    public void deleteProduct(Product product) {
        if (product.getpId()!=null){
            productDao.deleteByPrimaryKey(product.getpId());
        }
    }

    /**
     * 查询最新上架商品，通过入表时间降序查询前 num条
     *
     * @param num
     * @return
     */
    public List<Product> getNewProductlist(int num) {
        if (num >0){
          return   productDao.getNewProductlist(num);
        }
        return null;
    }

    /***
     * 模糊查询商品信息
     * @param name
     * @param categoryId
     * @return
     */
    public List<Product> getProductlistBycase(String name, int categoryId) {
        if ( (name !=null &&  !"".equals(name)) && categoryId != -1){
            return    productDao.getProductlistBycase(name,categoryId);
        }
        if (categoryId <0 && name != null){
            return  productDao.getProductlistBycase(name,-1);
        }
        if (name == null && categoryId>0){
            return  productDao.getProductlistBycase("",categoryId);
        }
        return null;
    }
}

