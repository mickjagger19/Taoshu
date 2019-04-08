package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class Orderform implements Serializable {
    private Integer oId;

    private Date oTime;

    private Integer oPcounts;

    private Double oSum;

    private Integer uId;

    private Integer naId;

    private Integer oStates;

    private static final long serialVersionUID = 1L;

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public Date getoTime() {
        return oTime;
    }

    public void setoTime(Date oTime) {
        this.oTime = oTime;
    }

    public Integer getoPcounts() {
        return oPcounts;
    }

    public void setoPcounts(Integer oPcounts) {
        this.oPcounts = oPcounts;
    }

    public Double getoSum() {
        return oSum;
    }

    public void setoSum(Double oSum) {
        this.oSum = oSum;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getNaId() {
        return naId;
    }

    public void setNaId(Integer naId) {
        this.naId = naId;
    }

    public Integer getoStates() {
        return oStates;
    }

    public void setoStates(Integer oStates) {
        this.oStates = oStates;
    }
}