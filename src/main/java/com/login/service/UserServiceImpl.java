package com.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.login.dao.UserDao;
import com.login.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao dao;

	public User findByUsername(String username) {
		return dao.findByUsername(username);
	}
	
	public void saveUser(User user) {
		 dao.saveUser(user);
	}

	

}
