package com.admin.servlet;


import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.entity.*;
import com.DAO.BookDAOImpl;
import com.DB.DBconnect;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String bookcategories = req.getParameter("bookcategory");
            String categories = req.getParameter("category");
            String status = req.getParameter("status");
            Part filepart = req.getPart("bimg");
            String fileName =filepart.getSubmittedFileName();

            BookDtls b = new BookDtls(bookName, author, price, bookcategories,categories, status, fileName, "admin");
            BookDAOImpl dao=new BookDAOImpl(DBconnect.getconn());
            
            boolean f=dao.addBooks(b);
            
            HttpSession session=req.getSession();
            if(f){
            	String path=getServletContext().getRealPath("")+"books";
                File file=new File(path);
                filepart.write(path + File.separator + fileName);
            	
                session.setAttribute("succMsg","Book add Successfully");
                resp.sendRedirect("admin/add_books.jsp");
            }else{
                session.setAttribute("failedMsg", "Something wrong on Server");
                resp.sendRedirect("admin/add_books.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
