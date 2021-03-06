package com.doposts.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.dxhualuo.data.annotation.JavaBean;
import com.dxhualuo.database.annotation.AutoIncrement;
import com.dxhualuo.database.annotation.PrimaryKey;
import com.dxhualuo.database.annotation.TableMapping;

import java.util.Date;

/**
 * 楼层实体类
 * @author asuk
 * @date 2020/8/18 15:44
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@JavaBean
@TableMapping("floor")
public class Floor {

    /**
     * 楼层id
     */
    @PrimaryKey
    @AutoIncrement
    private Integer floorId;

    /**
     * 帖子id
     */
    private Integer postId;

    /**
     * 所在的楼层
     */
    private Integer postFloor;

    /**
     * 楼层正文
     */
    private String postContent;

    /**
     *  创建的用户id
     */
    private Integer createUserId;

    /**
     * 发送时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date sendDate;

    /**
     *  是否被删除
     */
    private Boolean isDelete;

    public Integer getFloorId() {
        return floorId;
    }

    public void setFloorId(Integer floorId) {
        this.floorId = floorId;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Integer getPostFloor() {
        return postFloor;
    }

    public void setPostFloor(Integer postFloor) {
        this.postFloor = postFloor;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }
    public Boolean getIsDelete() {
        return isDelete;
    }

    public Floor setIsDelete(Boolean delete) {
        isDelete = delete;
        return this;
    }

    @Override
    public String toString() {
        return "Floor{" +
                "floorId=" + floorId +
                ", postId=" + postId +
                ", postFloor=" + postFloor +
                ", postContent='" + postContent + '\'' +
                ", createUserId=" + createUserId +
                ", sendDate=" + sendDate +
                ", isDelete=" + isDelete +
                '}';
    }
}
