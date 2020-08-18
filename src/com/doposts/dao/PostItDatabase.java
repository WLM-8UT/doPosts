package com.doposts.dao;

import com.doposts.dao.impl.*;
import com.doposts.dao.interfaces.*;

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
    }
    public static final FloorDao FLOOR_DAO;
    public static final PostClassDao POST_CLASS_DAO;
    public static final PostDao POST_DAO;
    public static final ReplyDao REPLY_DAO;
    public static final UserDao USER_DAO;
}
