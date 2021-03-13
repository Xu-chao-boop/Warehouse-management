package sch.igeek.wm.service;

import sch.igeek.wm.dao.SupplierDao;
import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.Supplier;
import sch.igeek.wm.vo.PageVo;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/3/12 13:40
 */
public class SupplierService {

    private SupplierDao dao = new SupplierDao();

    //添加供应商
    public boolean regist(String company,String name,String phone) {

        try {
            return dao.insert(company,name,phone) >0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    //分页 + 条件模糊查询
    public PageVo<Supplier> viewAll(String query, int pageNow) {
        PageVo<Supplier> vo = null;
        try {
            //获得总记录数
            Long counts = dao.selectCounts(query);
            //计算总页数
            int myPages = (int) (counts % 5 == 0 ? counts / 5.0 : Math.ceil(counts / 5.0));
            //计算每页的起始值
            int begin = (pageNow - 1) * 5;
            //获得查询数据
            List<Supplier> list =dao.selectAll(query, begin);
            //封装
            vo = new PageVo<>(query, pageNow, myPages, list);
            //System.out.println("vo = "+vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }


    //删除供应商
    public void delete(Integer id) {
        try {
            dao.delete(id);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //通过id查询供应商
    public Supplier viewOne(Integer id) {
        try {
            return dao.selectOne(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //更新供应商信息
    public boolean update(Supplier supplier) {
            try {
                return dao.update(supplier) > 0 ? true:false;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        //更新失败
        return false;
    }

}
