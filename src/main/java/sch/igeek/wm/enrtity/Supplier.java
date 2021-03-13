package sch.igeek.wm.enrtity;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/3/12 10:50
 */
public class Supplier {

    private Integer id;
    private String company;
    private String name;
    private String phone;


    public Supplier() {
    }

    public Supplier(Integer id, String company, String name, String phone) {
        this.id = id;
        this.company = company;
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
     * @return company
     */
    public String getCompany() {
        return company;
    }

    /**
     * 设置
     * @param company
     */
    public void setCompany(String company) {
        this.company = company;
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
        return "Supplier{id = " + id + ", company = " + company + ", name = " + name + ", phone = " + phone + "}";
    }
}
