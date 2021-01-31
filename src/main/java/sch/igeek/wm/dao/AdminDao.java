package sch.igeek.wm.dao;

import sch.igeek.wm.enrtity.Admin;

import java.sql.SQLException;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/30 23:04
 */
public class AdminDao extends BaseDao<Admin> {

    //插入管理员数据，注册
    public int insert(Admin admin) throws SQLException {
        String sql = "insert into user values(?,?)";
        int i = this.update(sql, admin.getId(), admin.getPassword());
        return i;
    }

    //查询管理员数据，登录
    public Admin selectOne(Integer id , String pwd) throws SQLException {
        Admin admin = this.getBean("select * from admin where id = ? and password = ?",
                Admin.class, id, pwd);
        return admin;
    }

}
