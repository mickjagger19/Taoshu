package com.mick.manager.pojo;

import java.io.Serializable;

public class OrderfromProduct implements Serializable {
    private Integer opId;

    private Integer oId;

    private Integer pId;

    private static final long serialVersionUID = 1L;

    public Integer getOpId() {
        return opId;
    }

    public void setOpId(Integer opId) {
        this.opId = opId;
    }

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }
}