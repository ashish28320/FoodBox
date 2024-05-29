package com.chauhan.foodbox.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

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
@WebServlet("/UserOTPVerify")
@MultipartConfig 
public class UserOTPVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("email");
			int otp=Integer.parseInt(request.getParameter("otp"));
			
			DAO db=new DAO();
			boolean result=db.verifyOTPUser(email,otp);
			db.closeConnection();
			
			
			
			HttpSession session=request.getSession();
			if(result) {
				session.setAttribute("msg","Email ID has been verified.");
				session.setAttribute("uemail", email);
				response.sendRedirect("User.jsp");
			}else {
				session.setAttribute("msg","Email ID verification failed");
				response.sendRedirect("User.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
