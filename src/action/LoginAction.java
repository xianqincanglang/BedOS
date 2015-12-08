package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
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
import hibernate.LoginInfo;

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
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	
	@Override
	public String execute() throws Exception {
		
		
		
		
		System.out.println("请求是:"+request);
		//实例化configuration，并默认加载hibernate.cfg.xml文件
		Configuration configuration = new Configuration().configure();
		//创建session
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		
		
		LoginInfo loginInfo = new LoginInfo();
		Query query = session.createQuery("select p.loginPwd from LoginInfo as p where p.loginId='admin'");
		
		java.util.List list = query.list();
		
		Boolean temp = false;
		for(int i=0;i<list.size();i++){
			String pwd = (String)list.get(i);
			if (pwd.equals(getPassword())) {
				System.out.println(pwd+"++++++++");
				
				request.setAttribute("loginId", "admin");
				
				
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
