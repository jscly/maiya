package cn.edu.zhku.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import cn.edu.zhku.DB.DB;
import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Customer;

public class LoginService {

	public boolean isValidUser(String identity,String userid, String password) throws ClassNotFoundException, SQLException {
		UserDao userDao = new UserDao();
		boolean flag = userDao.isValidUser(identity,userid,password);
		
		if(flag){
			return true;
		}
		
		return false;
	}
}
