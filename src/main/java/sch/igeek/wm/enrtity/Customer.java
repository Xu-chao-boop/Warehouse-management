package sch.igeek.wm.enrtity;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/3/12 18:57
 */
public class Customer {

    private Integer id;
    private String customer;
    private String name;
    private String phone;


    public Customer() {
    }

    public Customer(Integer id, String customer, String name, String phone) {
        this.id = id;
        this.customer = customer;
        this.name = name;
        this.phone = phone;
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
     * @return customer
     */
    public String getCustomer() {
        return customer;
    }

    /**
     * 设置
     * @param customer
     */
    public void setCustomer(String customer) {
        this.customer = customer;
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

    public String toString() {
        return "Customer{id = " + id + ", customer = " + customer + ", name = " + name + ", phone = " + phone + "}";
    }
}
