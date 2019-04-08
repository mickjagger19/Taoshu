package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderformExample  implements Serializable {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OrderformExample() {
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

        public Criteria andOIdIsNull() {
            addCriterion("o_id is null");
            return (Criteria) this;
        }

        public Criteria andOIdIsNotNull() {
            addCriterion("o_id is not null");
            return (Criteria) this;
        }

        public Criteria andOIdEqualTo(Integer value) {
            addCriterion("o_id =", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdNotEqualTo(Integer value) {
            addCriterion("o_id <>", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdGreaterThan(Integer value) {
            addCriterion("o_id >", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("o_id >=", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdLessThan(Integer value) {
            addCriterion("o_id <", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdLessThanOrEqualTo(Integer value) {
            addCriterion("o_id <=", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdIn(List<Integer> values) {
            addCriterion("o_id in", values, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdNotIn(List<Integer> values) {
            addCriterion("o_id not in", values, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdBetween(Integer value1, Integer value2) {
            addCriterion("o_id between", value1, value2, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdNotBetween(Integer value1, Integer value2) {
            addCriterion("o_id not between", value1, value2, "oId");
            return (Criteria) this;
        }

        public Criteria andOTimeIsNull() {
            addCriterion("o_time is null");
            return (Criteria) this;
        }

        public Criteria andOTimeIsNotNull() {
            addCriterion("o_time is not null");
            return (Criteria) this;
        }

        public Criteria andOTimeEqualTo(Date value) {
            addCriterion("o_time =", value, "oTime");
            return (Criteria) this;
        }

        public Criteria andOTimeNotEqualTo(Date value) {
            addCriterion("o_time <>", value, "oTime");
            return (Criteria) this;
        }

        public Criteria andOTimeGreaterThan(Date value) {
            addCriterion("o_time >", value, "oTime");
            return (Criteria) this;
        }

        public Criteria andOTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("o_time >=", value, "oTime");
            return (Criteria) this;
        }

        public Criteria andOTimeLessThan(Date value) {
            addCriterion("o_time <", value, "oTime");
            return (Criteria) this;
        }

        public Criteria andOTimeLessThanOrEqualTo(Date value) {
            addCriterion("o_time <=", value, "oTime");
            return (Criteria) this;
        }

        public Criteria andOTimeIn(List<Date> values) {
            addCriterion("o_time in", values, "oTime");
            return (Criteria) this;
        }

        public Criteria andOTimeNotIn(List<Date> values) {
            addCriterion("o_time not in", values, "oTime");
            return (Criteria) this;
        }

        public Criteria andOTimeBetween(Date value1, Date value2) {
            addCriterion("o_time between", value1, value2, "oTime");
            return (Criteria) this;
        }

        public Criteria andOTimeNotBetween(Date value1, Date value2) {
            addCriterion("o_time not between", value1, value2, "oTime");
            return (Criteria) this;
        }

        public Criteria andOPcountsIsNull() {
            addCriterion("o_pcounts is null");
            return (Criteria) this;
        }

        public Criteria andOPcountsIsNotNull() {
            addCriterion("o_pcounts is not null");
            return (Criteria) this;
        }

        public Criteria andOPcountsEqualTo(Integer value) {
            addCriterion("o_pcounts =", value, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOPcountsNotEqualTo(Integer value) {
            addCriterion("o_pcounts <>", value, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOPcountsGreaterThan(Integer value) {
            addCriterion("o_pcounts >", value, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOPcountsGreaterThanOrEqualTo(Integer value) {
            addCriterion("o_pcounts >=", value, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOPcountsLessThan(Integer value) {
            addCriterion("o_pcounts <", value, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOPcountsLessThanOrEqualTo(Integer value) {
            addCriterion("o_pcounts <=", value, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOPcountsIn(List<Integer> values) {
            addCriterion("o_pcounts in", values, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOPcountsNotIn(List<Integer> values) {
            addCriterion("o_pcounts not in", values, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOPcountsBetween(Integer value1, Integer value2) {
            addCriterion("o_pcounts between", value1, value2, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOPcountsNotBetween(Integer value1, Integer value2) {
            addCriterion("o_pcounts not between", value1, value2, "oPcounts");
            return (Criteria) this;
        }

        public Criteria andOSumIsNull() {
            addCriterion("o_sum is null");
            return (Criteria) this;
        }

        public Criteria andOSumIsNotNull() {
            addCriterion("o_sum is not null");
            return (Criteria) this;
        }

        public Criteria andOSumEqualTo(Double value) {
            addCriterion("o_sum =", value, "oSum");
            return (Criteria) this;
        }

        public Criteria andOSumNotEqualTo(Double value) {
            addCriterion("o_sum <>", value, "oSum");
            return (Criteria) this;
        }

        public Criteria andOSumGreaterThan(Double value) {
            addCriterion("o_sum >", value, "oSum");
            return (Criteria) this;
        }

        public Criteria andOSumGreaterThanOrEqualTo(Double value) {
            addCriterion("o_sum >=", value, "oSum");
            return (Criteria) this;
        }

        public Criteria andOSumLessThan(Double value) {
            addCriterion("o_sum <", value, "oSum");
            return (Criteria) this;
        }

        public Criteria andOSumLessThanOrEqualTo(Double value) {
            addCriterion("o_sum <=", value, "oSum");
            return (Criteria) this;
        }

        public Criteria andOSumIn(List<Double> values) {
            addCriterion("o_sum in", values, "oSum");
            return (Criteria) this;
        }

        public Criteria andOSumNotIn(List<Double> values) {
            addCriterion("o_sum not in", values, "oSum");
            return (Criteria) this;
        }

        public Criteria andOSumBetween(Double value1, Double value2) {
            addCriterion("o_sum between", value1, value2, "oSum");
            return (Criteria) this;
        }

        public Criteria andOSumNotBetween(Double value1, Double value2) {
            addCriterion("o_sum not between", value1, value2, "oSum");
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

        public Criteria andNaIdIsNull() {
            addCriterion("na_id is null");
            return (Criteria) this;
        }

        public Criteria andNaIdIsNotNull() {
            addCriterion("na_id is not null");
            return (Criteria) this;
        }

        public Criteria andNaIdEqualTo(Integer value) {
            addCriterion("na_id =", value, "naId");
            return (Criteria) this;
        }

        public Criteria andNaIdNotEqualTo(Integer value) {
            addCriterion("na_id <>", value, "naId");
            return (Criteria) this;
        }

        public Criteria andNaIdGreaterThan(Integer value) {
            addCriterion("na_id >", value, "naId");
            return (Criteria) this;
        }

        public Criteria andNaIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("na_id >=", value, "naId");
            return (Criteria) this;
        }

        public Criteria andNaIdLessThan(Integer value) {
            addCriterion("na_id <", value, "naId");
            return (Criteria) this;
        }

        public Criteria andNaIdLessThanOrEqualTo(Integer value) {
            addCriterion("na_id <=", value, "naId");
            return (Criteria) this;
        }

        public Criteria andNaIdIn(List<Integer> values) {
            addCriterion("na_id in", values, "naId");
            return (Criteria) this;
        }

        public Criteria andNaIdNotIn(List<Integer> values) {
            addCriterion("na_id not in", values, "naId");
            return (Criteria) this;
        }

        public Criteria andNaIdBetween(Integer value1, Integer value2) {
            addCriterion("na_id between", value1, value2, "naId");
            return (Criteria) this;
        }

        public Criteria andNaIdNotBetween(Integer value1, Integer value2) {
            addCriterion("na_id not between", value1, value2, "naId");
            return (Criteria) this;
        }

        public Criteria andOStatesIsNull() {
            addCriterion("o_states is null");
            return (Criteria) this;
        }

        public Criteria andOStatesIsNotNull() {
            addCriterion("o_states is not null");
            return (Criteria) this;
        }

        public Criteria andOStatesEqualTo(Integer value) {
            addCriterion("o_states =", value, "oStates");
            return (Criteria) this;
        }

        public Criteria andOStatesNotEqualTo(Integer value) {
            addCriterion("o_states <>", value, "oStates");
            return (Criteria) this;
        }

        public Criteria andOStatesGreaterThan(Integer value) {
            addCriterion("o_states >", value, "oStates");
            return (Criteria) this;
        }

        public Criteria andOStatesGreaterThanOrEqualTo(Integer value) {
            addCriterion("o_states >=", value, "oStates");
            return (Criteria) this;
        }

        public Criteria andOStatesLessThan(Integer value) {
            addCriterion("o_states <", value, "oStates");
            return (Criteria) this;
        }

        public Criteria andOStatesLessThanOrEqualTo(Integer value) {
            addCriterion("o_states <=", value, "oStates");
            return (Criteria) this;
        }

        public Criteria andOStatesIn(List<Integer> values) {
            addCriterion("o_states in", values, "oStates");
            return (Criteria) this;
        }

        public Criteria andOStatesNotIn(List<Integer> values) {
            addCriterion("o_states not in", values, "oStates");
            return (Criteria) this;
        }

        public Criteria andOStatesBetween(Integer value1, Integer value2) {
            addCriterion("o_states between", value1, value2, "oStates");
            return (Criteria) this;
        }

        public Criteria andOStatesNotBetween(Integer value1, Integer value2) {
            addCriterion("o_states not between", value1, value2, "oStates");
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