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
import com.chauhan.foodbox.Modal.SendMail;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/ChangeOrdersStatus")
public class ChangeOrdersStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String page=request.getParameter("page");
			String status=request.getParameter("status");
			String email=request.getParameter("email");
			int id=Integer.parseInt(request.getParameter("id"));
			
			DAO db=new DAO();
			db.changeOrdersStatus(id,status);
			db.closeConnection();
			
			//With mail send
			  String sub="Order Status Update";
			  String body="Your Order status is "+status;
			  SendMail.sendMail(email, sub, body);
			
			HttpSession session=request.getSession();
			session.setAttribute("msg","Status Updated Successfully!");
			response.sendRedirect(page+".jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
