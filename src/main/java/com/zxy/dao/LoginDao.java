package com.zxy.dao;


import org.hibernate.Session;

import com.zxy.model.Adminlogin;
import com.zxy.model.Login;
import com.zxy.model.Userinfo;
import com.zxy.util.HibernateSessionFactory;

public class LoginDao {
	public boolean isLogin(Login login){
		Session session=null;
		boolean exist=false;
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql="from Login login where login.username = ? and login.password = ?";
			Object user = session.createQuery(sql)
					.setParameter(0, login.getUsername())
					.setParameter(1, login.getPassword())
					.uniqueResult();
			if(user!=null){
				return true;
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
		return exist;
	}
	
	public boolean isAdmin(Adminlogin admin){
		Session session=null;
		boolean exist=false;
		try {
			session=HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql="from Adminlogin login where login.adminname = ? and login.password = ?";
			Object user = session.createQuery(sql)
					.setParameter(0, admin.getAdminname())
					.setParameter(1, admin.getPassword())
					.uniqueResult();
			if(user!=null){
				exist= true;
			}else{
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally{
			HibernateSessionFactory.closeSession();
		}
		return exist;
	}
	
	
}
