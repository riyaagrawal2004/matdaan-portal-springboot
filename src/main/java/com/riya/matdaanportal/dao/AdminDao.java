package com.riya.matdaanportal.dao;

import com.riya.matdaanportal.pojo.Admin;
import com.riya.matdaanportal.pojo.User;

public interface AdminDao 
{
	 boolean checkUserCredential(Admin a);
		boolean addNewUser(Admin a);
}
