package sch.igeek.wm.service;

import sch.igeek.wm.dao.UserDao;
import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.User;
import sch.igeek.wm.vo.PageVo;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/30 23:06
 */
public class UserService {

    private UserDao userDao = new UserDao();

    //用户注册
    public boolean regist(Integer id,String name,String password,String phone,String email,String beizhu) {

            try {
                return userDao.insert(id,name,password,phone,email,beizhu) >0 ? true : false;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        return false;
    }

    //校验用户id是否存在
    public boolean validate(Integer id){
        try {
            Long one = userDao.selectOne(id);
            //若为true则存在 ， 若为false则不存在
            return one > 0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    //用户登录
    public User login(Integer id , String pwd){
        try {
            User admin = userDao.selectOne(id, pwd);
            return admin;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //修改密码
    public boolean updatePass(String oldPwd , String newPwd , Integer id){
        try {
           return userDao.updatePwd(newPwd, oldPwd ,id)>0 ? true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    //分页 + 条件模糊查询
    public PageVo<User> viewAll(String query , int pageNow){
        PageVo<User> vo = null;
        try {
            //获得总记录数
            Long counts = userDao.selectCounts(query);
            //计算总页数
            int myPages = (int)(counts%5==0 ? counts/5.0 : Math.ceil(counts/5.0));
            //计算每页的起始值
            int begin = (pageNow - 1)*5;
            //获得查询数据
            List<User> list = userDao.selectAll(query, begin);
            //封装
            vo = new PageVo<>(query,pageNow,myPages,list);
            //System.out.println("vo = "+vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //删除用户
    public void delete(Integer id) {
        try {
            userDao.delete(id);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    //更新用户信息
    public boolean update(User user){
        try {
            return userDao.update(user) >0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //更新失败
        return false;
    }


}
