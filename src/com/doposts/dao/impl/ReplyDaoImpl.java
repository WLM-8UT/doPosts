package com.doposts.dao.impl;

import com.doposts.dao.CrudHandler;
import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.interfaces.ReplyDao;
import com.doposts.entity.Floor;
import com.doposts.entity.Post;
import com.doposts.entity.Reply;
import com.doposts.vo.SuperReply;
import com.dxhualuo.database.handler.base.SuperCrudHandler;
import com.dxhualuo.database.handler.interfaces.DatabaseCrud;
import com.dxhualuo.database.handler.interfaces.SuperCrud;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *  回复的消息DAO的实现
 * @author dx_hualuo
 */
public class ReplyDaoImpl implements ReplyDao {
    SuperCrud<Reply> crud;
    DatabaseCrud basicCrud;

    public ReplyDaoImpl(){
        this.crud = CrudHandler.replyCrud;
        this.basicCrud = PostItDatabase.getCRUD();
    }

    /**
     * 获取所有回复信息
     *
     * @param floorId 楼层ID
     * @return 回复信息
     */
    @Override
    public List<SuperReply> getReplyListById(Integer floorId) {
        try {
            return crud.executeQueryToBeanList("SELECT\n" +
                    "\treply.*, \n" +
                    "\t`user`.userName AS replyUserName\n," +
                    "\t`user`.favicon AS replyFavicon\n" +
                    "FROM\n" +
                    "\treply\n" +
                    "\tLEFT JOIN\n" +
                    "\t`user`\n" +
                    "\tON \n" +
                    "\t\treply.replyUserId = `user`.userId\n" +
                    "WHERE\n" +
                    "\treply.floorId = ?", SuperReply.class, floorId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 评论回复
     *
     * @param reply 回复数据
     * @return 返回Id
     */
    @Override
    public Integer insertReply(Reply reply) {
        DatabaseCrud transactionCrud = basicCrud.getTransactionCrud();
        try {
            if(new SuperCrudHandler<>(transactionCrud).insert(reply) == 1){
                ResultSet rs = transactionCrud.executeQuery("select @@IDENTITY");
                if(rs.next()){
                    return rs.getInt(1);
                }
                throw new RuntimeException();
            }
            throw new RuntimeException("插入失败！受影响行数为0！");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            transactionCrud.getConnectionManager().closeConnection();
        }
    }
}
