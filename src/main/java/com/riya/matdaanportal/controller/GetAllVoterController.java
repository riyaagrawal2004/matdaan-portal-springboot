package com.riya.matdaanportal.controller;

import java.util.List;

import com.riya.matdaanportal.daoimpl.ModifyVoterDaoImpl;
import com.riya.matdaanportal.pojo.ModifyVoter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GetAllVoterController {

	@GetMapping("/GetAllVoterServlet")
	public String getAllVoters(HttpServletRequest request, HttpSession session) {

	    if (session == null || session.getAttribute("username") == null) {
	        request.setAttribute("msg", "Please login as admin first.");
	        return "adminlogin";
	    }

	    String role = (String) session.getAttribute("role");

	    if (role == null || !role.equals("admin")) {
	        request.setAttribute("msg", "Access denied. Admin login required.");
	        return "adminlogin";
	    }

	    ModifyVoterDaoImpl daoimpl = new ModifyVoterDaoImpl();
	    List<ModifyVoter> list = daoimpl.getModifyVoters();

	    request.setAttribute("allvoter", list);

	    return "voterlist";
	}
}