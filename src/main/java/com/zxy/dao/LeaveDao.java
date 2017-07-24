package com.zxy.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.zxy.model.LeavePeo;
import com.zxy.model.Userinfo;
import com.zxy.util.HibernateSessionFactory;

public class LeaveDao {
	public boolean sign(String username,int how){
		Session session=null;
		boolean flag=true;
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql="from Userinfo userinfo where userinfo.id = ?";
			Userinfo user =(Userinfo) session.createQuery(sql)
					.setParameter(0, username)
					.uniqueResult();
			if(user==null){
				flag= false;
			}else{
				user.setChosen(how);
				session.saveOrUpdate(user);
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
	
	public void clear(){
		Session session=null;
		boolean flag=true;
		List<Userinfo> userinfolist =null;
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql="from Userinfo userinfo";
			userinfolist = session.createQuery(sql).list();
			for (Userinfo userinfo : userinfolist) {
				userinfo.setChosen(0);
				session.saveOrUpdate(userinfo);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
	}
	
	public void search(LeavePeo leavePeo){
		int homenum=0;
		int travelnum=0;
		List<Userinfo> homepeo=new ArrayList<Userinfo>();
		List<Userinfo> travelpeo=new ArrayList<Userinfo>();
		Session session=null;
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql1="from Userinfo userinfo where userinfo.chosen = 1";
			homepeo = session.createQuery(sql1).list();
			String sql2="from Userinfo userinfo where userinfo.chosen = 2";
			travelpeo =session.createQuery(sql2).list();
			homenum=homepeo.size();
			travelnum=travelpeo.size();
			
			leavePeo.setHomenum(homenum);
			leavePeo.setHomepeo(homepeo);
			leavePeo.setTravelnum(travelnum);
			leavePeo.setTravelpeo(travelpeo);
			
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
	}
}
