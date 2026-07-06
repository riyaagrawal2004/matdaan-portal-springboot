package com.riya.matdaanportal.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import com.riya.matdaanportal.daoimpl.CandidateDaoImpl;
import com.riya.matdaanportal.pojo.candidate;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CandidateController {

    @PostMapping("/CandidateServlet")
    public String handleCandidate(
            HttpServletRequest request,
            HttpSession session,
            @RequestParam(value = "photo", required = false) MultipartFile photoFile) {

        String op = clean(request.getParameter("b2"));

        String idStr = clean(request.getParameter("id"));
        String fullName = clean(request.getParameter("full_name"));
        String ageStr = clean(request.getParameter("age"));
        String partyName = clean(request.getParameter("party_name"));
        String electionType = clean(request.getParameter("election_type"));
        String existingPhoto = clean(request.getParameter("existing_photo"));

        CandidateDaoImpl daoimpl = new CandidateDaoImpl();
        candidate c = new candidate();
        
        if (session == null || session.getAttribute("username") == null) {
            session.setAttribute("msg", "Please login as admin first.");
            return "redirect:/adminlogin";
        }

        String role = (String) session.getAttribute("role");

        if (role == null || !role.equals("admin")) {
            session.setAttribute("msg", "Access denied. Admin login required.");
            return "redirect:/adminlogin";
        }

        if (isBlank(op)) {
            session.setAttribute("msg", "Please select an operation first.");
            return "redirect:/candidatemanagement";
        }

        if (op.equals("Delete Candidate")) {

            if (isBlank(idStr)) {
                session.setAttribute("msg", "Please enter Candidate ID before deleting candidate.");
                return "redirect:/candidatemanagement";
            }

            try {
                c.setId(Integer.parseInt(idStr));
            } catch (NumberFormatException e) {
                session.setAttribute("msg", "Please enter a valid Candidate ID.");
                return "redirect:/candidatemanagement";
            }

            boolean deleted = daoimpl.deletecandidate(c);

            if (deleted) {
                session.setAttribute("msg", "Candidate Deleted Successfully");
            } else {
                session.setAttribute("msg", "Candidate Could Not Be Deleted");
            }

            return "redirect:/candidatemanagement";
        }

        if (op.equals("Update Candidate")) {

            if (isBlank(idStr)) {
                session.setAttribute("msg", "Please enter Candidate ID before updating candidate.");
                return "redirect:/candidatemanagement";
            }

            try {
                c.setId(Integer.parseInt(idStr));
            } catch (NumberFormatException e) {
                session.setAttribute("msg", "Please enter a valid Candidate ID.");
                return "redirect:/candidatemanagement";
            }
        }

        if (op.equals("Add Candidate") || op.equals("Update Candidate")) {

            if (isBlank(fullName) || isBlank(ageStr) || isBlank(partyName) || isBlank(electionType)) {
                session.setAttribute("msg", "Please fill all candidate details first.");
                return "redirect:/candidatemanagement";
            }

            int age;

            try {
                age = Integer.parseInt(ageStr);
            } catch (NumberFormatException e) {
                session.setAttribute("msg", "Please enter a valid age.");
                return "redirect:/candidatemanagement";
            }

            if (age < 18) {
                session.setAttribute("msg", "Candidate age must be 18 or above.");
                return "redirect:/candidatemanagement";
            }

            c.setFullname(fullName);
            c.setAge(age);
            c.setPartyname(partyName);
            c.setElection_type(electionType);

            try {
                String photoName = savePhoto(photoFile, existingPhoto);
                c.setPhoto(photoName);
            } catch (IOException e) {
                e.printStackTrace();
                session.setAttribute("msg", "Failed to upload candidate image.");
                return "redirect:/candidatemanagement";
            }

            if (op.equals("Add Candidate")) {
                boolean added = daoimpl.addcandidate(c);

                if (added) {
                    session.setAttribute("msg", "Candidate Added Successfully");
                } else {
                    session.setAttribute("msg", "Candidate Could Not Be Added");
                }
            }

            if (op.equals("Update Candidate")) {
                boolean updated = daoimpl.updatecandidate(c);

                if (updated) {
                    session.setAttribute("msg", "Candidate Updated Successfully");
                } else {
                    session.setAttribute("msg", "Candidate Could Not Be Updated");
                }
            }

            return "redirect:/candidatemanagement";
        }

        session.setAttribute("msg", "Invalid Operation");
        return "redirect:/candidatemanagement";
    }

    private String savePhoto(MultipartFile photoFile, String existingPhoto) throws IOException {

        if (photoFile != null && !photoFile.isEmpty()) {

            String originalFileName = photoFile.getOriginalFilename();

            if (originalFileName == null || originalFileName.trim().isEmpty()) {
                return existingPhoto;
            }

            String imageFileName = Path.of(originalFileName).getFileName().toString();

            String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/images";

            File uploadDirFile = new File(uploadDir);

            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            Path filePath = Path.of(uploadDir, imageFileName);

            Files.copy(photoFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            return imageFileName;
        }

        return existingPhoto;
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