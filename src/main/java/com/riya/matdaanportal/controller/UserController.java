package com.riya.matdaanportal.controller;

import com.riya.matdaanportal.daoimpl.CandidateDaoImpl;
import com.riya.matdaanportal.daoimpl.UserDaoImpl;
import com.riya.matdaanportal.pojo.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    @PostMapping("/UserServlet")
    public String loginUser(HttpServletRequest request) {

        String username = clean(request.getParameter("username"));
        String password = clean(request.getParameter("password"));

        if (isBlank(username) || isBlank(password)) {
            request.setAttribute("msg", "Please enter username and password.");
            return "login";
        }

        User u = new User();
        u.setUsername(username);
        u.setPassword(password);

        UserDaoImpl daoimpl = new UserDaoImpl();
        boolean isValid = daoimpl.checkUserCredential(u);

        if (isValid) {
            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            session = request.getSession(true);
            session.setAttribute("username", username);
            session.setAttribute("role", "voter");

            CandidateDaoImpl candidateDao = new CandidateDaoImpl();
            String activeElectionType = candidateDao.getActiveElectionType();

            if (activeElectionType != null && !activeElectionType.trim().isEmpty()) {
                session.setAttribute("activeElectionType", activeElectionType);
            }

            return "voter";
        } else {
            request.setAttribute("msg", "Invalid username or password.");
            return "login";
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