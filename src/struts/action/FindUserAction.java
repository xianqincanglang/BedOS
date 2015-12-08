package struts.action;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.xpath.internal.operations.Bool;

import hibernate.LoginInfo;
import hibernate.util.HibernateUtil;

public class FindUserAction extends ActionSupport{
	
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
	
	
	@Override
	public String execute() throws Exception {
		
		//获得request和response对象
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		
		
		String strUserName = request.getParameter("username");
		String strPwd = request.getParameter("password");
		
		//执行HQL
		java.util.List list = HibernateUtil.findUser(strUserName, strPwd);
		request.getSession().setAttribute("list", list);
		System.out.println(list);
		LoginInfo loginInfo = new LoginInfo();
		
		Boolean temp = false;
		
		if (list != null && !list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				loginInfo = (LoginInfo)list.get(i);
				String userName = loginInfo.getLoginId();
				String password = loginInfo.getLoginPwd();
				String isAdmin = loginInfo.getIsAdmin();
				System.out.println(username+"密码:"+password+"是否是管理员"+isAdmin);
				if (strUserName.equals(userName) && strPwd.equals(password)) {
					temp = true;
					application.setAttribute("isAdmin", isAdmin);
					application.setAttribute("token", userName);
				}
			}
		}
		
		if (temp) {
			
			return SUCCESS;
		}else {
			return ERROR;
		}
		
		
	}
}
