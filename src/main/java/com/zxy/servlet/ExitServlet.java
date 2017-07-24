package com.zxy.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExitServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getSession().removeAttribute("user");
		req.getSession().removeAttribute("admin");
		//req.getRequestDispatcher("login.jsp").forward(req, resp);
		resp.sendRedirect("index.jsp");
	}
}
