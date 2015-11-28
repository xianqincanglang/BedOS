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
	private String tip;
	
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
	
	
	public void setTip(String tip){
		this.tip = tip;
	}
	public String getTip(){
		return this.tip;
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
		
		ActionContext actionContext = ActionContext.getContext();
		//通过ActionContext访问application范围的属性值
		Integer counter = (Integer)actionContext.getApplication().get("counter");
		if (counter == null) {
			counter = 1;
		}else{
			counter = counter + 1;
		}
		
		//通过ActionContext设置application的属性
		actionContext.getApplication().put("counter", counter);
		//通过ActionContext设置Session范围的属性
		actionContext.getSession().put("user", getUsername());
		
		if (temp) {
			actionContext.put("tip", "服务器提示，成功登录");
			return SUCCESS;
		}else {
			actionContext.put("tip", "服务器提示，登录失败");
			return ERROR;
		}
		
		
		
		
	}
	
}
