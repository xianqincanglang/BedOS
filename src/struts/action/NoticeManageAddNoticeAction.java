package struts.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.utility.Execute;
import hibernate.DormScore;
import hibernate.DormScoreId;
import hibernate.Notice;
import hibernate.util.HibernateUtil;

public class NoticeManageAddNoticeAction extends ActionSupport{
	
	@Override
	public String execute() throws Exception {
		//request
		HttpServletRequest request = ServletActionContext.getRequest();
	
		Notice notice = new Notice();
		notice.setTitle(request.getParameter("noticeTitle"));
		notice.setContent(request.getParameter("noticeContent"));
		
		//开始时间
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		Date startDate = format.parse(request.getParameter("noticeStartTime"));
		notice.setStartDate(String.valueOf(startDate.getTime()));
		
		//结束时间
		Date endDate = format.parse(request.getParameter("noticeEndTime"));
		notice.setEndDate(String.valueOf(endDate.getTime()));

		//
		HibernateUtil.noticeManage_addNotice(notice);
		
		return SUCCESS;
	}
}
