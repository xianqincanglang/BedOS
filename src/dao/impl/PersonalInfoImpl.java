package dao.impl;

import dao.PersonalInfo;

public class PersonalInfoImpl implements PersonalInfo{

	
	
	@Override
	public void getPersonalInfo(String loginId) {
		
		String hql = "FRMO AdminInfo as p where p.loginId="+loginId;
		
		
		
	}


	
}
