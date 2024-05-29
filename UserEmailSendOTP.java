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
import com.chauhan.foodbox.Modal.SendMail;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/UserEmailSendOTP")
@MultipartConfig 
public class UserEmailSendOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("email");
			
			DAO db=new DAO();
			int result=db.sendOTPUser(email);
			db.closeConnection();
			HttpSession session=request.getSession();
			
			if(result==0) {
				session.setAttribute("msg","User Already Exist!");
				response.sendRedirect("User.jsp");
			}else if(result==1) {
				session.setAttribute("msg", "OTP Sent Failed");
				response.sendRedirect("User.jsp");
				
			}else {	
				session.setAttribute("msg","OTP Sent Successfully!");
				session.setAttribute("uemail", email);
				response.sendRedirect("User.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
