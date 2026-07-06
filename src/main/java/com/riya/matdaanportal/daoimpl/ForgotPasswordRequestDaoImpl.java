package com.riya.matdaanportal.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.riya.matdaanportal.pojo.ForgotPasswordRequest;

public class ForgotPasswordRequestDaoImpl {

    Connection con = null;

    public ForgotPasswordRequestDaoImpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/matdaanportal",
                    "root",
                    "root"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean saveForgotPasswordRequest(ForgotPasswordRequest request) {
        boolean status = false;

        try {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO forgot_password_requests (username, email, mobile, user_message) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, request.getUsername());
            ps.setString(2, request.getEmail());
            ps.setString(3, request.getMobile());
            ps.setString(4, request.getUserMessage());

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<ForgotPasswordRequest> getAllForgotPasswordRequests() {
        List<ForgotPasswordRequest> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM forgot_password_requests ORDER BY id DESC"
            );

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ForgotPasswordRequest request = new ForgotPasswordRequest();

                request.setId(rs.getInt("id"));
                request.setUsername(rs.getString("username"));
                request.setEmail(rs.getString("email"));
                request.setMobile(rs.getString("mobile"));
                request.setUserMessage(rs.getString("user_message"));
                request.setStatus(rs.getString("status"));
                request.setCreatedAt(rs.getString("created_at"));

                list.add(request);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}