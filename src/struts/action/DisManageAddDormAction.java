package struts.action;



import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.utility.Execute;
import hibernate.DormScore;
import hibernate.DormScoreId;
import hibernate.StuScore;
import hibernate.util.HibernateUtil;

public class DisManageAddDormAction extends ActionSupport{
	@Override
	public String execute() throws Exception {
		//request
		HttpServletRequest request = ServletActionContext.getRequest();
	
		
		DormScore dormScore = new DormScore();
		DormScoreId dormScoreId = new DormScoreId();
		dormScoreId.setDormFloorNum(request.getParameter("dormFloor"));//楼号
		dormScoreId.setDormDormNum(request.getParameter("dormNum"));//寝室号
		dormScore.setId(dormScoreId);
		dormScore.setDormScore((Integer.valueOf(request.getParameter("dormScore"))).intValue());//分数
		dormScore.setDormScoreCondition(request.getParameter("dormCondition"));//原因
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		Date date = format.parse(request.getParameter("dormTime"));
		dormScore.setDormScoreTime(String.valueOf(date.getTime()));//时间

		HibernateUtil.disManage_addDorm(dormScore);
		return SUCCESS;
	}
}
