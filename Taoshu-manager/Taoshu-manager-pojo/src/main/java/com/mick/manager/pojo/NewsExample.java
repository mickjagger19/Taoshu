package com.mick.manager.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NewsExample  implements Serializable {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public NewsExample() {
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

        public Criteria andNIdIsNull() {
            addCriterion("n_id is null");
            return (Criteria) this;
        }

        public Criteria andNIdIsNotNull() {
            addCriterion("n_id is not null");
            return (Criteria) this;
        }

        public Criteria andNIdEqualTo(Integer value) {
            addCriterion("n_id =", value, "nId");
            return (Criteria) this;
        }

        public Criteria andNIdNotEqualTo(Integer value) {
            addCriterion("n_id <>", value, "nId");
            return (Criteria) this;
        }

        public Criteria andNIdGreaterThan(Integer value) {
            addCriterion("n_id >", value, "nId");
            return (Criteria) this;
        }

        public Criteria andNIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("n_id >=", value, "nId");
            return (Criteria) this;
        }

        public Criteria andNIdLessThan(Integer value) {
            addCriterion("n_id <", value, "nId");
            return (Criteria) this;
        }

        public Criteria andNIdLessThanOrEqualTo(Integer value) {
            addCriterion("n_id <=", value, "nId");
            return (Criteria) this;
        }

        public Criteria andNIdIn(List<Integer> values) {
            addCriterion("n_id in", values, "nId");
            return (Criteria) this;
        }

        public Criteria andNIdNotIn(List<Integer> values) {
            addCriterion("n_id not in", values, "nId");
            return (Criteria) this;
        }

        public Criteria andNIdBetween(Integer value1, Integer value2) {
            addCriterion("n_id between", value1, value2, "nId");
            return (Criteria) this;
        }

        public Criteria andNIdNotBetween(Integer value1, Integer value2) {
            addCriterion("n_id not between", value1, value2, "nId");
            return (Criteria) this;
        }

        public Criteria andNHeadlineIsNull() {
            addCriterion("n_headline is null");
            return (Criteria) this;
        }

        public Criteria andNHeadlineIsNotNull() {
            addCriterion("n_headline is not null");
            return (Criteria) this;
        }

        public Criteria andNHeadlineEqualTo(String value) {
            addCriterion("n_headline =", value, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineNotEqualTo(String value) {
            addCriterion("n_headline <>", value, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineGreaterThan(String value) {
            addCriterion("n_headline >", value, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineGreaterThanOrEqualTo(String value) {
            addCriterion("n_headline >=", value, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineLessThan(String value) {
            addCriterion("n_headline <", value, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineLessThanOrEqualTo(String value) {
            addCriterion("n_headline <=", value, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineLike(String value) {
            addCriterion("n_headline like", value, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineNotLike(String value) {
            addCriterion("n_headline not like", value, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineIn(List<String> values) {
            addCriterion("n_headline in", values, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineNotIn(List<String> values) {
            addCriterion("n_headline not in", values, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineBetween(String value1, String value2) {
            addCriterion("n_headline between", value1, value2, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNHeadlineNotBetween(String value1, String value2) {
            addCriterion("n_headline not between", value1, value2, "nHeadline");
            return (Criteria) this;
        }

        public Criteria andNContentIsNull() {
            addCriterion("n_content is null");
            return (Criteria) this;
        }

        public Criteria andNContentIsNotNull() {
            addCriterion("n_content is not null");
            return (Criteria) this;
        }

        public Criteria andNContentEqualTo(String value) {
            addCriterion("n_content =", value, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentNotEqualTo(String value) {
            addCriterion("n_content <>", value, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentGreaterThan(String value) {
            addCriterion("n_content >", value, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentGreaterThanOrEqualTo(String value) {
            addCriterion("n_content >=", value, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentLessThan(String value) {
            addCriterion("n_content <", value, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentLessThanOrEqualTo(String value) {
            addCriterion("n_content <=", value, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentLike(String value) {
            addCriterion("n_content like", value, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentNotLike(String value) {
            addCriterion("n_content not like", value, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentIn(List<String> values) {
            addCriterion("n_content in", values, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentNotIn(List<String> values) {
            addCriterion("n_content not in", values, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentBetween(String value1, String value2) {
            addCriterion("n_content between", value1, value2, "nContent");
            return (Criteria) this;
        }

        public Criteria andNContentNotBetween(String value1, String value2) {
            addCriterion("n_content not between", value1, value2, "nContent");
            return (Criteria) this;
        }

        public Criteria andNUrlIsNull() {
            addCriterion("n_url is null");
            return (Criteria) this;
        }

        public Criteria andNUrlIsNotNull() {
            addCriterion("n_url is not null");
            return (Criteria) this;
        }

        public Criteria andNUrlEqualTo(String value) {
            addCriterion("n_url =", value, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlNotEqualTo(String value) {
            addCriterion("n_url <>", value, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlGreaterThan(String value) {
            addCriterion("n_url >", value, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlGreaterThanOrEqualTo(String value) {
            addCriterion("n_url >=", value, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlLessThan(String value) {
            addCriterion("n_url <", value, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlLessThanOrEqualTo(String value) {
            addCriterion("n_url <=", value, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlLike(String value) {
            addCriterion("n_url like", value, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlNotLike(String value) {
            addCriterion("n_url not like", value, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlIn(List<String> values) {
            addCriterion("n_url in", values, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlNotIn(List<String> values) {
            addCriterion("n_url not in", values, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlBetween(String value1, String value2) {
            addCriterion("n_url between", value1, value2, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNUrlNotBetween(String value1, String value2) {
            addCriterion("n_url not between", value1, value2, "nUrl");
            return (Criteria) this;
        }

        public Criteria andNTimeIsNull() {
            addCriterion("n_time is null");
            return (Criteria) this;
        }

        public Criteria andNTimeIsNotNull() {
            addCriterion("n_time is not null");
            return (Criteria) this;
        }

        public Criteria andNTimeEqualTo(Date value) {
            addCriterion("n_time =", value, "nTime");
            return (Criteria) this;
        }

        public Criteria andNTimeNotEqualTo(Date value) {
            addCriterion("n_time <>", value, "nTime");
            return (Criteria) this;
        }

        public Criteria andNTimeGreaterThan(Date value) {
            addCriterion("n_time >", value, "nTime");
            return (Criteria) this;
        }

        public Criteria andNTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("n_time >=", value, "nTime");
            return (Criteria) this;
        }

        public Criteria andNTimeLessThan(Date value) {
            addCriterion("n_time <", value, "nTime");
            return (Criteria) this;
        }

        public Criteria andNTimeLessThanOrEqualTo(Date value) {
            addCriterion("n_time <=", value, "nTime");
            return (Criteria) this;
        }

        public Criteria andNTimeIn(List<Date> values) {
            addCriterion("n_time in", values, "nTime");
            return (Criteria) this;
        }

        public Criteria andNTimeNotIn(List<Date> values) {
            addCriterion("n_time not in", values, "nTime");
            return (Criteria) this;
        }

        public Criteria andNTimeBetween(Date value1, Date value2) {
            addCriterion("n_time between", value1, value2, "nTime");
            return (Criteria) this;
        }

        public Criteria andNTimeNotBetween(Date value1, Date value2) {
            addCriterion("n_time not between", value1, value2, "nTime");
            return (Criteria) this;
        }

        public Criteria andNStatesIsNull() {
            addCriterion("n_states is null");
            return (Criteria) this;
        }

        public Criteria andNStatesIsNotNull() {
            addCriterion("n_states is not null");
            return (Criteria) this;
        }

        public Criteria andNStatesEqualTo(Integer value) {
            addCriterion("n_states =", value, "nStates");
            return (Criteria) this;
        }

        public Criteria andNStatesNotEqualTo(Integer value) {
            addCriterion("n_states <>", value, "nStates");
            return (Criteria) this;
        }

        public Criteria andNStatesGreaterThan(Integer value) {
            addCriterion("n_states >", value, "nStates");
            return (Criteria) this;
        }

        public Criteria andNStatesGreaterThanOrEqualTo(Integer value) {
            addCriterion("n_states >=", value, "nStates");
            return (Criteria) this;
        }

        public Criteria andNStatesLessThan(Integer value) {
            addCriterion("n_states <", value, "nStates");
            return (Criteria) this;
        }

        public Criteria andNStatesLessThanOrEqualTo(Integer value) {
            addCriterion("n_states <=", value, "nStates");
            return (Criteria) this;
        }

        public Criteria andNStatesIn(List<Integer> values) {
            addCriterion("n_states in", values, "nStates");
            return (Criteria) this;
        }

        public Criteria andNStatesNotIn(List<Integer> values) {
            addCriterion("n_states not in", values, "nStates");
            return (Criteria) this;
        }

        public Criteria andNStatesBetween(Integer value1, Integer value2) {
            addCriterion("n_states between", value1, value2, "nStates");
            return (Criteria) this;
        }

        public Criteria andNStatesNotBetween(Integer value1, Integer value2) {
            addCriterion("n_states not between", value1, value2, "nStates");
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