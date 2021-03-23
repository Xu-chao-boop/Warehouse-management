package sch.igeek.wm.dao;

import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.GoodsOut;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/3/11 18:45
 */
public class GoodsOutDao extends BaseDao<GoodsOut> {

    //出库货物插入表中
    public int insert(GoodsOut goodsOut) throws SQLException {
        String sql = "insert into goodsout values(null,?,?,?,?,?,?,?,?,?,?)";
        int i = this.update(sql,goodsOut.getId(),goodsOut.getName(),goodsOut.getType(),goodsOut.getSpecification(),
                goodsOut.getWarehouse(),goodsOut.getNumber(),goodsOut.getCustom(),goodsOut.getOuttime(),goodsOut.getUsername(),goodsOut.getGid());
        return i;
    }

    //条件模糊查询货物表的记录总数
    public Long selectCounts(String query) throws SQLException {
        String sql = "select count(*) from goodsout where warehouse like concat('%',?,'%')";
        Long value = (Long)this.getSingleValue(sql, query);
        return value;
    }

    //分页+条件模糊查询商品表的所有信息
    public List<GoodsOut> selectAll(String query , int begin) throws SQLException {
        String sql = "select * from goodsout where warehouse like concat('%',?,'%') limit ?,5";
        List<GoodsOut> goodsOutList = this.getBeanList(sql, GoodsOut.class, query, begin);
        return goodsOutList;
    }

    //删除出库货物记录
    public int delete(Integer id) throws SQLException {
        String sql = "delete from goodsout where xulie = ?";
        int i = this.update(sql, id);
        return i;
    }

    //通过id查询库存中是否有此id的商品信息
    public Long selectOne(Integer id) throws SQLException {
        String sql = "select count(*) from goods where id=?";
        Long value = (Long)this.getSingleValue(sql, id);
        return value;
    }

    //通过id查询单个货物数量
    public Integer selectNumer(Integer id) throws SQLException {
        String sql = "select number from goods where id = ?";
        Integer i = (Integer) this.getSingleValue(sql, id);
        return i;
    }


}
