package com.riya.matdaanportal.controller;

import com.riya.matdaanportal.daoimpl.ModifyVoterDaoImpl;
import com.riya.matdaanportal.pojo.ModifyVoter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ModifyVoterController {

    @PostMapping("/ModifyVoterServlet")
    public String modifyVoter(HttpServletRequest request, HttpSession session) {

        String op = clean(request.getParameter("b1"));

        String username = clean(request.getParameter("username"));
        String password = clean(request.getParameter("password"));
        String fullName = clean(request.getParameter("full_name"));
        String ageStr = clean(request.getParameter("age"));
        String mobile = clean(request.getParameter("mobile"));
        String voterIdStr = clean(request.getParameter("voter_id"));

        ModifyVoterDaoImpl daoimpl = new ModifyVoterDaoImpl();
        ModifyVoter v = new ModifyVoter();
        
        if (session == null || session.getAttribute("username") == null) {
            request.setAttribute("msg", "Please login as admin first.");
            return "adminlogin";
        }

        String role = (String) session.getAttribute("role");

        if (role == null || !role.equals("admin")) {
            request.setAttribute("msg", "Access denied. Admin login required.");
            return "adminlogin";
        }

        if (isBlank(op)) {
            request.setAttribute("msg", "Please select an operation first.");
            return "modifyvoter";
        }

        if (op.equals("Delete Voter")) {

            if (isBlank(voterIdStr)) {
                request.setAttribute("msg", "Please enter Voter ID before deleting voter.");
                return "modifyvoter";
            }

            try {
                v.setVoter_id(Integer.parseInt(voterIdStr));
            } catch (NumberFormatException e) {
                request.setAttribute("msg", "Please enter a valid Voter ID.");
                return "modifyvoter";
            }

            boolean deleted = daoimpl.deleteVoter(v);

            if (deleted) {
                request.setAttribute("msg", "Voter Deleted Successfully");
            } else {
                request.setAttribute("msg", "Voter Could Not Be Deleted");
            }

            return "modifyvoter";
        }

        if (op.equals("Add Voter") || op.equals("Update Voter") || op.equals("Upgrade Voter")) {

            if (isBlank(username) || isBlank(password) || isBlank(fullName) ||
                isBlank(ageStr) || isBlank(mobile) || isBlank(voterIdStr)) {

                request.setAttribute("msg", "Please fill all voter details first.");
                return "modifyvoter";
            }

            int age;
            int voterId;

            try {
                age = Integer.parseInt(ageStr);
            } catch (NumberFormatException e) {
                request.setAttribute("msg", "Please enter a valid age.");
                return "modifyvoter";
            }

            try {
                voterId = Integer.parseInt(voterIdStr);
            } catch (NumberFormatException e) {
                request.setAttribute("msg", "Please enter a valid Voter ID.");
                return "modifyvoter";
            }

            if (age < 18) {
                session.setAttribute("msg", "Voter age must be 18 or above.");
                return "redirect:/modifyvoter";
            }

            if (mobile.length() != 10) {
                request.setAttribute("msg", "Please enter a valid 10 digit mobile number.");
                return "modifyvoter";
            }

            v.setUsername(username);
            v.setPassword(password);
            v.setFullname(fullName);
            v.setAge(age);
            v.setMobile(mobile);
            v.setVoter_id(voterId);

            if (op.equals("Add Voter")) {
                boolean added = daoimpl.addVoter(v);

                if (added) {
                    request.setAttribute("msg", "Voter Added Successfully");
                } else {
                    request.setAttribute("msg", "Voter Could Not Be Added");
                }
            }

            if (op.equals("Update Voter") || op.equals("Upgrade Voter")) {
                boolean updated = daoimpl.updateVoter(v);

                if (updated) {
                    request.setAttribute("msg", "Voter Updated Successfully");
                } else {
                    request.setAttribute("msg", "Voter Could Not Be Updated");
                }
            }

            request.setAttribute("full_name", v.getFullname());
            return "modifyvoter";
        }

        request.setAttribute("msg", "Invalid Operation");
        return "modifyvoter";
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