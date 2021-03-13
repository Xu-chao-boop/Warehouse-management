package sch.igeek.wm.dao;

import sch.igeek.wm.enrtity.Admin;
import sch.igeek.wm.enrtity.User;

import java.sql.SQLException;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/30 23:04
 */
public class AdminDao extends BaseDao<Admin> {


    //查询用户数据，登录
    public Admin selectOne(Integer id , String pwd) throws SQLException {
        Admin admin = this.getBean("select * from admin where id = ? and password = ?",
                Admin.class, id, pwd);
        return admin;
    }


}
