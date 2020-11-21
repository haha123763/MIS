package com.itheima.ssm.domain;

import java.util.List;

public class UserInfo {
    private String id;
    private String email;
    private String phone;
    private String Chinese_name;
    private String English_name;
    private String department;
    private String job_title;
    private String username;
    private String password;
    private String role;
    private String role_desc;

    public String getRole_desc() {
        if(role.equals("ROLE_USER")) return "普通用户";
        else    return "管理员";
    }

    public void setRole_desc(String role_desc) {
        this.role_desc = role_desc;
    }

    public String getRole() {
        return  role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getChinese_name() {
        return Chinese_name;
    }

    public void setChinese_name(String chinese_name) {
        Chinese_name = chinese_name;
    }

    public String getEnglish_name() {
        return English_name;
    }

    public void setEnglish_name(String english_name) {
        English_name = english_name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getJob_title() {
        return job_title;
    }

    public void setJob_title(String job_title) {
        this.job_title = job_title;
    }
}
