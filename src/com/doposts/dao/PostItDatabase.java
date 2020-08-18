package com.doposts.dao;

import com.doposts.dao.impl.*;
import com.doposts.dao.interfaces.*;
import com.doposts.entity.CreateClassRequest;
import com.dxhualuo.database.connectionpool.config.C3P0_Config;

/**
 *  数据库实体类
 * @author dx_hualuo
 */
@SuppressWarnings("unused")
public class PostItDatabase {
    //初始化顺序不要动，C3P0连接配置在第一个FloorDaoImpl类中
    static {
        FLOOR_DAO = new FloorDaoImpl();
        POST_CLASS_DAO = new PostClassDaoImpl();
        POST_DAO = new PostDaoImpl();
        REPLY_DAO = new ReplyDaoImpl();
        USER_DAO = new UserDaoImpl();
        CREATE_CLASS_REQUEST_DAO = new CreateClassRequestDaoImpl();
    }
    public static final FloorDao FLOOR_DAO;
    public static final PostClassDao POST_CLASS_DAO;
    public static final PostDao POST_DAO;
    public static final ReplyDao REPLY_DAO;
    public static final UserDao USER_DAO;
    public static final CreateClassRequestDao CREATE_CLASS_REQUEST_DAO;
}
