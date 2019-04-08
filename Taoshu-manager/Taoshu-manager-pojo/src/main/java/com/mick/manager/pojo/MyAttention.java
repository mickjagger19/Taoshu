package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class MyAttention implements Serializable {
    private Integer maId;

    private Date maTime;

    private Integer pId;

    private Integer uId;

    private Integer maStates;

    private Product product;

    private static final long serialVersionUID = 1L;

    public MyAttention() {
    }

    public MyAttention(Integer maId, Date maTime, Integer pId, Integer uId, Integer maStates, Product product) {
        this.maId = maId;
        this.maTime = maTime;
        this.pId = pId;
        this.uId = uId;
        this.maStates = maStates;
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getMaId() {
        return maId;
    }

    public void setMaId(Integer maId) {
        this.maId = maId;
    }

    public Date getMaTime() {
        return maTime;
    }

    public void setMaTime(Date maTime) {
        this.maTime = maTime;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getMaStates() {
        return maStates;
    }

    public void setMaStates(Integer maStates) {
        this.maStates = maStates;
    }
}