package sch.igeek.wm.enrtity;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/30 23:00
 */
public class Admin {

    private Integer id;
    private String password;

    public Admin() {
    }

    public Admin(Integer id, String password) {
        this.id = id;
        this.password = password;
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
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    public String toString() {
        return "Admin{id = " + id + ", password = " + password + "}";
    }
}
