package sch.igeek.wm.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import sch.igeek.wm.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/30 23:01
 */
public class BaseDao<T> {

    private QueryRunner runner = new QueryRunner();

    //增删改
    public int update(String sql,Object...params) throws SQLException {
        int i = runner.update(DataSourceUtils.getConnection(), sql, params);
        return i;
    }

    //查询单行单列的值
    public Object getSingleValue(String sql,Object...params) throws SQLException {
        return runner.query(DataSourceUtils.getConnection(),sql,new ScalarHandler(),params);
    }

    //查询列表
    public List<T> getBeanList(String sql, Class<T> clazz, Object...params) throws SQLException {
        return  runner.query(DataSourceUtils.getConnection(),sql,new BeanListHandler<>(clazz),params);

    }

    //查询单个对象
    public T getBean(String sql , Class<T> clazz , Object...params) throws SQLException {
        return runner.query(DataSourceUtils.getConnection(),sql,new BeanHandler<>(clazz),params);
    }
}
