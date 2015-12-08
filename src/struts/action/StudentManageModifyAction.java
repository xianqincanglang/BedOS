package struts.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import hibernate.StuInfo;
import hibernate.util.HibernateUtil;

public class StudentManageModifyAction extends ActionSupport{
	
	@Override
	public String execute() throws Exception {
	
		HttpServletRequest request = ServletActionContext.getRequest();
		StuInfo stuInfo = new StuInfo();
		stuInfo.setStuName(request.getParameter("stuName"));
		stuInfo.setStuAge((Integer.valueOf(request.getParameter("stuAge"))).intValue());
		stuInfo.setStuSex(request.getParameter("stuSex"));
		stuInfo.setStuFloorNum(request.getParameter("stuFloor"));
		stuInfo.setStuDormNum(request.getParameter("stuDorm"));
		stuInfo.setStuBedNum((Integer.valueOf(request.getParameter("stuBed"))).intValue());
		stuInfo.setStuTel(request.getParameter("stuTel"));
		stuInfo.setStuNum(request.getParameter("stuNum"));
		
		
		HibernateUtil.studentManage_modifyStudentInfo(stuInfo);
		return SUCCESS;
	}
}
