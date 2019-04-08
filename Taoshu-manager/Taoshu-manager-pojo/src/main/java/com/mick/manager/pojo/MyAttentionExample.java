package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MyAttentionExample  implements Serializable {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public MyAttentionExample() {
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

        public Criteria andMaIdIsNull() {
            addCriterion("ma_id is null");
            return (Criteria) this;
        }

        public Criteria andMaIdIsNotNull() {
            addCriterion("ma_id is not null");
            return (Criteria) this;
        }

        public Criteria andMaIdEqualTo(Integer value) {
            addCriterion("ma_id =", value, "maId");
            return (Criteria) this;
        }

        public Criteria andMaIdNotEqualTo(Integer value) {
            addCriterion("ma_id <>", value, "maId");
            return (Criteria) this;
        }

        public Criteria andMaIdGreaterThan(Integer value) {
            addCriterion("ma_id >", value, "maId");
            return (Criteria) this;
        }

        public Criteria andMaIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ma_id >=", value, "maId");
            return (Criteria) this;
        }

        public Criteria andMaIdLessThan(Integer value) {
            addCriterion("ma_id <", value, "maId");
            return (Criteria) this;
        }

        public Criteria andMaIdLessThanOrEqualTo(Integer value) {
            addCriterion("ma_id <=", value, "maId");
            return (Criteria) this;
        }

        public Criteria andMaIdIn(List<Integer> values) {
            addCriterion("ma_id in", values, "maId");
            return (Criteria) this;
        }

        public Criteria andMaIdNotIn(List<Integer> values) {
            addCriterion("ma_id not in", values, "maId");
            return (Criteria) this;
        }

        public Criteria andMaIdBetween(Integer value1, Integer value2) {
            addCriterion("ma_id between", value1, value2, "maId");
            return (Criteria) this;
        }

        public Criteria andMaIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ma_id not between", value1, value2, "maId");
            return (Criteria) this;
        }

        public Criteria andMaTimeIsNull() {
            addCriterion("ma_time is null");
            return (Criteria) this;
        }

        public Criteria andMaTimeIsNotNull() {
            addCriterion("ma_time is not null");
            return (Criteria) this;
        }

        public Criteria andMaTimeEqualTo(Date value) {
            addCriterion("ma_time =", value, "maTime");
            return (Criteria) this;
        }

        public Criteria andMaTimeNotEqualTo(Date value) {
            addCriterion("ma_time <>", value, "maTime");
            return (Criteria) this;
        }

        public Criteria andMaTimeGreaterThan(Date value) {
            addCriterion("ma_time >", value, "maTime");
            return (Criteria) this;
        }

        public Criteria andMaTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("ma_time >=", value, "maTime");
            return (Criteria) this;
        }

        public Criteria andMaTimeLessThan(Date value) {
            addCriterion("ma_time <", value, "maTime");
            return (Criteria) this;
        }

        public Criteria andMaTimeLessThanOrEqualTo(Date value) {
            addCriterion("ma_time <=", value, "maTime");
            return (Criteria) this;
        }

        public Criteria andMaTimeIn(List<Date> values) {
            addCriterion("ma_time in", values, "maTime");
            return (Criteria) this;
        }

        public Criteria andMaTimeNotIn(List<Date> values) {
            addCriterion("ma_time not in", values, "maTime");
            return (Criteria) this;
        }

        public Criteria andMaTimeBetween(Date value1, Date value2) {
            addCriterion("ma_time between", value1, value2, "maTime");
            return (Criteria) this;
        }

        public Criteria andMaTimeNotBetween(Date value1, Date value2) {
            addCriterion("ma_time not between", value1, value2, "maTime");
            return (Criteria) this;
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

        public Criteria andUIdIsNull() {
            addCriterion("u_id is null");
            return (Criteria) this;
        }

        public Criteria andUIdIsNotNull() {
            addCriterion("u_id is not null");
            return (Criteria) this;
        }

        public Criteria andUIdEqualTo(Integer value) {
            addCriterion("u_id =", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotEqualTo(Integer value) {
            addCriterion("u_id <>", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdGreaterThan(Integer value) {
            addCriterion("u_id >", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("u_id >=", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdLessThan(Integer value) {
            addCriterion("u_id <", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdLessThanOrEqualTo(Integer value) {
            addCriterion("u_id <=", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdIn(List<Integer> values) {
            addCriterion("u_id in", values, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotIn(List<Integer> values) {
            addCriterion("u_id not in", values, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdBetween(Integer value1, Integer value2) {
            addCriterion("u_id between", value1, value2, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotBetween(Integer value1, Integer value2) {
            addCriterion("u_id not between", value1, value2, "uId");
            return (Criteria) this;
        }

        public Criteria andMaStatesIsNull() {
            addCriterion("ma__states is null");
            return (Criteria) this;
        }

        public Criteria andMaStatesIsNotNull() {
            addCriterion("ma__states is not null");
            return (Criteria) this;
        }

        public Criteria andMaStatesEqualTo(Integer value) {
            addCriterion("ma__states =", value, "maStates");
            return (Criteria) this;
        }

        public Criteria andMaStatesNotEqualTo(Integer value) {
            addCriterion("ma__states <>", value, "maStates");
            return (Criteria) this;
        }

        public Criteria andMaStatesGreaterThan(Integer value) {
            addCriterion("ma__states >", value, "maStates");
            return (Criteria) this;
        }

        public Criteria andMaStatesGreaterThanOrEqualTo(Integer value) {
            addCriterion("ma__states >=", value, "maStates");
            return (Criteria) this;
        }

        public Criteria andMaStatesLessThan(Integer value) {
            addCriterion("ma__states <", value, "maStates");
            return (Criteria) this;
        }

        public Criteria andMaStatesLessThanOrEqualTo(Integer value) {
            addCriterion("ma__states <=", value, "maStates");
            return (Criteria) this;
        }

        public Criteria andMaStatesIn(List<Integer> values) {
            addCriterion("ma__states in", values, "maStates");
            return (Criteria) this;
        }

        public Criteria andMaStatesNotIn(List<Integer> values) {
            addCriterion("ma__states not in", values, "maStates");
            return (Criteria) this;
        }

        public Criteria andMaStatesBetween(Integer value1, Integer value2) {
            addCriterion("ma__states between", value1, value2, "maStates");
            return (Criteria) this;
        }

        public Criteria andMaStatesNotBetween(Integer value1, Integer value2) {
            addCriterion("ma__states not between", value1, value2, "maStates");
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