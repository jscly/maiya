package cn.edu.zhku.service;

import java.sql.SQLException;
import java.util.List;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Goods;

public class SearchService {
	
	UserDao userDao = new UserDao();
	
	public List<Goods> searchGoodsList(String sort) throws ClassNotFoundException, SQLException{
		
		List<Goods> goodsList = userDao.queryGoodsList(sort);
		if (goodsList != null) {
			return goodsList;
		}
		
		return null;
		
	}

}
