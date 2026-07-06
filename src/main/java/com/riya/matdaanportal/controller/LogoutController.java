package com.riya.matdaanportal.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LogoutController {

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpSession session) {

        String role = null;

        if (session != null) {
            role = (String) session.getAttribute("role");
            session.invalidate();
        }

        request.setAttribute("msg", "Logged out successfully.");

        if ("admin".equals(role)) {
            return "adminlogin";
        }

        return "login";
    }
}