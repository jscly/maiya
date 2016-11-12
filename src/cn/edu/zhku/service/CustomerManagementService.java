package cn.edu.zhku.service;

import java.sql.SQLException;
import java.util.List;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Customer;

public class CustomerManagementService {
	UserDao userDao = new UserDao();

	public List<?> queryInfo(String identity,int id) throws ClassNotFoundException, SQLException{
		if(userDao.query(identity, id, 0) != null){
			
			return userDao.query(identity, id, 0);
		}
		
		return null;
		
	}

	public boolean editInfo(Customer customer) throws ClassNotFoundException, SQLException {
		
		if(userDao.editCustomerInfo(customer)){
			return true;
		}
		return false;
	}
}
