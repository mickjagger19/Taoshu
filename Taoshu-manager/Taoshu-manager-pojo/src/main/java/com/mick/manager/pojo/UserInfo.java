package com.mick.manager.pojo;

import java.io.Serializable;

public class UserInfo implements Serializable {
    private Integer uId;

    private String uName;

    private String uAccount;

    private String uPwd;

    private Integer uLevel;

    private Double uBalance;

    private String uEmail;

    private String uTel;

    private Integer uStates;

    private static final long serialVersionUID = 1L;

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuAccount() {
        return uAccount;
    }

    public void setuAccount(String uAccount) {
        this.uAccount = uAccount == null ? null : uAccount.trim();
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd == null ? null : uPwd.trim();
    }

    public Integer getuLevel() {
        return uLevel;
    }

    public void setuLevel(Integer uLevel) {
        this.uLevel = uLevel;
    }

    public Double getuBalance() {
        return uBalance;
    }

    public void setuBalance(Double uBalance) {
        this.uBalance = uBalance;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail == null ? null : uEmail.trim();
    }

    public String getuTel() {
        return uTel;
    }

    public void setuTel(String uTel) {
        this.uTel = uTel == null ? null : uTel.trim();
    }

    public Integer getuStates() {
        return uStates;
    }

    public void setuStates(Integer uStates) {
        this.uStates = uStates;
    }
}