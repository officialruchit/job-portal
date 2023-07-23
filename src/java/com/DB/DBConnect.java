/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class DBConnect {
    private static Connection conn;
 
    public static Connection getConn(){
        
        
         try{
            if(conn == null)
             Class.forName("com.mysql.jdbc.Driver");
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","");
        }catch(Exception e){
            e.printStackTrace();
        }
      
        return conn;
    }
    
}
