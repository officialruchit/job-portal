/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Lenovo
 */
public class UserDAO {

    private Connection con;

    public UserDAO(Connection con) {
        this.con = con;
    }

    public boolean addUser(user u) {
        boolean f = false;
        try {
            String sql = "INSERT INTO user(name,email,pass,qualification,role) VALUES (?,?,?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, u.getName());
            pr.setString(2, u.getEmail());
            pr.setString(3, u.getPassword());
            pr.setString(4, u.getQualification());
            pr.setString(5, "user");
            int i = pr.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public user login(String em, String pa) {
        user u = null;

        try {
            String sql = "SELECT * FROM user WHERE email=? and pass=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, em);
            pr.setString(2, pa);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                u = new user();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setQualification(rs.getString(5));
                u.setRole(rs.getString(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public boolean updateUser(user u) {
        boolean f = false;

        try {
            String sql = "UPDATE user SET name=?,email=?,pass=?,qualification=? WHERE id=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, u.getName());
            pr.setString(2, u.getEmail());
            pr.setString(3, u.getPassword());
            pr.setString(4, u.getQualification());
            pr.setInt(5, u.getId());
            int i = pr.executeUpdate();
            
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
