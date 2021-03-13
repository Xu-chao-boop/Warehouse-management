package sch.igeek.wm.service;

import sch.igeek.wm.dao.GoodsDao;
import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.utils.DataSourceUtils;
import sch.igeek.wm.vo.PageVo;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/2/25 15:53
 */
public class GoodsService {

    private GoodsDao goodsDao = new GoodsDao();

    //货物进库
    public boolean add(Goods goods) {

        try {
            return goodsDao.insert(goods) > 0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    //分页 + 条件模糊查询
    public PageVo<Goods> viewAll(String query, int pageNow) {
        PageVo<Goods> vo = null;
        try {
            //获得总记录数
            Long counts = goodsDao.selectCounts(query);
            //计算总页数
            int myPages = (int) (counts % 5 == 0 ? counts / 5.0 : Math.ceil(counts / 5.0));
            //计算每页的起始值
            int begin = (pageNow - 1) * 5;
            //获得查询数据
            List<Goods> list = goodsDao.selectAll(query, begin);
            //封装
            vo = new PageVo<>(query, pageNow, myPages, list);
            //System.out.println("vo = "+vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //分页 + 一号仓库
    public PageVo<Goods> viewOneHouse(String query, int pageNow) {
        PageVo<Goods> vo = null;
        try {
            //获得总记录数
            Long counts = goodsDao.selectOneCounts(query);
            //计算总页数
            int myPages = (int) (counts % 5 == 0 ? counts / 5.0 : Math.ceil(counts / 5.0));
            //计算每页的起始值
            int begin = (pageNow - 1) * 5;
            //获得查询数据
            List<Goods> list = goodsDao.selectOneAll(query, begin);
            //封装
            vo = new PageVo<>(query, pageNow, myPages, list);
            //System.out.println("vo = "+vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //分页 + 二号仓库
    public PageVo<Goods> viewTwoHouse(String query, int pageNow) {
        PageVo<Goods> vo = null;
        try {
            //获得总记录数
            Long counts = goodsDao.selectTwoCounts(query);
            //计算总页数
            int myPages = (int) (counts % 5 == 0 ? counts / 5.0 : Math.ceil(counts / 5.0));
            //计算每页的起始值
            int begin = (pageNow - 1) * 5;
            //获得查询数据
            List<Goods> list = goodsDao.selectTwoAll(query, begin);
            //封装
            vo = new PageVo<>(query, pageNow, myPages, list);
            //System.out.println("vo = "+vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //分页 + 二号仓库
    public PageVo<Goods> viewThreeHouse(String query, int pageNow) {
        PageVo<Goods> vo = null;
        try {
            //获得总记录数
            Long counts = goodsDao.selectThreeCounts(query);
            //计算总页数
            int myPages = (int) (counts % 5 == 0 ? counts / 5.0 : Math.ceil(counts / 5.0));
            //计算每页的起始值
            int begin = (pageNow - 1) * 5;
            //获得查询数据
            List<Goods> list = goodsDao.selectThreeAll(query, begin);
            //封装
            vo = new PageVo<>(query, pageNow, myPages, list);
            //System.out.println("vo = "+vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //校验货物名称是否存在
    public boolean validate(String name) {
        try {
            Goods goods = goodsDao.selectOneByName(name);
            if (goods != null) {
                return false;  //当前商品名称已使用，则不能使用
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;  //当前货物名称未使用，则可以使用
    }

    //通过id查询商品
    public Goods viewOne(Integer id) {
        try {
            return goodsDao.selectOne(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //更新商品信息
    public boolean update(Goods goods) {
        //数据库中原商品的名称
        String oldName = this.viewOne(goods.getId()).getName();
        //从表单中提交来的商品名称
        String newName = goods.getName();
        boolean flag = true;
        if (!oldName.equals(newName)) {
            //更新商品名称，需要做校验
            flag = this.validate(goods.getName());
        }
        if (flag) {
            //更新
            try {
                int i = goodsDao.update(goods);
                if (i > 0) {
                    //更新成功
                    return true;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //更新失败
        return false;
    }

    //删除货物
    public void delete(Integer[] ids) {
        for (Integer id : ids) {
            try {
                goodsDao.delete(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    //分页 + 条件模糊查询 + 入库记录
    public PageVo<Goods> viewEnter(String query, int pageNow) {
        PageVo<Goods> vo = null;
        try {
            //获得总记录数
            Long counts = goodsDao.selectEnterCounts(query);
            //计算总页数
            int myPages = (int) (counts % 5 == 0 ? counts / 5.0 : Math.ceil(counts / 5.0));
            //计算每页的起始值
            int begin = (pageNow - 1) * 5;
            //获得查询数据
            List<Goods> list = goodsDao.selectEnterAll(query, begin);
            //封装
            vo = new PageVo<>(query, pageNow, myPages, list);
            //System.out.println("vo = "+vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //更新入库货物状态为0
    public boolean updateState(Integer[] ids) {

        for (Integer id : ids) {
            try {
                return goodsDao.updateState(id) > 0 ? true : false;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    //更新入库货物数量
    public boolean updateNum(Integer num,Integer id) {

            try {
                return goodsDao.updateNum(num,id) > 0 ? true : false;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        return false;
    }

    public void deleteById(Integer id) {
        try {
            goodsDao.delete(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}