package com.riya.matdaanportal.pojo;

public class ContactMessage {

    private int id;
    private String name;
    private String email;
    private String subject;
    private String userMessage;
    private String createdAt;

    public ContactMessage() {
        super();
    }

    public ContactMessage(int id, String name, String email, String subject, String userMessage, String createdAt) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.userMessage = userMessage;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    } 

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    } 

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    } 

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    } 

    public String getUserMessage() {
        return userMessage;
    }

    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage;
    } 

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}