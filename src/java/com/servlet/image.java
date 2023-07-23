/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.DB.DBConnect;
import com.dao.Applyjob;
import com.entity.apply;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import static sun.security.krb5.Confounder.bytes;

/**
 *
 * @author Lenovo
 */
@MultipartConfig
public class image extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet image</title>");
            out.println("</head>");
            out.println("<body>");

            String name = request.getParameter("name");
            String mail = request.getParameter("mail");
            String title = request.getParameter("title");
            String location = request.getParameter("location");
            int no = Integer.parseInt(request.getParameter("no"));
            Part part = request.getPart("image");

            String Image = part.getSubmittedFileName();

            apply ab = new apply(name, mail, location, title, no, Image);

            String path = getServletContext().getRealPath("/" + "files" + File.separator + Image);
            InputStream is= part.getInputStream();
            

            Applyjob a = new Applyjob(DBConnect.getConn());

            boolean f = a.addjobs(ab);
             
           boolean i= upload(is,path);
            
            
            
            HttpSession s = request.getSession();
            if (f & i) {
                s.setAttribute("succMsg", "successfull");
                response.sendRedirect("home.jsp");
            } else {
                s.setAttribute("succMsg", " not successfull");
                response.sendRedirect("signup.jsp");
            }

            out.println("<h1>Servlet image at " + request.getContextPath() + "</h1>");
            out.println("</body>");

            out.println("</html>");

        }
    }

    public boolean upload(InputStream is, String path) {
        boolean test = false;

        try {
            byte[] byt = new byte[is.available()];
            is.read();
            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
