package sch.igeek.wm.dao;

import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.User;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/30 23:04
 */
public class UserDao extends BaseDao<User> {

    //插入用户数据，注册
    public int insert(Integer id,String name,String password,String phone,String email,String beizhu) throws SQLException {
        String sql = "insert into user values(?,?,?,?,?,?)";
        int i = this.update(sql,id,name,password,phone,email,beizhu);
        return i;
    }

    //查询用户数据，登录
    public User selectOne(Integer id , String pwd) throws SQLException {
        User admin = this.getBean("select * from user where id = ? and password = ?",
                User.class, id, pwd);
        return admin;
    }

    //通过id查询信息
    public Long selectOne(Integer id) throws SQLException {
        String sql = "select count(*) from user where id=?";
        Long value = (Long)this.getSingleValue(sql, id);
        return value;
    }

    //通过原id修改密码
    public int updatePwd(String oldPwd , String newPwd ,Integer id) throws SQLException {
        String sql = "update user set password = ? where password = ? and id = ?";
        int i = this.update(sql, newPwd, oldPwd,id);
        return i;
    }

    //条件模糊查询用户的记录总数
    public Long selectCounts(String query) throws SQLException {
        String sql = "select count(*) from user where name like concat('%',?,'%')";
        Long value = (Long)this.getSingleValue(sql, query);
        return value;
    }

    //分页+条件模糊查询商品表的所有信息
    public List<User> selectAll(String query , int begin) throws SQLException {
        String sql = "select * from user where name like concat('%',?,'%') limit ?,5";
        List<User> usersList = this.getBeanList(sql, User.class, query, begin);
        return usersList;
    }

    //删除用户
    public int delete(Integer id) throws SQLException {
        String sql = "delete from user where id = ?";
        int i = this.update(sql, id);
        return i;
    }

    //修改用户信息
    public int update(User user) throws SQLException {
        String sql = "update user set name = ? , phone = ? , email = ? ,beizhu = ? where id = ?";
        int i = this.update(sql, user.getName(), user.getPhone(), user.getEmail(),
                user.getBeizhu(), user.getId());
        return i;
    }

}
