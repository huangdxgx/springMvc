package com.dongxi.goods.entity;

import java.io.Serializable;

/**
 * @Author: huangdx_gx
 * @Decscription: what is the class useing for
 * @date: 2018/2/9 - 22:11
 * @see: com.dongxi.goods.entity
 */
public class Page implements Serializable{

    private static final long serialVersionUID = 1L;
    private  int curruentPage;//当前页
    private  int pageSize;//每页显示记录数
    private  int totalPage;//总页数
    private  int totalSize;//总记录数

    public int getCurruentPage() {
        return curruentPage;
    }

    public void setCurruentPage(int curruentPage) {
        this.curruentPage = curruentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }


}

