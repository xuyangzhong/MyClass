package com.zxy.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zxy.dao.LeaveDao;
import com.zxy.model.LeavePeo;
import com.zxy.model.Login;

public class LeaveServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String search=req.getParameter("search");
		String clear=req.getParameter("clear");
		if(clear!=null&&clear.equals("true")){
			if(req.getSession().getAttribute("admin")==null){
				resp.sendRedirect("login.jsp");
				return;
			}
			LeaveDao dao=new LeaveDao();
			dao.clear();
			resp.sendRedirect("LeaveServlet?search=true");
		}else
		if(search==null||search.equals("")){
			if(req.getSession().getAttribute("user")==null){
				resp.sendRedirect("login.jsp");
				return;
			}
		
			String way=req.getParameter("way");
			int how=0;
			boolean flag=false;
			Login login=(Login) req.getSession().getAttribute("user");
			LeaveDao dao=new LeaveDao();
			if(way.equals("huijia")){
				how=1;
			}
			if(way.equals("lvyou")){
				how=2;
			}
			flag=dao.sign(login.getUsername(), how);
			if(flag==false){
				resp.sendRedirect("error.jsp");
			}else{
				resp.sendRedirect("index.jsp");
			}
		}else{
			if(req.getSession().getAttribute("user")==null){
				resp.sendRedirect("login.jsp");
				return;
			}
			if(req.getSession().getAttribute("admin")==null){
				resp.sendRedirect("login.jsp");
				return;
			}
			LeavePeo leavePeo=new LeavePeo();
			LeaveDao dao=new LeaveDao();
			dao.search(leavePeo);
			req.setAttribute("leavePeo", leavePeo);
			req.getRequestDispatcher("adminleave.jsp").forward(req, resp);
		}
	}
}
