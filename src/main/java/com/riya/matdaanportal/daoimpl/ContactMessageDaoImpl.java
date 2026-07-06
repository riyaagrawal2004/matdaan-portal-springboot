package com.riya.matdaanportal.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.riya.matdaanportal.pojo.ContactMessage;

public class ContactMessageDaoImpl {

    Connection con = null;

    public ContactMessageDaoImpl() {
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

    public boolean saveContactMessage(ContactMessage message) {
        boolean status = false;

        try {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO contact_messages (name, email, subject, user_message) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, message.getName());
            ps.setString(2, message.getEmail());
            ps.setString(3, message.getSubject());
            ps.setString(4, message.getUserMessage());

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<ContactMessage> getAllContactMessages() {
        List<ContactMessage> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM contact_messages ORDER BY id DESC"
            );

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ContactMessage message = new ContactMessage();

                message.setId(rs.getInt("id"));
                message.setName(rs.getString("name"));
                message.setEmail(rs.getString("email"));
                message.setSubject(rs.getString("subject"));
                message.setUserMessage(rs.getString("user_message"));
                message.setCreatedAt(rs.getString("created_at"));

                list.add(message);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}