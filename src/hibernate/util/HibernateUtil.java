package hibernate.util;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import hibernate.AdminInfo;
import hibernate.DormScore;
import hibernate.DormScoreId;
import hibernate.LoginInfo;
import hibernate.Notice;
import hibernate.StuInfo;
import hibernate.StuScore;

import java.util.List;

public class HibernateUtil {
	
	static private Session session;
	static GetHibernate hibernate = new GetHibernate();
	
	//=======================================
	//登录所使用
	public static List findUser(String strUserName,String strPwd){
		Transaction transaction = null;
		List list = null;
		
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			Query query = session.createQuery("from LoginInfo as u where u.loginId=:strUserName and u.loginPwd=:strPwd");
			query.setString("strUserName", strUserName);//动态绑定参数
			query.setString("strPwd", strPwd);
			query.list();
			
			list = query.list();//list()方法执行SQL语句
			transaction.commit();//提交事务
			hibernate.closeSession(session);	//关闭session
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();//回滚事务
		}
		return list;
	}
	
	//=============================================
	//个人信息
	//=============================================
	//得到个人信息
	public static List personalInfo_get(String token,String isAdmin){
		Transaction transaction = null;
		List list = null;
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			Query query = null;
			if (isAdmin.equals("1")) {
				query = session.createQuery("from AdminInfo as s where s.adminId=:token");
				query.setString("token", token);
			}else{
				query = session.createQuery("from StuInfo as s where s.stuNum=:token");
				query.setString("token", token);
			}

			list = query.list();
			transaction.commit();
			hibernate.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		return list;
	}
	
	//修改管理员个人信息
	public static void personalInfo_update(AdminInfo adminInfo){
		Transaction transaction = null;
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			session.update(adminInfo);
			transaction.commit();
			hibernate.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}

	
	//=====================================
	//学生管理
	//=====================================
	public static List findStudentInfo(int intFrint,int intpages){
		Transaction transaction = null;
		List list = null;
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			Query query = session.createQuery("from StuInfo");
			query.setFirstResult(intFrint);
			query.setMaxResults(intpages);
			list = query.list();//list()方法执行SQL语句
			transaction.commit();//提交事务
			hibernate.closeSession(session);	//关闭session
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();//回滚事务
		}
		return list;
	}

	//得到学生的总记录数量
	public static int findStudentCount(){
		Transaction transaction = null;
		int count = 0;
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			count = Integer.valueOf(session.createQuery("select count(*) from StuInfo").uniqueResult().toString()).intValue();
			transaction.commit();//提交事务
			hibernate.closeSession(session);	//关闭session
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();//回滚事务
		}
		return count;
	}
	
	//学生管理->新生录入
	public static void addStudent(StuInfo stuInfo){
		Transaction transaction = null;
		try{
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			session.save(stuInfo);
			transaction.commit();
			hibernate.closeSession(session);
		}catch(Exception exception){
			exception.printStackTrace();
			transaction.rollback();
		}
	}
		
	//删除学生
	public static void deleteStudent(StuInfo stuInfo) {
		Transaction transaction = null;
		try{
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			session.delete(stuInfo);
			transaction.commit();
			hibernate.closeSession(session);
		}catch(Exception exception){
			exception.printStackTrace();
			transaction.rollback();
		}
	}
	
	//得到学生的信息
	public static List getStudentId(String stuNum){
		Transaction transaction = null;
		List list = null;
		try{
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			Query query = session.createQuery("from StuInfo as s where s.stuNum=:stuNum");
			query.setString("stuNum", stuNum);
			list = query.list();
			transaction.commit();
			hibernate.closeSession(session);
		}catch(Exception e){
			e.printStackTrace();
			transaction.rollback();
		}
		return list;
	}
	
	//修改学生的信息
	public static void studentManage_modifyStudentInfo(StuInfo stuInfo){
		Transaction transaction = null;
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			session.update(stuInfo);
			transaction.commit();
			hibernate.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}
	
	//============================================
	//违纪管理
	//============================================
	//添加寝室违纪
	public static void disManage_addDorm(DormScore dormScore){
		Transaction transaction = null;
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			session.save(dormScore);
			transaction.commit();
			hibernate.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}
	//添加学生违纪
	public static void disManage_addStudent(StuScore stuScore){
		Transaction transaction = null;
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			session.save(stuScore);
			transaction.commit();
			hibernate.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}
	
	//学生违纪
	public static List disManage_findStudentScoreInfo(int intFrint,int intpages){
		Transaction transaction = null;
		List list = null;
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			Query query = session.createQuery("from StuScore");
			query.setFirstResult(intFrint);
			query.setMaxResults(intpages);
			list = query.list();//list()方法执行SQL语句
			transaction.commit();//提交事务
			hibernate.closeSession(session);	//关闭session
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();//回滚事务
		}
		return list;
	}
	
	public static int disManage_findStudentScoreCount(){
		Transaction transaction = null;
		int count = 0;
		try {
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			count = Integer.valueOf(session.createQuery("select count(*) from StuScore").uniqueResult().toString()).intValue();
			transaction.commit();//提交事务
			hibernate.closeSession(session);	//关闭session
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();//回滚事务
		}
		return count;
	}
	//删除学生违纪
	public static void disManage_deleteStudent(StuScore stuScore) {
		Transaction transaction = null;
		try{
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			session.delete(stuScore);
			transaction.commit();
			hibernate.closeSession(session);
		}catch(Exception exception){
			exception.printStackTrace();
			transaction.rollback();
		}
	}
	//根据学号得到
	public static List disManage_getStudentId(String stuNum){
		Transaction transaction = null;
		List list = null;
		try{
			session = hibernate.openSession();
			transaction = (Transaction)session.beginTransaction();
			Query query = session.createQuery("from StuScore as s where s.stuNum=:stuNum");
			query.setString("stuNum", stuNum);
			list = query.list();
			transaction.commit();
			hibernate.closeSession(session);
		}catch(Exception e){
			e.printStackTrace();
			transaction.rollback();
		}
		return list;
	}
	
	//寝室违纪
		public static List disManage_findDormScoreInfo(int intFrint,int intpages){
			Transaction transaction = null;
			List list = null;
			try {
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				Query query = session.createQuery("from DormScore");
				query.setFirstResult(intFrint);
				query.setMaxResults(intpages);
				list = query.list();//list()方法执行SQL语句
				transaction.commit();//提交事务
				hibernate.closeSession(session);	//关闭session
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();//回滚事务
			}
			return list;
		}
		
		public static int disManage_findDormScoreCount(){
			Transaction transaction = null;
			int count = 0;
			try {
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				count = Integer.valueOf(session.createQuery("select count(*) from DormScore").uniqueResult().toString()).intValue();
				transaction.commit();//提交事务
				hibernate.closeSession(session);	//关闭session
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();//回滚事务
			}
			return count;
		}
		//删除寝室违纪
		public static void disManage_deleteDorm(DormScore dormScore) {
			Transaction transaction = null;
			try{
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				session.delete(dormScore);
				transaction.commit();
				hibernate.closeSession(session);
			}catch(Exception exception){
				exception.printStackTrace();
				transaction.rollback();
			}
		}
		//根据寝室楼号和寝室号删除
		public static List disManage_getDormId(DormScoreId dormScoreId){
			Transaction transaction = null;
			List list = null;
			try{
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				Query query = session.createQuery("from DormScore as s where s.id=:dormId");
				query.setParameter("dormId", dormScoreId);
				list = query.list();
				transaction.commit();
				hibernate.closeSession(session);
			}catch(Exception e){
				e.printStackTrace();
				transaction.rollback();
			}
			return list;
		}
	
	
		
		//=====================================
		//公告管理
		//====================================
		//发布公告
		public static void noticeManage_addNotice(Notice notice){
			Transaction transaction = null;
			try{
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				session.save(notice);
				transaction.commit();
				hibernate.closeSession(session);
			}catch(Exception exception){
				exception.printStackTrace();
				transaction.rollback();
			}
		}
		public static List noticeManage_findNoticeInfo(int intFrint,int intpages){
			Transaction transaction = null;
			List list = null;
			try {
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				Query query = session.createQuery("from Notice");
				query.setFirstResult(intFrint);
				query.setMaxResults(intpages);
				list = query.list();//list()方法执行SQL语句
				transaction.commit();//提交事务
				hibernate.closeSession(session);	//关闭session
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();//回滚事务
			}
			return list;
		}
		
		public static int noticeManage_findNoticeCount(){
			Transaction transaction = null;
			int count = 0;
			try {
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				count = Integer.valueOf(session.createQuery("select count(*) from Notice").uniqueResult().toString()).intValue();
				transaction.commit();//提交事务
				hibernate.closeSession(session);	//关闭session
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();//回滚事务
			}
			return count;
		}

		public static void noticeManage_deleteNotice(Notice notice) {
			Transaction transaction = null;
			try{
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				session.delete(notice);
				transaction.commit();
				hibernate.closeSession(session);
			}catch(Exception exception){
				exception.printStackTrace();
				transaction.rollback();
			}
		}
		
		//============================
		//维修管理
		public static List repair_findRepairInfo(int intFrint,int intpages){
			Transaction transaction = null;
			List list = null;
			try {
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				Query query = session.createQuery("from Repair");
				query.setFirstResult(intFrint);
				query.setMaxResults(intpages);
				list = query.list();//list()方法执行SQL语句
				transaction.commit();//提交事务
				hibernate.closeSession(session);	//关闭session
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();//回滚事务
			}
			return list;
		}
		
		public static int repair_findRepairCount(){
			Transaction transaction = null;
			int count = 0;
			try {
				session = hibernate.openSession();
				transaction = (Transaction)session.beginTransaction();
				count = Integer.valueOf(session.createQuery("select count(*) from Repair").uniqueResult().toString()).intValue();
				transaction.commit();//提交事务
				hibernate.closeSession(session);	//关闭session
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();//回滚事务
			}
			return count;
		}
}

