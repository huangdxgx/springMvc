package com.dongxi.goods.entity;

import com.sun.org.apache.regexp.internal.RE;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 定单实体类
 */
public class Order implements Serializable{
    private static final long serialVersionUID = 1L;

    /**订单状态*/
    public static int STATUS_INITIAL=1;//待审核
    public static int STATUS_PASS=2;//审核通过
    public static int STATUS_SEND=3;//卖家发货
    public static int STATUS_RECEIVED=4;//已收货

    private Integer id;

    private String pamentId;//定单编号

    private Integer userId;//用户ID

    private String userBiilid;//用户电话号码

    private String sendAddr;//送货地址

    private Date oCreatetime;//定单日期

    private String oStatus;//定单状态

    private String status;//状态

    private String remark;//备注

    /**
     * 多个订单对应一个用户
     */
    private  User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    /**一个订单包含哪些项

     * 一对多的关系
     * **/
    private List<SaleItem> saleItems;


    public List<SaleItem> getSaleItems() {
        return saleItems;
    }

    public void setSaleItems(List<SaleItem> saleItems) {
        this.saleItems = saleItems;
    }


    public  String getDisplayStatus(){
        switch (Integer.valueOf(this.oStatus)){
            case 1:
                return  "待审核";
            case  2:
                return "审核通过";
            case 3:
                return "卖家发货";
            case 4:
                return  "已收货";
             default:
                 return  "待审核";
        }
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPamentId() {
        return pamentId;
    }

    public void setPamentId(String pamentId) {
        this.pamentId = pamentId == null ? null : pamentId.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserBiilid() {
        return userBiilid;
    }

    public void setUserBiilid(String userBiilid) {
        this.userBiilid = userBiilid == null ? null : userBiilid.trim();
    }

    public String getSendAddr() {
        return sendAddr;
    }

    public void setSendAddr(String sendAddr) {
        this.sendAddr = sendAddr == null ? null : sendAddr.trim();
    }

    public Date getoCreatetime() {
        return oCreatetime;
    }

    public void setoCreatetime(Date oCreatetime) {
        this.oCreatetime = oCreatetime;
    }

    public String getoStatus() {
        return oStatus;
    }

    public void setoStatus(String oStatus) {
        this.oStatus = oStatus == null ? null : oStatus.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}