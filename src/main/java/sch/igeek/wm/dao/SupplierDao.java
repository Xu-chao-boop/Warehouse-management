package sch.igeek.wm.dao;

import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.Supplier;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/3/12 13:38
 */
public class SupplierDao extends BaseDao<Supplier> {

    //插入供应商数据，注册
    public int insert(String company,String name,String phone) throws SQLException {
        String sql = "insert into supplier values(null,?,?,?)";
        int i = this.update(sql,company,name,phone);
        return i;
    }

    //条件模糊查询供应商的记录总数
    public Long selectCounts(String query) throws SQLException {
        String sql = "select count(*) from supplier where company like concat('%',?,'%')";
        Long value = (Long)this.getSingleValue(sql, query);
        return value;
    }

    //分页+条件模糊查询供应商的所有信息
    public List<Supplier> selectAll(String query , int begin) throws SQLException {
        String sql = "select * from supplier where company like concat('%',?,'%') limit ?,5";
        List<Supplier> supplierList = this.getBeanList(sql, Supplier.class, query, begin);
        return supplierList;
    }

    //删除供应商
    public int delete(Integer id) throws SQLException {
        String sql = "delete from supplier where id = ?";
        int i = this.update(sql, id);
        return i;
    }

    //通过id查询单个供应商信息
    public Supplier selectOne(Integer id) throws SQLException {
        String sql = "select * from supplier where id = ?";
        Supplier supplier = this.getBean(sql, Supplier.class, id);
        return supplier;
    }

    //修改供应商信息
    public int update(Supplier supplier) throws SQLException {
        String sql = "update supplier set company = ? , name = ? , phone = ? where id = ?";
        int i = this.update(sql, supplier.getCompany(), supplier.getName(), supplier.getPhone(),supplier.getId());
        return i;
    }
}
