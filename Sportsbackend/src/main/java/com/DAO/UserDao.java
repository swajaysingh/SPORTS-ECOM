package com.DAO;

import com.model.User;

public interface UserDao {
	public void insertUser(User user);
	public User getUserByUserId(String userId);
	public boolean authenticateUser(String userMailId, String userPassword);
	/*public void addUser(User user);
	public List<User> retreiveuser();
	public User getUserByEmail(String email);*/
}
