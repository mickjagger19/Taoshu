package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable {
    private Integer pId;

    private String pName;

    private String pCategory;

    private String pPicture;

    private String pOriprice;

    private Double pPrice;

    private Integer pStock;

    private String pIntro;

    private Date pTime;

    private static final long serialVersionUID = 1L;

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getpCategory() {
        return pCategory;
    }

    public void setpCategory(String pCategory) {
        this.pCategory = pCategory == null ? null : pCategory.trim();
    }

    public String getpPicture() {
        return pPicture;
    }

    public void setpPicture(String pPicture) {
        this.pPicture = pPicture == null ? null : pPicture.trim();
    }

    public String getpOriprice() {
        return pOriprice;
    }

    public void setpOriprice(String pOriprice) {
        this.pOriprice = pOriprice == null ? null : pOriprice.trim();
    }

    public Double getpPrice() {
        return pPrice;
    }

    public void setpPrice(Double pPrice) {
        this.pPrice = pPrice;
    }

    public Integer getpStock() {
        return pStock;
    }

    public void setpStock(Integer pStock) {
        this.pStock = pStock;
    }

    public String getpIntro() {
        return pIntro;
    }

    public void setpIntro(String pIntro) {
        this.pIntro = pIntro == null ? null : pIntro.trim();
    }

    public Date getpTime() {
        return pTime;
    }

    public void setpTime(Date pTime) {
        this.pTime = pTime;
    }
}