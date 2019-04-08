package com.mick.common.exception;


public class TaoshuException extends RuntimeException {

    private String msg;

    public TaoshuException(String msg){
        super(msg);
        this.msg=msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
