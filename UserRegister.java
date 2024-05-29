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
@WebServlet("/UserRegister")
@MultipartConfig 
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("email");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String address=request.getParameter("address");
			String password=request.getParameter("password");
			Part p=request.getPart("photo");
			InputStream photo=p.getInputStream();
			
			HashMap<String,Object> user=new HashMap();
			 user.put("email", email);
			 user.put("name", name);
			 user.put("phone", phone);
			 user.put("address", address);
			 user.put("password", password);
			 user.put("photo", photo);
			DAO db=new DAO();
			boolean result=db.registerUser(user);
			db.closeConnection();
			HttpSession session=request.getSession();
			if(result) {
				session.setAttribute("msg","User Registered Successfully!");
				response.sendRedirect("User.jsp");
			}else {
				session.setAttribute("msg","User Does Not Exits");
				response.sendRedirect("User.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
