package com.itheima.ssm.domain;

import java.sql.Date;

//纵向项目
public class Project {
    private String id;
    private String number;//课题编号
    private String name;//课题名称
    private Date startDate;//开始日期
    private Date endDate;//结束日期
    private String leader;//课题负责人
    private String rank;//填报人课题排名
    private String category;//课题类别
    private String level;//课题级别
    private String source;//课题来源
    private String type;//课题类型
    private String totalFund;//课题总经费
    private String receivedFund;//已到账经费
    private String scanFile;//合同扫描件

    public String getReceivedFund() {
        return receivedFund;
    }

    public void setReceivedFund(String receivedFund) {
        this.receivedFund = receivedFund;
    }

    public String getScanFile() {
        return scanFile;
    }

    public void setScanFile(String scanFile) {
        this.scanFile = scanFile;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTotalFund() {
        return totalFund;
    }

    public void setTotalFund(String totalFund) {
        this.totalFund = totalFund;
    }
}
