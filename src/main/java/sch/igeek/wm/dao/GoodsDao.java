package sch.igeek.wm.dao;

import sch.igeek.wm.enrtity.Goods;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/2/25 14:58
 */
public class GoodsDao extends BaseDao<Goods> {

     //货物入库
     public int insert(Goods goods) throws SQLException {
         String sql = "insert into goods values(null,?,?,?,?,?,?,?,?,?,?,1)";
         int i = this.update(sql,goods.getName(),goods.getType(),goods.getSpecification(),
                 goods.getWarehouse(),goods.getNumber(),goods.getDingdan(),
                 goods.getSupplier(),goods.getEntertime(),goods.getUsername(),goods.getGid());
         return i;
     }

    //条件模糊查询货物表的记录总数
    public Long selectCounts(String query) throws SQLException {
        String sql = "select count(*) from goods where name like concat('%',?,'%')";
        Long value = (Long)this.getSingleValue(sql, query);
        return value;
    }

    //分页+条件模糊查询商品表的所有信息
    public List<Goods> selectAll(String query , int begin) throws SQLException {
        String sql = "select * from goods where name like concat('%',?,'%') limit ?,5";
        List<Goods> goodsList = this.getBeanList(sql, Goods.class, query, begin);
        return goodsList;
    }

    //条件模糊查询一号仓库货物表的记录总数
    public Long selectOneCounts(String query) throws SQLException {
        String sql = "select count(*) from goods where name like concat('%',?,'%') and gid = 1";
        Long value = (Long)this.getSingleValue(sql, query);
        return value;
    }

    //分页+条件模糊查询一号仓库商品表的所有信息
    public List<Goods> selectOneAll(String query , int begin) throws SQLException {
        String sql = "select * from goods where name like concat('%',?,'%')  and gid = 1 limit ?,5";
        List<Goods> goodsList = this.getBeanList(sql, Goods.class, query, begin);
        return goodsList;
    }

    //条件模糊查询二号仓库货物表的记录总数
    public Long selectTwoCounts(String query) throws SQLException {
        String sql = "select count(*) from goods where name like concat('%',?,'%') and gid = 2";
        Long value = (Long)this.getSingleValue(sql, query);
        return value;
    }

    //分页+条件模糊查询二号仓库商品表的所有信息
    public List<Goods> selectTwoAll(String query , int begin) throws SQLException {
        String sql = "select * from goods where name like concat('%',?,'%')  and gid = 2 limit ?,5";
        List<Goods> goodsList = this.getBeanList(sql, Goods.class, query, begin);
        return goodsList;
    }

    //条件模糊查询三号仓库货物表的记录总数
    public Long selectThreeCounts(String query) throws SQLException {
        String sql = "select count(*) from goods where name like concat('%',?,'%') and gid = 3";
        Long value = (Long)this.getSingleValue(sql, query);
        return value;
    }

    //分页+条件模糊查询三号仓库商品表的所有信息
    public List<Goods> selectThreeAll(String query , int begin) throws SQLException {
        String sql = "select * from goods where name like concat('%',?,'%')  and gid = 3 limit ?,5";
        List<Goods> goodsList = this.getBeanList(sql, Goods.class, query, begin);
        return goodsList;
    }

    //通过id查询单个货物信息
    public Goods selectOne(Integer id) throws SQLException {
        String sql = "select * from goods where id = ?";
        Goods goods = this.getBean(sql, Goods.class, id);
        return goods;
    }

    //通过商品名称查询信息  精确查询
    public Goods selectOneByName(String name) throws SQLException {
        String sql = "select * from goods where name = ?";
        Goods goods = this.getBean(sql, Goods.class, name);
        return goods;
    }

    //修改货物信息
    public int update(Goods goods) throws SQLException {
        String sql = "update goods set name = ? , type = ? , specification = ? ," +
                "number = ? , supplier = ? ,entertime = ? where id = ?";
        int i = this.update(sql, goods.getName(), goods.getType(), goods.getSpecification(),
                goods.getNumber(), goods.getSupplier(),goods.getEntertime(), goods.getId());
        return i;
    }

    //删除货物
    public int delete(Integer id) throws SQLException {
        String sql = "delete from goods where id = ?";
        int i = this.update(sql, id);
        return i;
    }


    //条件模糊查询货物表的记录总数 + 入库记录
    public Long selectEnterCounts(String query) throws SQLException {
        String sql = "select count(*) from goods where warehouse like concat('%',?,'%') and state = 1";
        Long value = (Long)this.getSingleValue(sql, query);
        return value;
    }

    //分页+条件模糊查询商品表的所有信息 + 入库记录
    public List<Goods> selectEnterAll(String query , int begin) throws SQLException {
        String sql = "select * from goods where warehouse like concat('%',?,'%') and state = 1 limit ?,5";
        List<Goods> goodsList = this.getBeanList(sql, Goods.class, query, begin);
        return goodsList;
    }

    //修改入库货物状态为0
    public int updateState(Integer id) throws SQLException {
        String sql = "update goods set state = 0 where id = ?";
        int i = this.update(sql,id);
        return i;
    }

    //修改入库货物数量
    public int updateNum(Integer num,Integer id) throws SQLException {
        String sql = "update goods set number = ? where id = ?";
        int i = this.update(sql,num,id);
        return i;
    }


}
