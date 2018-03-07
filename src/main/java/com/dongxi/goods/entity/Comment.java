package com.dongxi.goods.entity;

import java.io.Serializable;

public class Comment  implements Serializable{
    private static final long serialVersionUID = 1L;

    private Integer commentId;

    private String commentContent;

    private String commonentTime;

    private String commonentReply;

    private String commonentReplytime;

    private Integer userId;

    private  User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }



    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public String getCommonentTime() {
        return commonentTime;
    }

    public void setCommonentTime(String commonentTime) {
        this.commonentTime = commonentTime == null ? null : commonentTime.trim();
    }

    public String getCommonentReply() {
        return commonentReply;
    }

    public void setCommonentReply(String commonentReply) {
        this.commonentReply = commonentReply == null ? null : commonentReply.trim();
    }

    public String getCommonentReplytime() {
        return commonentReplytime;
    }

    public void setCommonentReplytime(String commonentReplytime) {
        this.commonentReplytime = commonentReplytime == null ? null : commonentReplytime.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}