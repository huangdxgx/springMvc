package com.dongxi.goods.entity;

import java.io.Serializable;

/**
 * 销售项
 */
public class SaleItem implements Serializable{
    private static final long serialVersionUID = 1L;

    private Integer sId;

    private Integer productId;

    private String productName;

    private Integer buyNumber;

    private Double price;

    private Integer orderId;

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public Integer getBuyNumber() {
        return buyNumber;
    }

    public void setBuyNumber(Integer buyNumber) {
        this.buyNumber = buyNumber;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getOrderid() {
        return orderId;
    }

    public void setOrderid(Integer orderid) {
        this.orderId = orderid;
    }
}