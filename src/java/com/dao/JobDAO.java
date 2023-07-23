/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.jobs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class JobDAO {

    private Connection conn;

    public JobDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addjobs(jobs j) {
        boolean f = false;

        try {
            String sql = "INSERT INTO jobs(title, description, category, status, location) VALUES (?,?,?,?,?)";
            PreparedStatement pr = conn.prepareStatement(sql);

            pr.setString(1, j.getTitle());
            pr.setString(2, j.getDescription());
            pr.setString(3, j.getCategory());
            pr.setString(4, j.getStatus());
            pr.setString(5, j.getLocation());
            int i = pr.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public List<jobs> getAllJob() {
        List<jobs> list = new ArrayList<jobs>();

        jobs j = null;

        try {
            String sql = "SELECT * FROM jobs";
            PreparedStatement pr = conn.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                j = new jobs();
                j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setStatus(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setPdate(rs.getTimestamp(7) + "");
                list.add(j);
            }
 
        } catch (Exception e) { 
            e.printStackTrace();
        }
        return list;
    }

    public List<jobs> getAllJobForUser(){
        List<jobs> list=new ArrayList<>();
        
        jobs j=null;
        try{
            String sql="SELECT * FROM jobs WHERE status=?";
            PreparedStatement pr=conn.prepareStatement(sql);
            pr.setString(1, "active");
            ResultSet rs=pr.executeQuery();
            while(rs.next()){
                j=new jobs();
                j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setStatus(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setPdate(rs.getString(7));
                list.add(j);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    
    
    public jobs getJobId(int id) {

        jobs j = null;

        try {
            String sql = "SELECT * FROM jobs WHERE id=?";
            PreparedStatement pr = conn.prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                j = new jobs();
                j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setStatus(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setPdate(rs.getTimestamp(7)+"");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return j;
    }

    public boolean updateJob(jobs j){
          boolean f = false;

        try {
            String sql = "update jobs set title=?, description=?, category=?, status=?, location=? where id=?";
            PreparedStatement pr = conn.prepareStatement(sql);

            pr.setString(1, j.getTitle());
            pr.setString(2, j.getDescription());
            pr.setString(3, j.getCategory());
            pr.setString(4, j.getStatus());
            pr.setString(5, j.getLocation());
             pr.setInt(6, j.getId());
            int i = pr.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
   
    
public boolean deletejobs(int id){
    boolean f=false;
    
    try{
    String sql="delete from jobs where id=?";
    PreparedStatement st=conn.prepareStatement(sql);
    st.setInt(1, id);
    int i=st.executeUpdate();
    
    if(i==1){
        f=true;
    }
    
    }catch(Exception e){
        e.printStackTrace();
    }
    
    return f;
}    
   
 public List<jobs> getJobsORLocationAndCate(String category,String location){
        List<jobs> list=new ArrayList<jobs>();
        jobs j=null;
        
        try{
            String sql="select *from jobs where category=? or location=?";
            PreparedStatement pr=conn.prepareStatement(sql);
            pr.setString(1,category);
            pr.setString(2,location);
            ResultSet rs= pr.executeQuery();
            
            while(rs.next()){
                j=new jobs();
                j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setLocation(rs.getString(5));
                j.setStatus(rs.getString(6));
                j.setPdate(rs.getString(7));
                list.add(j);
            }
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

 
  public List<jobs> getJobsAndLocationAndCate(String cat,String loc){
        List<jobs> list=new ArrayList<jobs>();
        jobs j=null;
        
        try{
            String sql="select *from jobs where category=? and location=?";
            PreparedStatement pr=conn.prepareStatement(sql);
            pr.setString(1,cat);
            pr.setString(2,loc);
            ResultSet rs= pr.executeQuery();
            
            while(rs.next()){
                j=new jobs();
                j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCategory(rs.getString(4));
                j.setLocation(rs.getString(5));
                j.setStatus(rs.getString(6));
                j.setPdate(rs.getString(7));
                list.add(j);
            }
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    
}
