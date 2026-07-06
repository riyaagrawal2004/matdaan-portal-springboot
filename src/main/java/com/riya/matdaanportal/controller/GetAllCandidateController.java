package com.riya.matdaanportal.controller;

import java.util.List;

import com.riya.matdaanportal.daoimpl.CandidateDaoImpl;
import com.riya.matdaanportal.pojo.candidate;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GetAllCandidateController {

	@GetMapping("/GetAllCandidate")
	public String getAllCandidates(HttpServletRequest request, HttpSession session) {

	    if (session == null || session.getAttribute("username") == null) {
	        request.setAttribute("msg", "Please login as admin first.");
	        return "adminlogin";
	    }

	    String role = (String) session.getAttribute("role");

	    if (role == null || !role.equals("admin")) {
	        request.setAttribute("msg", "Access denied. Admin login required.");
	        return "adminlogin";
	    }

	    CandidateDaoImpl daoimpl = new CandidateDaoImpl();
	    List<candidate> candidateList = daoimpl.getCandidates();

	    request.setAttribute("allcandidate", candidateList);

	    return "candidatelist";
	}
}