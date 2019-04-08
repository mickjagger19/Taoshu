package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class Shoppingcar implements Serializable {
    private Integer sId;

    private Date sTime;

    private Integer pId;

    private Integer uId;

    private Integer sStates;

    private Integer sPcounts;

    private Product productList;

    private static final long serialVersionUID = 1L;

    public Shoppingcar() {
    }

    public Shoppingcar(Integer sId, Date sTime, Integer pId, Integer uId, Integer sStates, Integer sPcounts, Product productList) {
        this.sId = sId;
        this.sTime = sTime;
        this.pId = pId;
        this.uId = uId;
        this.sStates = sStates;
        this.sPcounts = sPcounts;
        this.productList = productList;
    }

    public Integer getsStates() {
        return sStates;
    }

    public void setsStates(Integer sStates) {
        this.sStates = sStates;
    }

    public Integer getsPcounts() {
        return sPcounts;
    }

    public void setsPcounts(Integer sPcounts) {
        this.sPcounts = sPcounts;
    }

    public Product getProductList() {
        return productList;
    }

    public void setProductList(Product productList) {
        this.productList = productList;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Date getsTime() {
        return sTime;
    }

    public void setsTime(Date sTime) {
        this.sTime = sTime;
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

    @Override
    public String toString() {
        return "Shoppingcar{" +
                "sId=" + sId +
                ", sTime=" + sTime +
                ", pId=" + pId +
                ", uId=" + uId +
                ", sStates=" + sStates +
                ", sPcounts=" + sPcounts +
                ", productList=" + productList +
                '}';
    }
}