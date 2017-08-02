package com.sample.CosmacBack.dao;

import java.util.List;

import com.sample.CosmacBack.model.Users;

public interface UsersDao {
	
	public boolean addUser(Users u);
	public boolean updateUser(Users u);
	public boolean deleteUserById(int userId) ;
	public Users getUserById(int userId);
	public Users getUserByUsername(String uname);
	public List<Users> displayUsers();
}