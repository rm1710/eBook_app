package com.user.servlet;

import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.DAO.*;
import com.DB.DBconnect;
import com.entity.*;
import java.util.*;

import java.io.IOException;

import javax.servlet.*;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			HttpSession session=req.getSession();
			
			
			String name=req.getParameter("uname");
			String email=req.getParameter("email");
			
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("lm");
			String district=req.getParameter("dist");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			String fulladd=address+","+landmark+","+district+"-"+pincode+","+state;
			
			CartDAOImpl dao= new CartDAOImpl(DBconnect.getconn());
			
			List<Cart> list=dao.getBookByUser(id);
			
			if(list.isEmpty()) {
				session.setAttribute("failedMsg", "Add Book into cart");
				resp.sendRedirect("checkout.jsp");
			}else {
				BookOrderImpl dao2=new BookOrderImpl(DBconnect.getconn());
				
				Book_order o = null;
				
				ArrayList<Book_order> orderList=new ArrayList<Book_order>();
				Random r=new Random();
				for(Cart c:list) {
					o=new Book_order();
					o.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
					o.setUname(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fulladd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					
					orderList.add(o);
				}
				
				
				if("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Please Choose payment Method");
					resp.sendRedirect("checkout.jsp");
				}else {
					boolean f = dao2.saveOrder(orderList);
					if(f) {
						resp.sendRedirect("order_success.jsp");
					}else {
						session.setAttribute("failedMsg", "Your Order failed");
						resp.sendRedirect("checkout.jsp");
					}
			
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
