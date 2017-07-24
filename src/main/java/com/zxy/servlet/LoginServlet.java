package com.zxy.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zxy.dao.LoginDao;
import com.zxy.model.Adminlogin;
import com.zxy.model.Login;

public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String isadmin=req.getParameter("isadmin");
		LoginDao logindao=new LoginDao();
		if(isadmin!=null&&isadmin.equals("Login_of_Admin")){
			Adminlogin adminlogin=new Adminlogin();
			adminlogin.setAdminname(req.getParameter("username"));
			adminlogin.setPassword(req.getParameter("password"));
			if(logindao.isAdmin(adminlogin)==true){
				Login login=new Login();
				login.setUsername(adminlogin.getAdminname());
				login.setPassword(adminlogin.getPassword());
				req.getSession().setAttribute("user", login);
				req.getSession().setAttribute("admin", adminlogin);
				req.getRequestDispatcher("adminindex.jsp").forward(req, resp);
			}else{
				req.setAttribute("login_error", "用户名或密码错误");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		}else{
			Login login=new Login();
			login.setUsername(req.getParameter("username"));
			login.setPassword(req.getParameter("password"));
			if(logindao.isLogin(login)==true){
				req.getSession().setAttribute("user", login);
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}else{
				req.setAttribute("login_error", "用户名或密码错误");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		}
	}
}
