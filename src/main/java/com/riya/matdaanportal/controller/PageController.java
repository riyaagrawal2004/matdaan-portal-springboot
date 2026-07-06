package com.riya.matdaanportal.controller;

import java.util.List;

import com.riya.matdaanportal.daoimpl.ContactMessageDaoImpl;
import com.riya.matdaanportal.daoimpl.ForgotPasswordRequestDaoImpl;
import com.riya.matdaanportal.pojo.ContactMessage;
import com.riya.matdaanportal.pojo.ForgotPasswordRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PageController {

    @GetMapping({"/voter", "/voter.jsp"})
    public String voterPage() {
        return "voter";
    }

    @GetMapping({"/voting", "/voting.jsp"})
    public String votingPage() {
        return "voting";
    }

    @GetMapping({"/results", "/results.jsp"})
    public String resultsPage() {
        return "results";
    }

    @GetMapping("/result")
    public String resultPage() {
        return "result";
    }

    @GetMapping({"/result1", "/result1.jsp"})
    public String result1Page(HttpSession session, HttpServletRequest request) {

        if (!isAdminLoggedIn(session)) {
            request.setAttribute("msg", "Access denied. Admin login required.");
            return "adminlogin";
        }

        return "result1";
    }

    @GetMapping("/admin")
    public String adminPage(HttpSession session, HttpServletRequest request) {

        if (!isAdminLoggedIn(session)) {
            request.setAttribute("msg", "Please login as admin first.");
            return "adminlogin";
        }

        return "admin";
    }

    @GetMapping({"/adminlogin", "/adminlogin.jsp"})
    public String adminLoginPage() {
        return "adminlogin";
    }

    @GetMapping({"/candidatemanagement", "/candidatemanagement.jsp"})
    public String candidateManagementPage(HttpSession session, HttpServletRequest request) {

        if (!isAdminLoggedIn(session)) {
            request.setAttribute("msg", "Access denied. Admin login required.");
            return "adminlogin";
        }

        return "candidatemanagement";
    }

    @GetMapping({"/electionselect", "/electionselect.jsp"})
    public String electionSelectPage(HttpSession session, HttpServletRequest request) {

        if (!isAdminLoggedIn(session)) {
            request.setAttribute("msg", "Access denied. Admin login required.");
            return "adminlogin";
        }

        return "electionselect";
    }

    @GetMapping({"/modifyvoter", "/modifyvoter.jsp"})
    public String modifyVoterPage(HttpSession session, HttpServletRequest request) {

        if (!isAdminLoggedIn(session)) {
            request.setAttribute("msg", "Access denied. Admin login required.");
            return "adminlogin";
        }

        return "modifyvoter";
    }

    @GetMapping({"/searchvoter", "/searchvoter.jsp"})
    public String searchVoterPage(HttpSession session, HttpServletRequest request) {

        if (!isAdminLoggedIn(session)) {
            request.setAttribute("msg", "Access denied. Admin login required.");
            return "adminlogin";
        }

        return "searchvoter";
    }

    @GetMapping({"/login", "/login.jsp"})
    public String loginPage() {
        return "login";
    }

    @GetMapping({"/register", "/register.jsp"})
    public String registerPage() {
        return "register";
    }

    @GetMapping({"/forgot-password", "/forgot-password.jsp"})
    public String forgotPasswordPage() {
        return "forgot-password";
    }

    @GetMapping("/public")
    public String publicPage() {
        return "index-2";
    }

    @GetMapping({"/aboutus", "/aboutus.jsp"})
    public String aboutUsPage() {
        return "aboutus";
    }

    @GetMapping({"/contact", "/contact.jsp"})
    public String contactPage() {
        return "contact";
    }

    @GetMapping({"/adminregister", "/adminregister.jsp"})
    public String adminRegisterPage() {
        return "adminregister";
    }

    @GetMapping({"/contactmessages", "/contactmessages.jsp"})
    public String contactMessagesPage(HttpSession session, HttpServletRequest request) {

        if (!isAdminLoggedIn(session)) {
            request.setAttribute("msg", "Access denied. Admin login required.");
            return "adminlogin";
        }

        ContactMessageDaoImpl dao = new ContactMessageDaoImpl();
        List<ContactMessage> messages = dao.getAllContactMessages();

        request.setAttribute("messages", messages);

        return "contactmessages";
    }

    @GetMapping({"/passwordrequests", "/passwordrequests.jsp"})
    public String passwordRequestsPage(HttpSession session, HttpServletRequest request) {

        if (!isAdminLoggedIn(session)) {
            request.setAttribute("msg", "Access denied. Admin login required.");
            return "adminlogin";
        }

        ForgotPasswordRequestDaoImpl dao = new ForgotPasswordRequestDaoImpl();
        List<ForgotPasswordRequest> passwordRequests = dao.getAllForgotPasswordRequests();

        request.setAttribute("requests", passwordRequests);

        return "passwordrequests";
    }

    @PostMapping("/forgot-password")
    public String forgotPasswordSubmit(HttpServletRequest request) {

        String username = clean(request.getParameter("username"));
        String email = clean(request.getParameter("email"));
        String mobile = clean(request.getParameter("mobile"));
        String messageText = clean(request.getParameter("message"));

        if (isBlank(username) && isBlank(email) && isBlank(mobile)) {
            request.setAttribute("msg", "Please enter username, email or mobile number.");
            return "forgot-password";
        }

        ForgotPasswordRequest passwordRequest = new ForgotPasswordRequest();
        passwordRequest.setUsername(username);
        passwordRequest.setEmail(email);
        passwordRequest.setMobile(mobile);
        passwordRequest.setUserMessage(messageText);

        ForgotPasswordRequestDaoImpl dao = new ForgotPasswordRequestDaoImpl();
        boolean saved = dao.saveForgotPasswordRequest(passwordRequest);

        if (saved) {
            request.setAttribute("msg", "Your password reset request has been submitted successfully.");
        } else {
            request.setAttribute("msg", "Request could not be submitted. Please try again.");
        }

        return "forgot-password";
    }

    @PostMapping("/contact-submit")
    public String contactSubmit(HttpServletRequest request) {

        String name = clean(request.getParameter("name"));
        String email = clean(request.getParameter("email"));
        String subject = clean(request.getParameter("subject"));
        String messageText = clean(request.getParameter("message"));

        if (isBlank(name) || isBlank(email) || isBlank(messageText)) {
            request.setAttribute("msg", "Please fill all required contact details.");
            return "contact";
        }

        ContactMessage message = new ContactMessage();
        message.setName(name);
        message.setEmail(email);
        message.setSubject(subject);
        message.setUserMessage(messageText);

        ContactMessageDaoImpl dao = new ContactMessageDaoImpl();
        boolean saved = dao.saveContactMessage(message);

        if (saved) {
            request.setAttribute("msg", "Your message has been submitted successfully.");
        } else {
            request.setAttribute("msg", "Message could not be submitted. Please try again.");
        }

        return "contact";
    }

    private boolean isAdminLoggedIn(HttpSession session) {

        if (session == null) {
            return false;
        }

        String role = (String) session.getAttribute("role");

        return role != null && role.equals("admin");
    }

    private String clean(String value) {

        if (value == null) {
            return "";
        }

        return value.trim();
    }

    private boolean isBlank(String value) {

        return value == null || value.trim().isEmpty();
    }
}