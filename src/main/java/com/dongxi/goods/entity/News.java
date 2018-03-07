package com.dongxi.goods.entity;

import java.io.Serializable;

public class News  implements Serializable{
    private static final long serialVersionUID = 1L;

    private Integer nId;

    private String nTitle;

    private String nContent;

    private String nCreatetime;

    public Integer getnId() {
        return nId;
    }

    public void setnId(Integer nId) {
        this.nId = nId;
    }

    public String getnTitle() {
        return nTitle;
    }

    public void setnTitle(String nTitle) {
        this.nTitle = nTitle == null ? null : nTitle.trim();
    }

    public String getnContent() {
        return nContent;
    }

    public void setnContent(String nContent) {
        this.nContent = nContent == null ? null : nContent.trim();
    }

    public String getnCreatetime() {
        return nCreatetime;
    }

    public void setnCreatetime(String nCreatetime) {
        this.nCreatetime = nCreatetime == null ? null : nCreatetime.trim();
    }
}