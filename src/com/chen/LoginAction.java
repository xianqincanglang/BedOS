package com.chen;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.mapping.List;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hibernate.AdminInfo;

public class LoginAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String username;
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
//	登录处理
	@Override
	public String execute() throws Exception {

		
		//实例化configuration，并默认加载hibernate.cfg.xml文件
		Configuration configuration = new Configuration().configure();
		//创建session
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		
		AdminInfo adminInfo = new AdminInfo();
		Query query = session.createQuery("select p.pwd from AdminInfo as p where p.name='admin'");
		
		java.util.List list = query.list();
		
		Boolean temp = false;
		for(int i=0;i<list.size();i++){
			String pwd = (String)list.get(i);
			if (pwd.equals(getPassword())) {
				System.out.println(pwd+"++++++++");
				temp = true;
			}else{
				System.out.println("--------");
				temp = false;
			}
			
		}
		transaction.commit();
		session.close();
		sessionFactory.close();
		
		if (temp) {
			return SUCCESS;
		}else {
			return ERROR;
		}
		
	}
	
}
