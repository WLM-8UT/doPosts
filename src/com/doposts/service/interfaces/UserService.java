package com.doposts.service.interfaces;

import com.doposts.entity.User;

/**
 * @author Wu j
 * @date 2020/8/19 15:57
 */
public interface UserService {
    /**
     *  登录方法
     * @param loginName 登录名
     * @param password 密码
     * @return User实体类，如果登陆失败则为Null
     */
    User login(String loginName, String password);

    /**
     *  注册普通用户
     * @param loginName 登录名
     * @param password 密码
     * @param userName 用户昵称
     * @return 是否注册成功，如果注册不成功就代表用户名被注册
     */
    boolean register(String loginName, String password, String userName);
}