package sch.igeek.wm.enrtity;

import java.util.Date;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/2/25 13:56
 */
public class Goods {

    private Integer id;
    private String name;
    private String type;
    private String specification;
    private String warehouse;
    private int number;
    private int dingdan;
    private String supplier;
    private Date entertime;
    private String username;
    private Integer gid;
    private Integer state;


    public Goods() {
    }

    public Goods( String name, String type, String specification, String warehouse, int number, int dingdan, String supplier, Date entertime, String username, Integer gid) {
        this.name = name;
        this.type = type;
        this.specification = specification;
        this.warehouse = warehouse;
        this.number = number;
        this.dingdan = dingdan;
        this.supplier = supplier;
        this.entertime = entertime;
        this.username = username;
        this.gid = gid;

    }

    public Goods(Integer id, String name, String type, String specification, String warehouse, int number, String supplier, Date entertime, String username, Integer gid, Integer state) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.specification = specification;
        this.warehouse = warehouse;
        this.number = number;
        this.supplier = supplier;
        this.entertime = entertime;
        this.username = username;
        this.gid = gid;
        this.state = state;
    }

    public Goods( String name, String type, String specification, String warehouse, int number, String supplier, Date entertime, String username, Integer gid) {
        this.name = name;
        this.type = type;
        this.specification = specification;
        this.warehouse = warehouse;
        this.number = number;
        this.supplier = supplier;
        this.entertime = entertime;
        this.username = username;
        this.gid = gid;
    }
    public Goods(String name, String type, String specification, String warehouse, int number, String supplier, Date entertime, Integer gid) {
        this.name = name;
        this.type = type;
        this.specification = specification;
        this.warehouse = warehouse;
        this.number = number;
        this.supplier = supplier;
        this.entertime = entertime;
        this.gid = gid;
    }

    public Goods(Integer id, String name, String type, String specification, int number, String supplier, Date entertime) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.specification = specification;
        this.number = number;
        this.supplier = supplier;
        this.entertime = entertime;

    }

    /**
     * 获取
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     * @return type
     */
    public String getType() {
        return type;
    }

    /**
     * 设置
     * @param type
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取
     * @return specification
     */
    public String getSpecification() {
        return specification;
    }

    /**
     * 设置
     * @param specification
     */
    public void setSpecification(String specification) {
        this.specification = specification;
    }

    /**
     * 获取
     * @return warehouse
     */
    public String getWarehouse() {
        return warehouse;
    }

    /**
     * 设置
     * @param warehouse
     */
    public void setWarehouse(String warehouse) {
        this.warehouse = warehouse;
    }

    /**
     * 获取
     * @return number
     */
    public int getNumber() {
        return number;
    }

    /**
     * 设置
     * @param number
     */
    public void setNumber(int number) {
        this.number = number;
    }

    /**
     * 获取
     * @return dingdan
     */
    public int getDingdan() {
        return dingdan;
    }

    /**
     * 设置
     * @param dingdan
     */
    public void setDingdan(int dingdan) {
        this.dingdan = dingdan;
    }

    /**
     * 获取
     * @return supplier
     */
    public String getSupplier() {
        return supplier;
    }

    /**
     * 设置
     * @param supplier
     */
    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    /**
     * 获取
     * @return entertime
     */
    public Date getEntertime() {
        return entertime;
    }

    /**
     * 设置
     * @param entertime
     */
    public void setEntertime(Date entertime) {
        this.entertime = entertime;
    }

    /**
     * 获取
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取
     * @return gid
     */
    public Integer getGid() {
        return gid;
    }

    /**
     * 设置
     * @param gid
     */
    public void setGid(Integer gid) {
        this.gid = gid;
    }

    /**
     * 获取
     * @return state
     */
    public Integer getState() {
        return state;
    }

    /**
     * 设置
     * @param state
     */
    public void setState(Integer state) {
        this.state = state;
    }

    public String toString() {
        return "Goods{id = " + id + ", name = " + name + ", type = " + type + ", specification = " + specification + ", warehouse = " + warehouse + ", number = " + number + ", dingdan = " + dingdan + ", supplier = " + supplier + ", entertime = " + entertime + ", username = " + username + ", gid = " + gid + ", state = " + state + "}";
    }
}
