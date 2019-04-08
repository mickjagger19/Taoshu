package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductExample  implements Serializable {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andPIdIsNull() {
            addCriterion("p_id is null");
            return (Criteria) this;
        }

        public Criteria andPIdIsNotNull() {
            addCriterion("p_id is not null");
            return (Criteria) this;
        }

        public Criteria andPIdEqualTo(Integer value) {
            addCriterion("p_id =", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdNotEqualTo(Integer value) {
            addCriterion("p_id <>", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdGreaterThan(Integer value) {
            addCriterion("p_id >", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("p_id >=", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdLessThan(Integer value) {
            addCriterion("p_id <", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdLessThanOrEqualTo(Integer value) {
            addCriterion("p_id <=", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdIn(List<Integer> values) {
            addCriterion("p_id in", values, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdNotIn(List<Integer> values) {
            addCriterion("p_id not in", values, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdBetween(Integer value1, Integer value2) {
            addCriterion("p_id between", value1, value2, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdNotBetween(Integer value1, Integer value2) {
            addCriterion("p_id not between", value1, value2, "pId");
            return (Criteria) this;
        }

        public Criteria andPNameIsNull() {
            addCriterion("p_name is null");
            return (Criteria) this;
        }

        public Criteria andPNameIsNotNull() {
            addCriterion("p_name is not null");
            return (Criteria) this;
        }

        public Criteria andPNameEqualTo(String value) {
            addCriterion("p_name =", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameNotEqualTo(String value) {
            addCriterion("p_name <>", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameGreaterThan(String value) {
            addCriterion("p_name >", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameGreaterThanOrEqualTo(String value) {
            addCriterion("p_name >=", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameLessThan(String value) {
            addCriterion("p_name <", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameLessThanOrEqualTo(String value) {
            addCriterion("p_name <=", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameLike(String value) {
            addCriterion("p_name like", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameNotLike(String value) {
            addCriterion("p_name not like", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameIn(List<String> values) {
            addCriterion("p_name in", values, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameNotIn(List<String> values) {
            addCriterion("p_name not in", values, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameBetween(String value1, String value2) {
            addCriterion("p_name between", value1, value2, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameNotBetween(String value1, String value2) {
            addCriterion("p_name not between", value1, value2, "pName");
            return (Criteria) this;
        }

        public Criteria andPCategoryIsNull() {
            addCriterion("p_category is null");
            return (Criteria) this;
        }

        public Criteria andPCategoryIsNotNull() {
            addCriterion("p_category is not null");
            return (Criteria) this;
        }

        public Criteria andPCategoryEqualTo(String value) {
            addCriterion("p_category =", value, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryNotEqualTo(String value) {
            addCriterion("p_category <>", value, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryGreaterThan(String value) {
            addCriterion("p_category >", value, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryGreaterThanOrEqualTo(String value) {
            addCriterion("p_category >=", value, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryLessThan(String value) {
            addCriterion("p_category <", value, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryLessThanOrEqualTo(String value) {
            addCriterion("p_category <=", value, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryLike(String value) {
            addCriterion("p_category like", value, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryNotLike(String value) {
            addCriterion("p_category not like", value, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryIn(List<String> values) {
            addCriterion("p_category in", values, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryNotIn(List<String> values) {
            addCriterion("p_category not in", values, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryBetween(String value1, String value2) {
            addCriterion("p_category between", value1, value2, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPCategoryNotBetween(String value1, String value2) {
            addCriterion("p_category not between", value1, value2, "pCategory");
            return (Criteria) this;
        }

        public Criteria andPPictureIsNull() {
            addCriterion("p_picture is null");
            return (Criteria) this;
        }

        public Criteria andPPictureIsNotNull() {
            addCriterion("p_picture is not null");
            return (Criteria) this;
        }

        public Criteria andPPictureEqualTo(String value) {
            addCriterion("p_picture =", value, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureNotEqualTo(String value) {
            addCriterion("p_picture <>", value, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureGreaterThan(String value) {
            addCriterion("p_picture >", value, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureGreaterThanOrEqualTo(String value) {
            addCriterion("p_picture >=", value, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureLessThan(String value) {
            addCriterion("p_picture <", value, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureLessThanOrEqualTo(String value) {
            addCriterion("p_picture <=", value, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureLike(String value) {
            addCriterion("p_picture like", value, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureNotLike(String value) {
            addCriterion("p_picture not like", value, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureIn(List<String> values) {
            addCriterion("p_picture in", values, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureNotIn(List<String> values) {
            addCriterion("p_picture not in", values, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureBetween(String value1, String value2) {
            addCriterion("p_picture between", value1, value2, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPPictureNotBetween(String value1, String value2) {
            addCriterion("p_picture not between", value1, value2, "pPicture");
            return (Criteria) this;
        }

        public Criteria andPOripriceIsNull() {
            addCriterion("p_oriprice is null");
            return (Criteria) this;
        }

        public Criteria andPOripriceIsNotNull() {
            addCriterion("p_oriprice is not null");
            return (Criteria) this;
        }

        public Criteria andPOripriceEqualTo(String value) {
            addCriterion("p_oriprice =", value, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceNotEqualTo(String value) {
            addCriterion("p_oriprice <>", value, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceGreaterThan(String value) {
            addCriterion("p_oriprice >", value, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceGreaterThanOrEqualTo(String value) {
            addCriterion("p_oriprice >=", value, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceLessThan(String value) {
            addCriterion("p_oriprice <", value, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceLessThanOrEqualTo(String value) {
            addCriterion("p_oriprice <=", value, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceLike(String value) {
            addCriterion("p_oriprice like", value, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceNotLike(String value) {
            addCriterion("p_oriprice not like", value, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceIn(List<String> values) {
            addCriterion("p_oriprice in", values, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceNotIn(List<String> values) {
            addCriterion("p_oriprice not in", values, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceBetween(String value1, String value2) {
            addCriterion("p_oriprice between", value1, value2, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPOripriceNotBetween(String value1, String value2) {
            addCriterion("p_oriprice not between", value1, value2, "pOriprice");
            return (Criteria) this;
        }

        public Criteria andPPriceIsNull() {
            addCriterion("p_price is null");
            return (Criteria) this;
        }

        public Criteria andPPriceIsNotNull() {
            addCriterion("p_price is not null");
            return (Criteria) this;
        }

        public Criteria andPPriceEqualTo(Double value) {
            addCriterion("p_price =", value, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPPriceNotEqualTo(Double value) {
            addCriterion("p_price <>", value, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPPriceGreaterThan(Double value) {
            addCriterion("p_price >", value, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("p_price >=", value, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPPriceLessThan(Double value) {
            addCriterion("p_price <", value, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPPriceLessThanOrEqualTo(Double value) {
            addCriterion("p_price <=", value, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPPriceIn(List<Double> values) {
            addCriterion("p_price in", values, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPPriceNotIn(List<Double> values) {
            addCriterion("p_price not in", values, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPPriceBetween(Double value1, Double value2) {
            addCriterion("p_price between", value1, value2, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPPriceNotBetween(Double value1, Double value2) {
            addCriterion("p_price not between", value1, value2, "pPrice");
            return (Criteria) this;
        }

        public Criteria andPStockIsNull() {
            addCriterion("p_stock is null");
            return (Criteria) this;
        }

        public Criteria andPStockIsNotNull() {
            addCriterion("p_stock is not null");
            return (Criteria) this;
        }

        public Criteria andPStockEqualTo(Integer value) {
            addCriterion("p_stock =", value, "pStock");
            return (Criteria) this;
        }

        public Criteria andPStockNotEqualTo(Integer value) {
            addCriterion("p_stock <>", value, "pStock");
            return (Criteria) this;
        }

        public Criteria andPStockGreaterThan(Integer value) {
            addCriterion("p_stock >", value, "pStock");
            return (Criteria) this;
        }

        public Criteria andPStockGreaterThanOrEqualTo(Integer value) {
            addCriterion("p_stock >=", value, "pStock");
            return (Criteria) this;
        }

        public Criteria andPStockLessThan(Integer value) {
            addCriterion("p_stock <", value, "pStock");
            return (Criteria) this;
        }

        public Criteria andPStockLessThanOrEqualTo(Integer value) {
            addCriterion("p_stock <=", value, "pStock");
            return (Criteria) this;
        }

        public Criteria andPStockIn(List<Integer> values) {
            addCriterion("p_stock in", values, "pStock");
            return (Criteria) this;
        }

        public Criteria andPStockNotIn(List<Integer> values) {
            addCriterion("p_stock not in", values, "pStock");
            return (Criteria) this;
        }

        public Criteria andPStockBetween(Integer value1, Integer value2) {
            addCriterion("p_stock between", value1, value2, "pStock");
            return (Criteria) this;
        }

        public Criteria andPStockNotBetween(Integer value1, Integer value2) {
            addCriterion("p_stock not between", value1, value2, "pStock");
            return (Criteria) this;
        }

        public Criteria andPIntroIsNull() {
            addCriterion("p_intro is null");
            return (Criteria) this;
        }

        public Criteria andPIntroIsNotNull() {
            addCriterion("p_intro is not null");
            return (Criteria) this;
        }

        public Criteria andPIntroEqualTo(String value) {
            addCriterion("p_intro =", value, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroNotEqualTo(String value) {
            addCriterion("p_intro <>", value, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroGreaterThan(String value) {
            addCriterion("p_intro >", value, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroGreaterThanOrEqualTo(String value) {
            addCriterion("p_intro >=", value, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroLessThan(String value) {
            addCriterion("p_intro <", value, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroLessThanOrEqualTo(String value) {
            addCriterion("p_intro <=", value, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroLike(String value) {
            addCriterion("p_intro like", value, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroNotLike(String value) {
            addCriterion("p_intro not like", value, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroIn(List<String> values) {
            addCriterion("p_intro in", values, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroNotIn(List<String> values) {
            addCriterion("p_intro not in", values, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroBetween(String value1, String value2) {
            addCriterion("p_intro between", value1, value2, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPIntroNotBetween(String value1, String value2) {
            addCriterion("p_intro not between", value1, value2, "pIntro");
            return (Criteria) this;
        }

        public Criteria andPTimeIsNull() {
            addCriterion("p_time is null");
            return (Criteria) this;
        }

        public Criteria andPTimeIsNotNull() {
            addCriterion("p_time is not null");
            return (Criteria) this;
        }

        public Criteria andPTimeEqualTo(Date value) {
            addCriterion("p_time =", value, "pTime");
            return (Criteria) this;
        }

        public Criteria andPTimeNotEqualTo(Date value) {
            addCriterion("p_time <>", value, "pTime");
            return (Criteria) this;
        }

        public Criteria andPTimeGreaterThan(Date value) {
            addCriterion("p_time >", value, "pTime");
            return (Criteria) this;
        }

        public Criteria andPTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("p_time >=", value, "pTime");
            return (Criteria) this;
        }

        public Criteria andPTimeLessThan(Date value) {
            addCriterion("p_time <", value, "pTime");
            return (Criteria) this;
        }

        public Criteria andPTimeLessThanOrEqualTo(Date value) {
            addCriterion("p_time <=", value, "pTime");
            return (Criteria) this;
        }

        public Criteria andPTimeIn(List<Date> values) {
            addCriterion("p_time in", values, "pTime");
            return (Criteria) this;
        }

        public Criteria andPTimeNotIn(List<Date> values) {
            addCriterion("p_time not in", values, "pTime");
            return (Criteria) this;
        }

        public Criteria andPTimeBetween(Date value1, Date value2) {
            addCriterion("p_time between", value1, value2, "pTime");
            return (Criteria) this;
        }

        public Criteria andPTimeNotBetween(Date value1, Date value2) {
            addCriterion("p_time not between", value1, value2, "pTime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}