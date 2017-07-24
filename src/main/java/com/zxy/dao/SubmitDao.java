package com.zxy.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.zxy.model.DetailPeo;
import com.zxy.model.Login;
import com.zxy.model.Submitwork;
import com.zxy.model.Userinfo;
import com.zxy.model.Work;
import com.zxy.model.WorkTable;
import com.zxy.util.HibernateSessionFactory;

public class SubmitDao {
	public void submit(String userid,int workid){
		Session session=null;
		Submitwork submitwork=null;
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql="from Submitwork submitwork where submitwork.userid = ? and submitwork.workid = ?";
			submitwork=(Submitwork) session.createQuery(sql).setParameter(0, userid).setParameter(1, workid).uniqueResult();
			submitwork.setIssub(1);
			submitwork.setSubdate(new Date());
			session.saveOrUpdate(submitwork);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
	}
	
	public String findNameById(String userid){
		Session session=null;
		Userinfo userinfo=null;
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql="from Userinfo userinfo where userinfo.id = ?";
			userinfo=(Userinfo) session.createQuery(sql).setParameter(0, userid).uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
		return userinfo.getUsername();
	}
	
	public Submitwork isSubmit(Login login,int workid,Submitwork submitwork){
		String username=login.getUsername();
		Session session=null;
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql="from Submitwork submitwork where submitwork.workid = ? and submitwork.userid = ? and issub = 1";
			submitwork=(Submitwork) session.createQuery(sql).setParameter(0, workid).setParameter(1, username).uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
		return submitwork;
	}
	
	public void searchDetail(DetailPeo detailPeo,int workid){
		Session session=null;
		List<Submitwork> submitpeo;
		List<Submitwork> nosubmitpeo;
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql1="from Submitwork submitwork where submitwork.workid = ? and submitwork.issub = 1";
			String sql2="from Submitwork submitwork where submitwork.workid = ? and submitwork.issub = 0";
			submitpeo=session.createQuery(sql1).setParameter(0, workid).list();
			nosubmitpeo=session.createQuery(sql2).setParameter(0, workid).list();
			detailPeo.setNosubmitnum(nosubmitpeo.size());
			detailPeo.setNosubmitpeo(nosubmitpeo);
			detailPeo.setSubmitnum(submitpeo.size());
			detailPeo.setSubmitpeo(submitpeo);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
	}
	
	public void searchAllWork(WorkTable workTable){
		Session session=null;
		List<Work> worklist=new ArrayList<Work>();
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql="from Work work";
			worklist=session.createQuery(sql).list();
			workTable.setWorklist(worklist);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
	}
	
	public boolean saveWork(Work work){
		Session session=null;
		boolean flag=true;
		String workname=work.getWorkname();
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			session.save(work);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			flag=false;
		} finally{
			HibernateSessionFactory.closeSession();
		}
		if(flag==true){
			flag=addTable(work);
		}
		return flag;
	}
	
	public boolean addTable(Work work){
		Session session=null;
		boolean flag=true;
		String workname=work.getWorkname();
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql1="from Work work where work.workname = ?";
			Work w=(Work) session.createQuery(sql1).setParameter(0, workname).uniqueResult();
			int workid=w.getId();
			String sql2="from Userinfo userinfo";
			List<Userinfo> usinfo=session.createQuery(sql2).list();
			for(int i=0;i<usinfo.size();i++){
				Userinfo temp=usinfo.get(i);
				Submitwork sbw=new Submitwork();
				sbw.setUserid(temp.getId());
				sbw.setUsername(temp.getUsername());
				sbw.setWorkid(workid);
				sbw.setSubdate(new Date());
				sbw.setIssub(0);
				session.save(sbw);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
		return flag;
	}
	
}



