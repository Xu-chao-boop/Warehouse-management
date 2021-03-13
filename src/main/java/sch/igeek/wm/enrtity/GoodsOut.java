package sch.igeek.wm.enrtity;

import java.util.Date;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/3/11 18:42
 */
public class GoodsOut {

    private Integer xulie;
    private Integer id;
    private String name;
    private String type;
    private String specification;
    private String warehouse;
    private int number;
    private String custom;
    private Date outtime;
    private String username;
    private Integer gid;


    public GoodsOut() {
    }

    public GoodsOut(Integer id, String name, String type, String specification, String warehouse, int number, String custom, Date outtime, String username, Integer gid) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.specification = specification;
        this.warehouse = warehouse;
        this.number = number;
        this.custom = custom;
        this.outtime = outtime;
        this.username = username;
        this.gid = gid;
    }

    /**
     * 获取
     * @return xulie
     */
    public Integer getXulie() {
        return xulie;
    }

    /**
     * 设置
     * @param xulie
     */
    public void setXulie(Integer xulie) {
        this.xulie = xulie;
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
     * @return custom
     */
    public String getCustom() {
        return custom;
    }

    /**
     * 设置
     * @param custom
     */
    public void setCustom(String custom) {
        this.custom = custom;
    }

    /**
     * 获取
     * @return outtime
     */
    public Date getOuttime() {
        return outtime;
    }

    /**
     * 设置
     * @param outtime
     */
    public void setOuttime(Date outtime) {
        this.outtime = outtime;
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

    public String toString() {
        return "GoodsOut{xulie = " + xulie + ", id = " + id + ", name = " + name + ", type = " + type + ", specification = " + specification + ", warehouse = " + warehouse + ", number = " + number + ", custom = " + custom + ", outtime = " + outtime + ", username = " + username + ", gid = " + gid + "}";
    }
}
