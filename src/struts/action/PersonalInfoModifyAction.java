package struts.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import hibernate.AdminInfo;
import hibernate.StuInfo;
import hibernate.util.HibernateUtil;

public class PersonalInfoModifyAction extends ActionSupport{
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		AdminInfo adminInfo = new AdminInfo();
		adminInfo.setAdminAge((Integer.valueOf(request.getParameter("adminAge")).intValue()));//管理员年龄
		System.out.println("性别是:");
		System.out.println(request.getParameter("adminSex"));
		System.out.println(request.getParameter("adminS"));
		if (request.getParameter("adminSex").equals("男")) {
			
			adminInfo.setAdminSex("1");
		}else{
			adminInfo.setAdminSex("0");
		}
		
		adminInfo.setAdminTel(request.getParameter("adminTel"));//电话号码
		adminInfo.setAdminFloorNum((Integer.valueOf(request.getParameter("adminFloorNum")).intValue()));//楼号
		adminInfo.setAdminId(request.getParameter("adminId"));	//账号
		HibernateUtil.personalInfo_update(adminInfo);
		return SUCCESS;
	}
}
