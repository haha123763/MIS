package com.itheima.ssm.domain;

import java.sql.Date;

public class Patent {
    private String id;
    private String name;
    private String appnum;
    private String type;
    private String strapplication;
    private String strcheck;
    private String strapproval;
    private Date applicationDate;
    private Date checkDate;
    private Date approvalDate;
    private String status;
    private String certnum;
    private String patentee;
    private String rank;
    private String scanFile;

    public String getStrapplication() {
        return strapplication;
    }

    public void setStrapplication(String strapplication) {
        this.strapplication = strapplication;
    }

    public String getStrcheck() {
        return strcheck;
    }

    public void setStrcheck(String strcheck) {
        this.strcheck = strcheck;
    }

    public String getStrapproval() {
        return strapproval;
    }

    public void setStrapproval(String strapproval) {
        this.strapproval = strapproval;
    }



    public Date getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(Date applicationDate) {
        this.applicationDate = applicationDate;
    }

    public Date getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(Date checkDate) {
        this.checkDate = checkDate;
    }

    public Date getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(Date approvalDate) {
        this.approvalDate = approvalDate;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAppnum() {
        return appnum;
    }

    public void setAppnum(String appnum) {
        this.appnum = appnum;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCertnum() {
        return certnum;
    }

    public void setCertnum(String certnum) {
        this.certnum = certnum;
    }

    public String getPatentee() {
        return patentee;
    }

    public void setPatentee(String patentee) {
        this.patentee = patentee;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "Patent{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", appnum='" + appnum + '\'' +
                ", type='" + type + '\'' +
                ", strapplication='" + strapplication + '\'' +
                ", strcheck='" + strcheck + '\'' +
                ", strapproval='" + strapproval + '\'' +
                ", applicationDate=" + applicationDate +
                ", checkDate=" + checkDate +
                ", approvalDate=" + approvalDate +
                ", status='" + status + '\'' +
                ", certnum='" + certnum + '\'' +
                ", patentee='" + patentee + '\'' +
                ", rank='" + rank + '\'' +
                ", scanFile='" + scanFile + '\'' +
                '}';
    }
}
