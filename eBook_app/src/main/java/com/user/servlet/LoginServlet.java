package com.user.servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.*;
import com.DB.*;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAOImpl dao = new UserDAOImpl(DBconnect.getconn());

            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String hashedPassword = xpwd(password);
            
            if (dao.admin(email, password)) {
            	User adminUser = dao.isadmin(email, password);
                if (adminUser != null) {
                    session.setAttribute("userobj", adminUser);
                    resp.sendRedirect("admin/home.jsp");
                } else {
                    session.setAttribute("failedMsg", "Email & Password is Invalid");
                    resp.sendRedirect("login.jsp");
                }
            } else {

                User us = dao.login(email, hashedPassword);
                if (us != null) {
                    session.setAttribute("userobj", us);
                    resp.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("failedMsg", "Email & Password is Invalid");
                    resp.sendRedirect("login.jsp");
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private String xpwd(String password) {
    	try {
	           MessageDigest digest = MessageDigest.getInstance("SHA-256");
	            byte[] hash = digest.digest(password.getBytes());

	            StringBuilder hexString = new StringBuilder();
	            for (byte b : hash) {
	                String hex = Integer.toHexString(0xff & b);
	                if (hex.length() == 1)
	                    hexString.append('0');
	                hexString.append(hex);
	            }
	            return hexString.toString();
	        } catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	            return null;
	        }
    }
    

}
