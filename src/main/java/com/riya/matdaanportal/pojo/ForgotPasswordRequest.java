package com.riya.matdaanportal.pojo;

public class ForgotPasswordRequest {

    private int id;
    private String username;
    private String email;
    private String mobile;
    private String userMessage;
    private String status;
    private String createdAt;

    public ForgotPasswordRequest() {
        super();
    }

    public ForgotPasswordRequest(int id, String username, String email, String mobile, String userMessage, String status, String createdAt) {
        super();
        this.id = id;
        this.username = username;
        this.email = email;
        this.mobile = mobile;
        this.userMessage = userMessage;
        this.status = status;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    } 

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    } 

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    } 

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    } 

    public String getUserMessage() {
        return userMessage;
    }

    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage;
    } 

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    } 

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}