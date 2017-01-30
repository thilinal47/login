package com.login.service;

import com.login.model.User;

public interface UserService {
	
	User findByUsername(String username);
	
	public void saveUser(User user);
	
}