package sch.igeek.wm.service;

import sch.igeek.wm.dao.AdminDao;
import sch.igeek.wm.dao.UserDao;
import sch.igeek.wm.enrtity.Admin;
import sch.igeek.wm.enrtity.User;

import java.sql.SQLException;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/30 23:06
 */
public class AdminService {

    private AdminDao adminDao = new AdminDao();


    //管理员登录
    public Admin login(Integer id , String pwd){
        try {
            Admin admin = adminDao.selectOne(id, pwd);
            return admin;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
