package com.riya.matdaanportal.controller;

import java.util.List;

import com.riya.matdaanportal.daoimpl.CandidateDaoImpl;
import com.riya.matdaanportal.daoimpl.UserDaoImpl;
import com.riya.matdaanportal.daoimpl.VotingDaoImpl;
import com.riya.matdaanportal.pojo.candidate;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class VotingController {

    @PostMapping("/VotingServlet")
    public String castVote(HttpServletRequest request) {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            request.setAttribute("msg", "Please login first before casting your vote.");
            return "voting";
        }

        String role = (String) session.getAttribute("role");

        if (role == null || !role.equals("voter")) {
            request.setAttribute("msg", "Only voter account can cast vote. Please login as voter.");
            return "voting";
        }

        String username = (String) session.getAttribute("username");

        String voterId = request.getParameter("voter_id");
        if (voterId != null) {
            voterId = voterId.trim();
        }

        String candidateName = request.getParameter("selected_candidate");
        if (candidateName != null) {
            candidateName = candidateName.trim();
        }

        if (voterId == null || voterId.isEmpty()) {
            request.setAttribute("msg", "Please enter your Voter ID before voting.");
            return "voting";
        }

        if (candidateName == null || candidateName.isEmpty()) {
            request.setAttribute("msg", "Please select a candidate before submitting your vote.");
            return "voting";
        }

        VotingDaoImpl votingDao = new VotingDaoImpl();
        UserDaoImpl userDao = new UserDaoImpl();
        CandidateDaoImpl candidateDao = new CandidateDaoImpl();

        try {
            if (!userDao.isOwnVoterId(username, voterId)) {
                request.setAttribute("msg", "Security violation: You can only vote with your own registered Voter ID.");
                return "voting";
            }

            if (!userDao.isValidVoter(voterId)) {
                request.setAttribute("msg", "Invalid Voter ID.");
                return "voting";
            }

            String activeElection = candidateDao.getActiveElectionType();

            if (activeElection == null || activeElection.trim().isEmpty()) {
                request.setAttribute("msg", "No active election available for voting.");
                return "voting";
            }

            session.setAttribute("activeElectionType", activeElection);

            if (votingDao.hasVotedInElection(voterId, activeElection)) {
                request.setAttribute("msg", "You have already voted!");
                return "voting";
            }

            List<candidate> candidates = candidateDao.getCandidatesByElectionType(activeElection);

            if (candidates == null || candidates.isEmpty()) {
                request.setAttribute("msg", "No candidates found for current election.");
                return "voting";
            }

            final String selectedCandidate = candidateName;

            boolean validCandidate = candidates.stream()
                    .anyMatch(c -> c.getFullname() != null && c.getFullname().equalsIgnoreCase(selectedCandidate));

            if (!validCandidate) {
                request.setAttribute("msg", "Invalid candidate for current election: " + activeElection);
                return "voting";
            }

            boolean voted = votingDao.recordVote(voterId, candidateName, activeElection);

            if (voted) {
                userDao.markAsVoted(voterId);
                request.setAttribute("msg", "Thank you for voting for " + candidateName);
            } else {
                request.setAttribute("msg", "Voting failed. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "System error during voting.");
        }

        return "voting";
    }
}