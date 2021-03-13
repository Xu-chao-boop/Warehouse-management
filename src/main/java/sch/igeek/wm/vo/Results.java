package sch.igeek.wm.vo;

import java.io.Serializable;

/**
 * 返回数据结果
 */
public class Results implements Serializable {
    /**
     * 业务响应吗
     */
    private Integer code = 200;
    /**
     * 业务消息
     */
    private String msg = "SUCCESS";
    /**
     * 业务数据
     */
    private Object data;

    /**
     * 出现错误，提示错误码和错误消息
     * @param codeMsg
     */
    public Results(CodeMsg codeMsg){
        this.code = codeMsg.code;
        this.msg = codeMsg.msg;
    }

    /**
     * 业务正确，不需要返回数据
     */
    public Results(){

    }

    /**
     * 业务正常，需要返回数据
     * @param data
     */
    public Results(Object data){
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
