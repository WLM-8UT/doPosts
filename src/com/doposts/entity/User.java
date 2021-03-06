package com.doposts.entity;

import com.dxhualuo.data.annotation.JavaBean;
import com.dxhualuo.database.annotation.AutoIncrement;
import com.dxhualuo.database.annotation.PrimaryKey;
import com.dxhualuo.database.annotation.TableMapping;

import java.util.Date;

/**
 * 用户实体类
 * @author asuk
 * @date 2020/8/18 15:54
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@JavaBean
@TableMapping("user")
public class User {

    /**
     * 用户的绝对id
     */
    @PrimaryKey
    @AutoIncrement
    private Integer userId;

    /**
     * 用户昵称
     */
    private String userName;

    /**
     * 用户登录用的账号
     */
    private String userLoginName;

    /**
     * 密码
     */
    private String userPassword;

    /**
     * user 普通用户，admin管理员
     */
    private String group;

    /**
     * 用户头像路径
     */
    private String favicon;

    /**
     * 状态，-1 删除 0 封禁 1正常
     */
    private Integer status;

    /**
     * 注册日期
     */
    private Date createDate;

    public Date getCreateDate() {
        return createDate;
    }

    public User setCreateDate(Date createDate) {
        this.createDate = createDate;
        return this;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserLoginName() {
        return userLoginName;
    }

    public void setUserLoginName(String userLoginName) {
        this.userLoginName = userLoginName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getFavicon() {
        return favicon;
    }

    public void setFavicon(String favicon) {
        this.favicon = favicon;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userLoginName='" + userLoginName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", group='" + group + '\'' +
                ", favicon='" + favicon + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
