package com.chauhan.foodbox.controllers;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.chauhan.foodbox.Modal.DAO;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			 String uemail=(String)session.getAttribute("uemail");
			 if(uemail==null){
			 	session.setAttribute("msg","Please Login First");
			     response.sendRedirect("User.jsp");
			 }else {
			String item_name=request.getParameter("item_name");
			
			DAO db=new DAO();
			db.addToCart(uemail,item_name);
			db.closeConnection();
			
				session.setAttribute("msg","Item added Successfully!");
				response.sendRedirect("Menu.jsp");
			}
		}		 
		
		catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
