package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class News implements Serializable {
    private Integer nId;

    private String nHeadline;

    private String nContent;

    private String nUrl;

    private Date nTime;

    private Integer nStates;

    private static final long serialVersionUID = 1L;

    public Integer getnId() {
        return nId;
    }

    public void setnId(Integer nId) {
        this.nId = nId;
    }

    public String getnHeadline() {
        return nHeadline;
    }

    public void setnHeadline(String nHeadline) {
        this.nHeadline = nHeadline == null ? null : nHeadline.trim();
    }

    public String getnContent() {
        return nContent;
    }

    public void setnContent(String nContent) {
        this.nContent = nContent == null ? null : nContent.trim();
    }

    public String getnUrl() {
        return nUrl;
    }

    public void setnUrl(String nUrl) {
        this.nUrl = nUrl == null ? null : nUrl.trim();
    }

    public Date getnTime() {
        return nTime;
    }

    public void setnTime(Date nTime) {
        this.nTime = nTime;
    }

    public Integer getnStates() {
        return nStates;
    }

    public void setnStates(Integer nStates) {
        this.nStates = nStates;
    }
}