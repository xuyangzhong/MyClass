package com.zxy.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zxy.dao.SubmitDao;
import com.zxy.model.Adminlogin;
import com.zxy.model.DetailPeo;
import com.zxy.model.Work;
import com.zxy.model.WorkTable;

public class AdminSubmitServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Adminlogin admin = (Adminlogin) req.getSession().getAttribute("admin");
		if(admin==null){
			resp.sendRedirect("error.jsp");
			return;
		}
		String search=req.getParameter("search");
		String add=req.getParameter("add");
		String delete=req.getParameter("delete");
		String detail=req.getParameter("detail");
		if(search.equals("true")&&add.equals("false")&&delete.equals("false")&&detail.equals("false")){
			WorkTable workTable=new WorkTable();
			SubmitDao dao=new SubmitDao();
			dao.searchAllWork(workTable);
			req.setAttribute("workTable", workTable);
			req.getRequestDispatcher("adminsub.jsp").forward(req, resp);
		}else if(search.equals("false")&&add.equals("false")&&delete.equals("false")&&detail.equals("true")){
			int workid=Integer.parseInt(req.getParameter("workid"));
			DetailPeo detailPeo=new DetailPeo();
			SubmitDao dao=new SubmitDao();
			dao.searchDetail(detailPeo, workid);
			req.setAttribute("detailPeo", detailPeo);
			req.getRequestDispatcher("admindetail.jsp").forward(req, resp);
		}else{
			resp.sendRedirect("error.jsp");
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Adminlogin admin = (Adminlogin) req.getSession().getAttribute("admin");
		if(admin==null){
			resp.sendRedirect("error.jsp");
		}
		String search=req.getParameter("search");
		String add=req.getParameter("add");
		String delete=req.getParameter("delete");
		String detail=req.getParameter("detail");
		if(search.equals("false")&&add.equals("true")&&delete.equals("false")&&detail.equals("false")){
			String name=req.getParameter("name");
			String beginyear=req.getParameter("beginyear");
			String beginmonth=req.getParameter("beginmonth");
			String beginday=req.getParameter("beginday");
			String endyear=req.getParameter("endyear");
			String endmonth=req.getParameter("endmonth");
			String endday=req.getParameter("endday");
			String begin=beginyear+"-"+beginmonth+"-"+beginday;
			String end=endyear+"-"+endmonth+"-"+endday;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date begindate=sdf.parse(begin);
				Date enddate=sdf.parse(end);
				Work work=new Work();
				work.setWorkbegintime(begindate);
				work.setWorkendtime(enddate);
				work.setWorkname(name);
				SubmitDao dao=new SubmitDao();
				dao.saveWork(work);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			resp.sendRedirect("AdminSubmitServlet?search=true&add=false&delete=false&detail=false");
		}
	}
}




