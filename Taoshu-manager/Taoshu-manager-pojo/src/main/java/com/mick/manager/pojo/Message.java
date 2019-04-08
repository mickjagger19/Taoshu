package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {
    private Integer mId;

    private Integer u1Id;

    private Integer u2Id;

    private String message;

    private Date time;

    private static final long serialVersionUID = 1L;

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Integer getU1Id() {
        return u1Id;
    }

    public void setU1Id(Integer u1Id) {
        this.u1Id = u1Id;
    }

    public Integer getU2Id() {
        return u2Id;
    }

    public void setU2Id(Integer u2Id) {
        this.u2Id = u2Id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}