package struts.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.net.httpserver.Authenticator.Success;


import hibernate.StuScore;
import hibernate.util.HibernateUtil;

public class DisManageAddStudentAction extends ActionSupport{
	
	@Override
	public String execute() throws Exception {
		//request
		HttpServletRequest request = ServletActionContext.getRequest();

		StuScore stuScore = new StuScore();
		stuScore.setStuNum(request.getParameter("stuNum"));//学号
		stuScore.setScore((Integer.valueOf(request.getParameter("stuScore"))).intValue());//分数
		stuScore.setConditiion(request.getParameter("stuCondition"));//原因
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		System.err.println(request.getParameter("stuTime"));
		Date date = format.parse(request.getParameter("stuTime"));
		stuScore.setDate(String.valueOf(date.getTime()));//时间
			
		HibernateUtil.disManage_addStudent(stuScore);
		return SUCCESS;
	}
}
