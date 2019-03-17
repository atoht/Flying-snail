package com.mycompany.flyingsnail.entity;

import java.util.Date;

public class UserClothing {
    private Integer userId;

    private Integer clothingId;

    private Integer clothingComponentId;

    private String imageName;

    private String imageFormat;

    private Date updateTime;

    private Date createTime;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getClothingId() {
        return clothingId;
    }

    public void setClothingId(Integer clothingId) {
        this.clothingId = clothingId;
    }

    public Integer getClothingComponentId() {
        return clothingComponentId;
    }

    public void setClothingComponentId(Integer clothingComponentId) {
        this.clothingComponentId = clothingComponentId;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName == null ? null : imageName.trim();
    }

    public String getImageFormat() {
        return imageFormat;
    }

    public void setImageFormat(String imageFormat) {
        this.imageFormat = imageFormat == null ? null : imageFormat.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}