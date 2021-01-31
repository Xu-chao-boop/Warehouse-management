package sch.igeek.wm.service;

import sch.igeek.wm.dao.AdminDao;
import sch.igeek.wm.enrtity.Admin;
import sch.igeek.wm.utils.DataSourceUtils;

import java.sql.SQLException;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/30 23:06
 */
public class AdminService {

    private AdminDao adminDao = new AdminDao();

    //管理员注册
    public boolean regist(Admin admin) {
        try {
            return adminDao.insert(admin)>0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DataSourceUtils.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    //管理员登录
    public Admin login(Integer id , String pwd){
        try {
            Admin admin = adminDao.selectOne(id, pwd);
            return admin;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DataSourceUtils.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }


}
