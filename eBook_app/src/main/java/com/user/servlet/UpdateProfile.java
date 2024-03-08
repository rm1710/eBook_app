package com.user.servlet;

import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.DAO.UserDAOImpl;
import com.DB.DBconnect;
import com.entity.User;

import java.io.IOException;

import javax.servlet.*;

@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			int id=Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
	        String email = req.getParameter("email");
	        String phno = req.getParameter("phno");
	        String passwd = req.getParameter("password");
	        
	        User us=new User();
	        us.setId(id);
	        us.setName(name);
	        us.setEmail(email);
	        us.setPhno(phno);
	        
	        HttpSession session=req.getSession();
	        UserDAOImpl dao=new UserDAOImpl(DBconnect.getconn());
	        boolean f=dao.checkPassword(id, passwd);
	        
	        if(f) {
	        	boolean f2=dao.updateProfile(us);
	        	if(f2) {
	        		 session.setAttribute("succMsg", "Profile Update Successfully...");
	                    resp.sendRedirect("Edit_profile.jsp");
	        	}else {
	        		 session.setAttribute("failedMsg", "Profile is not updated");
	                    resp.sendRedirect("Edit_profile.jsp");
	        	}
	        }else {
	        	 session.setAttribute("failedMsg", "Your password is Incorrect");
                 resp.sendRedirect("Edit_profile.jsp");
	        }
	        
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
