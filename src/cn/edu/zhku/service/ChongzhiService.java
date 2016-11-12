package cn.edu.zhku.service;

import java.sql.SQLException;

import cn.edu.zhku.dao.UserDao;

public class ChongzhiService {
	UserDao userDao = new UserDao();
	public boolean isValidCustomer(int customerId,String userIdentity,String payPsw) throws ClassNotFoundException, SQLException{
		
		if(userDao.isValidCustomer( customerId, userIdentity, payPsw)){
			
			return true;
		}
		
		return false;
	}
	public boolean chongzhiBalance(int parseInt, double parseDouble) throws ClassNotFoundException, SQLException {
		if(userDao.chongzhiBalance(parseInt, parseDouble)){
			
			return true;
		}
		return false;
	}
}

	
