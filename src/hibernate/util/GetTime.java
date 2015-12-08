package hibernate.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetTime {
	
	//得到系统日期
	public static Date getDate(){
		Date date = new Date();
		java.sql.Date date2 = new java.sql.Date(date.getTime());
		return date;
	}
	
	//得到系统时间
	public static String getDateTime(){
		SimpleDateFormat format;
		Date date = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		date = calendar.getTime();
		format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateTime = format.format(date);
		return dateTime;
	}
}
