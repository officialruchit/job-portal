/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class Touch {
     private Connection conn;

    public Touch(Connection conn) {
        this.conn = conn;
    }

    public boolean addMsg( contact c) {
        boolean f = false;

        try {
            String sql = "INSERT INTO contact( name, no, mail, msg) VALUES (?,?,?,?)";
            PreparedStatement pr = conn.prepareStatement(sql);

            pr.setString(1, c.getName());
            pr.setInt(2, c.getNo());
            pr.setString(3, c.getMail());
            pr.setString(4, c.getMsg());
           
            int i = pr.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    

    public List<contact> getAllMsg() {
        List<contact> list = new ArrayList<contact>();

        contact c = null;

        try {
            String sql = "SELECT * FROM contact";
            PreparedStatement pr = conn.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                c= new contact();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setNo(rs.getInt(3));
                c.setMail(rs.getString(4));
                c.setMsg(rs.getString(5));
                list.add(c);
            }
 
        } catch (Exception e) { 
            e.printStackTrace();
        }
        return list;
    }

public boolean deleteMsg(int id){
    boolean f= false;
    
    try{
        String sql = "DELETE FROM `contact` WHERE id=?";
        PreparedStatement pr=conn.prepareStatement(sql);
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
    
}
