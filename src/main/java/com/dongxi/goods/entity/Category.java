package com.dongxi.goods.entity;

import java.io.Serializable;

public class Category implements Serializable{
    private static final long serialVersionUID = 1L;

    private Integer cId;

    private String cName;

    private Integer parentid;

    /**商品分类父id：自己的多对一*/
    private Category category;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }
}