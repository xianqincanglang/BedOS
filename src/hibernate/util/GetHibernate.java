package hibernate.util;

import org.apache.commons.lang3.ObjectUtils.Null;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import hibernate.LoginInfo;
import hibernate.AdminInfo;
import hibernate.Notice;
import hibernate.Repair;
import hibernate.StuInfo;
import hibernate.StuScore;


public class GetHibernate {
	
	private static SessionFactory sessionFactory = null;
	
	static{
		try {
			
			Configuration configuration = new Configuration().configure();
			ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Session openSession(){
		Session session = sessionFactory.openSession();
		return session;
	}
	
	public void closeSession(Session session){
		if (session != null) {
			session.clear();
		}
	}
	
	
}
