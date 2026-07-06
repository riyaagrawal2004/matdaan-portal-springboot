package com.riya.matdaanportal.dao;

import com.riya.matdaanportal.pojo.User;

public interface UserDao {
	
	 boolean checkUserCredential(User u);
	boolean addNewUser(User u);
	
	
}