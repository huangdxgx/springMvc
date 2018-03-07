package com.dongxi.goods.entity;

import java.io.Serializable;

/**
 * @Author: huangdx_gx
 * @Decscription: 购物项==购买时的产品信息
 * @date: 2018/2/11 - 21:05
 * @see: com.dongxi.goods.entity
 */
public class CartItem implements Serializable{
    private static final long serialVersionUID = 1L;
    private  int productId;//商品编号
    private  String productName;//商品名称
    private  int count;//购买的数量
    private  double price;//购买的价格

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    /**返回一种商品的金额**/
    public  double getTotalPrice(){
        return  count*price;
    }
}

