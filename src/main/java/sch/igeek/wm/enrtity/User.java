package sch.igeek.wm.enrtity;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/30 23:00
 */
public class User {

    private Integer id;
    private String name;
    private String password;
    private String phone;
    private String email;
    private String beizhu;


    public User() {
    }

    public User(Integer id, String name, String password, String phone, String email, String beizhu) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.beizhu = beizhu;
    }

    public User(Integer id,String name, String phone, String email, String beizhu) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.beizhu = beizhu;
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

    /**
     * 获取
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取
     * @return beizhu
     */
    public String getBeizhu() {
        return beizhu;
    }

    /**
     * 设置
     * @param beizhu
     */
    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public String toString() {
        return "User{id = " + id + ", name = " + name + ", password = " + password + ", phone = " + phone + ", email = " + email + ", beizhu = " + beizhu + "}";
    }
}
