package com.company.bean;

import java.util.HashMap;
import java.util.Map;

public class msg {
    private int code;

    private String msg;

    private Map<String,Object> extend = new HashMap<String,Object>();

    //使用extend存储数据值
    public msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }//返回msg code.msg.extend里存储的是访问的信息
    public static msg success(){
        msg result = new msg();
        result.setMsg("处理成功");
        result.setCode(100);
        return result;
    }

    public static msg fail(){
        msg result = new msg();
        result.setMsg("处理失败");
        result.setCode(200);
        return result;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
