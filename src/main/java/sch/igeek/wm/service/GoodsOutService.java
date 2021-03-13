package sch.igeek.wm.service;

import sch.igeek.wm.dao.GoodsDao;
import sch.igeek.wm.dao.GoodsOutDao;
import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.GoodsOut;
import sch.igeek.wm.vo.PageVo;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/3/11 18:51
 */
public class GoodsOutService {

    private GoodsOutDao dao = new GoodsOutDao();

    //货物出库
    public boolean redu(GoodsOut goodsOut) {
        // boolean flag = this.validate(goods.getName());

        try {
            return dao.insert(goodsOut) >0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    //分页 + 条件模糊查询
    public PageVo<GoodsOut> viewAll(String query , int pageNow){
        PageVo<GoodsOut> vo = null;
        try {
            //获得总记录数
            Long counts = dao.selectCounts(query);
            //计算总页数
            int myPages = (int)(counts%5==0 ? counts/5.0 : Math.ceil(counts/5.0));
            //计算每页的起始值
            int begin = (pageNow - 1)*5;
            //获得查询数据
            List<GoodsOut> list = dao.selectAll(query, begin);
            //封装
            vo = new PageVo<>(query,pageNow,myPages,list);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }


    //删除出库记录
    public void delete(Integer[] ids) {
        for (Integer id : ids) {
            try {
                dao.delete(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //校验货物id是否存在
    public boolean validate(Integer id){
        try {
            Long one = dao.selectOne(id);
            //若为true则存在 ， 若为false则不存在
            return one > 0 ? false : true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    //校验出库货物数量是否合理
    public Integer validateNum(Integer id,Integer number) {
        try {
            Integer numer1 = dao.selectNumer(id);
            return numer1-number;
        } catch (SQLException e) {
            e.printStackTrace();
        }
       return 0;
    }




}
