package com.riya.matdaanportal.controller;

import com.riya.matdaanportal.daoimpl.ElectionDaoImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ElectionController {

    private ElectionDaoImpl daoimpl = new ElectionDaoImpl();

    @PostMapping("/ElectionServlet")
    public String setElection(HttpServletRequest request, HttpSession session) {
    	if (session == null || session.getAttribute("username") == null) {
    	    request.setAttribute("msg", "Please login as admin first.");
    	    return "adminlogin";
    	}

    	String role = (String) session.getAttribute("role");

    	if (role == null || !role.equals("admin")) {
    	    request.setAttribute("msg", "Access denied. Admin login required.");
    	    return "adminlogin";
    	}

        String electionType = request.getParameter("electionType");

        if (electionType == null || electionType.trim().isEmpty()) {
            request.setAttribute("msg", "Please select a valid election type.");
            return "electionselect";
        }

        try {
            boolean updated = daoimpl.setActiveElection(electionType);

            if (updated) {
                session.setAttribute("activeElectionType", electionType);
                request.setAttribute("msg", electionType + " election set successfully!");
                return "candidatemanagement";
            } else {
                request.setAttribute("msg", "Failed to set active election.");
                return "electionselect";
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "System error: " + e.getMessage());
            return "electionselect";
        }
    }
}