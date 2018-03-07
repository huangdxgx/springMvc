package com.dongxi.goods.entity;
;
import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable{
    private static final long serialVersionUID = 1L;
    private Integer pId;//商品Id

    private String pName;//商品名称

    private String pDescription;//商品描述

    private Double pMemberprice;//会员价

    private Double pPrice;//市场价

    private Integer pStock;//库存

    private Integer cId;//对应分类

    private String pFilename;//商品照片

    private Date pCreatetiem;//更新日期
    /***
     * 商品所属分类（多对一的关系）
     */
    private  Category category;//商品所属分类


    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription == null ? null : pDescription.trim();
    }

    public Double getpMemberprice() {
        return pMemberprice;
    }

    public void setpMemberprice(Double pMemberprice) {
        this.pMemberprice = pMemberprice;
    }

    public Double getpPrice() {
        return pPrice;
    }

    public void setpPrice(Double pPrice) {
        this.pPrice = pPrice;
    }

    public Integer getpStock() {
        return pStock;
    }

    public void setpStock(Integer pStock) {
        this.pStock = pStock;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getpFilename() {
        return pFilename;
    }

    public void setpFilename(String pFilename) {
        this.pFilename = pFilename == null ? null : pFilename.trim();
    }

    public Date getpCreatetiem() {
        return pCreatetiem;
    }

    public void setpCreatetiem(Date pCreatetiem) {
        this.pCreatetiem = pCreatetiem;
    }
}