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
@WebServlet("/AddItem")
@MultipartConfig 
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("name");
			int price=Integer.parseInt(request.getParameter("price"));
			Part p=request.getPart("photo");
			InputStream photo=p.getInputStream();
			DAO db=new DAO();
			boolean result=db.addItem(name, price, photo);
			db.closeConnection();
			HttpSession session=request.getSession();
			if(result) {
				session.setAttribute("msg","Item Successfully Added");
				response.sendRedirect("AdminHome.jsp");
			}else {
				session.setAttribute("msg","Item Already Exits");
				response.sendRedirect("AdminHome.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}
}
