package com.riya.matdaanportal.controller;

import com.riya.matdaanportal.daoimpl.AdminDaoImpl;
import com.riya.matdaanportal.pojo.Admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {

    @PostMapping("/AdminServlet")
    public String adminLogin(HttpServletRequest request) {

        String username = clean(request.getParameter("username"));
        String password = clean(request.getParameter("password"));

        if (isBlank(username) || isBlank(password)) {
            request.setAttribute("msg", "Please enter admin username and password.");
            return "adminlogin";
        }

        Admin a = new Admin();
        a.setUsername(username);
        a.setPassword(password);

        AdminDaoImpl daoimpl = new AdminDaoImpl();
        boolean isValid = daoimpl.checkUserCredential(a);

        if (isValid) {
            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            session = request.getSession(true);
            session.setAttribute("username", username);
            session.setAttribute("role", "admin");

            return "admin";
        } else {
            request.setAttribute("msg", "Invalid admin username or password.");
            return "adminlogin";
        }
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