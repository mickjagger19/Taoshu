package com.mick.manager.dto;

import com.mick.manager.pojo.Product;

import java.io.Serializable;
import java.util.List;

public class SearchResult implements Serializable{

    private List<Product> productList;

    private int totalPages;

    private int pageNum;
    
    private long recordNum;

    public int getpageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }
    

    public Long getRecordNum() {
        return recordNum;
    }

    public void setRecordNum(Long recordNum) {
        this.recordNum = recordNum;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }
}
