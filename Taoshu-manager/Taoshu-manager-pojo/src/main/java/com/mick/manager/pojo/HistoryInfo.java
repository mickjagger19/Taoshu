package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class HistoryInfo implements Serializable {
    private Integer hId;

    private Date gTime;

    private Integer uId;

    private Integer pId;

    private Integer hStates;

    private static final long serialVersionUID = 1L;

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public Date getgTime() {
        return gTime;
    }

    public void setgTime(Date gTime) {
        this.gTime = gTime;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer gethStates() {
        return hStates;
    }

    public void sethStates(Integer hStates) {
        this.hStates = hStates;
    }
}