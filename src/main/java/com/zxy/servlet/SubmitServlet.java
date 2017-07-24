package com.zxy.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.zxy.dao.SubmitDao;
import com.zxy.model.Login;
import com.zxy.model.Submitwork;
import com.zxy.model.WorkTable;

public class SubmitServlet extends HttpServlet{
	String uploadPath="E:/temp";
	String tempPath="E:/temp/buffer/";
	File tempPathFile;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Login login=(Login) req.getSession().getAttribute("user");
		if(login==null){
			resp.sendRedirect("login.jsp");
			return;
		}
		String search=req.getParameter("search");
		String add=req.getParameter("add");
		String delete=req.getParameter("delete");
		String detail=req.getParameter("detail");
		String askname=req.getParameter("askname");
		if(askname!=null&&askname.equals("true")){
			SubmitDao dao=new SubmitDao();
			String name=dao.findNameById(login.getUsername());
			req.setAttribute("workid", Integer.parseInt(req.getParameter("workid")));
			req.setAttribute("username", name);
			req.getRequestDispatcher("upload.jsp").forward(req, resp);;
			return;
		}
		if(search.equals("true")&&add.equals("false")&&delete.equals("false")&&detail.equals("false")){
			WorkTable workTable=new WorkTable();
			SubmitDao dao=new SubmitDao();
			dao.searchAllWork(workTable);
			req.setAttribute("workTable", workTable);
			req.getRequestDispatcher("submit.jsp").forward(req, resp);
		}else if(search.equals("false")&&add.equals("false")&&delete.equals("false")&&detail.equals("true")){
			int workid=Integer.parseInt(req.getParameter("workid"));
			Submitwork submitwork=new Submitwork();
			SubmitDao dao=new SubmitDao();
			submitwork=dao.isSubmit(login, workid, submitwork);
			req.setAttribute("workid", workid);
			req.setAttribute("submitwork", submitwork);
			req.getRequestDispatcher("detail.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Login login=(Login) req.getSession().getAttribute("user");
		if(login==null){
			resp.sendRedirect("login.jsp");
			return;
		}
		init();
		DiskFileItemFactory factory=new DiskFileItemFactory();
		factory.setSizeThreshold(4096);;//设置缓冲区大小
		factory.setRepository(tempPathFile);//设置缓冲区目录
		ServletFileUpload upload=new ServletFileUpload(factory);
		upload.setFileSizeMax(8388608);//设置最大文件尺寸，这里是8MB
		int workid=-1;
		String name=null;
		try {
			List<FileItem> items=upload.parseRequest(req);
			Iterator<FileItem> t = items.iterator();
			while(t.hasNext()){
				FileItem fi=t.next();
				String value = new String(fi.getString().getBytes("iso-8859-1"), "utf-8");
				String fieldValue=fi.getFieldName();
				if(fieldValue.equals("name")){
					name=value;
				}
				if(fieldValue.equals("workid")){
					workid=Integer.parseInt(value);
				}
				String fileName=fi.getName();
				
				if(fileName!=null&&name!=null){
					String form=fileName.substring(fileName.indexOf("."));
					File fullFile=new File(fileName);
					File saveFile=new File(uploadPath,name+form);
					fi.write(saveFile);
				}
			}
			if(workid!=-1){
				SubmitDao dao=new SubmitDao();
				dao.submit(login.getUsername(),workid);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(workid+"++++++++++++++");
		if(workid==-1){
			resp.sendRedirect("error.jsp");
			return;
		}else
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	
	public void init(){
		File uploadFile=new File(uploadPath); 
		if(!uploadFile.exists()){
			uploadFile.mkdirs();
		}
		tempPathFile=new File(tempPath);
		if(!tempPathFile.exists()){
			tempPathFile.mkdirs();
		}
	}
}




