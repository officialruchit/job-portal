/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.apply;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class Applyjob {

    private Connection con;

    public Applyjob(Connection con) {
        this.con = con;
    }

    public List<apply> all() {
        List<apply> list = new ArrayList<apply>();
        apply a = null;
        try {
            String sql = "SELECT * FROM apply";
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                a = new apply();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                a.setMail(rs.getString(3));
                a.setTitle(rs.getString(4));
                a.setLocation(rs.getString(5));
                a.setNo(rs.getInt(6));
                a.setImage(rs.getString(7));
                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean delete(int id){
    boolean f= false;
    
    try{
        String sql = "DELETE FROM apply WHERE id=?";
        PreparedStatement pr=con.prepareStatement(sql);
        pr.setInt(1, id);
        int i=pr.executeUpdate();
        if(i == 1){
            f=true;
        }
        
        
    }catch(Exception e){
        e.printStackTrace();
    }
    
    return f;
}

     public boolean addjobs(apply a) {
        boolean f = false;

        try {
           
            String sql = "INSERT INTO apply( name, mail, title, location, no, image) VALUES (?,?,?,?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);

            pr.setString(1, a.getName());
            pr.setString(2, a.getMail());
            pr.setString(3, a.getTitle());
            pr.setString(4, a.getLocation());
            pr.setInt(5, a.getNo());
             pr.setString(6, a.getImage());
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
