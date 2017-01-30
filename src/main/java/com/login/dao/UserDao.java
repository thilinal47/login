package com.login.dao;

import com.login.model.User;

public interface UserDao {
	
	User findByUsername(String sso);
	
	void saveUser(User user) ;
	
}

