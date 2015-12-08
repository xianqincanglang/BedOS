package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;


import hibernate.LoginInfo;

public class PersonalInfoAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	LoginInfo loginInfo = new LoginInfo();
	public LoginInfo getLoginInfo(){
		return loginInfo;
	}
	public void setLoginInfo(LoginInfo loginInfo){
		this.loginInfo = loginInfo;
	}
	
	

	public String personalInfo(){
		if (loginInfo.getId()==null) {
			
		}else {
//			request.setAttribute("loginId", loginInfo.getId());
		}
		
		return SUCCESS;
	}
	
	
}
