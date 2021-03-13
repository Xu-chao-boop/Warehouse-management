package sch.igeek.wm.dao;

import sch.igeek.wm.enrtity.Customer;
import sch.igeek.wm.enrtity.Supplier;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/3/12 13:38
 */
public class CustomerDao extends BaseDao<Customer> {

    //插入供应商数据，注册
    public int insert(String customer,String name,String phone) throws SQLException {
        String sql = "insert into customer values(null,?,?,?)";
        int i = this.update(sql,customer,name,phone);
        return i;
    }

    //条件模糊查询供应商的记录总数
    public Long selectCounts(String query) throws SQLException {
        String sql = "select count(*) from customer where customer like concat('%',?,'%')";
        Long value = (Long)this.getSingleValue(sql, query);
        return value;
    }

    //分页+条件模糊查询供应商的所有信息
    public List<Customer> selectAll(String query , int begin) throws SQLException {
        String sql = "select * from customer where customer like concat('%',?,'%') limit ?,5";
        List<Customer> customerList = this.getBeanList(sql, Customer.class, query, begin);
        return customerList;
    }

    //删除供应商
    public int delete(Integer id) throws SQLException {
        String sql = "delete from customer where id = ?";
        int i = this.update(sql, id);
        return i;
    }

    //通过id查询单个供应商信息
    public Customer selectOne(Integer id) throws SQLException {
        String sql = "select * from customer where id = ?";
        Customer customer = this.getBean(sql, Customer.class, id);
        return customer;
    }

    //修改供应商信息
    public int update(Customer customer) throws SQLException {
        String sql = "update customer set customer = ? , name = ? , phone = ? where id = ?";
        int i = this.update(sql, customer.getCustomer(), customer.getName(), customer.getPhone(),customer.getId());
        return i;
    }
}
