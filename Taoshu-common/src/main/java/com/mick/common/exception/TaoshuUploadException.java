package com.mick.common.exception;


public class TaoshuUploadException extends RuntimeException {

    private String msg;

    public TaoshuUploadException(String msg){
        super(msg);
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
