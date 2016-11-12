package cn.edu.zhku.service;

import java.sql.SQLException;
import java.util.List;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Goods;

public class VisitHomeService {

	UserDao userDao = new UserDao();
	public Goods visitGoods(int id) throws ClassNotFoundException, SQLException{
		if(userDao.QueryGoods(id) != null){
			return userDao.QueryGoods(id);
		}
		return null;
	}
	public List<Goods> visitSingle() throws ClassNotFoundException, SQLException{
		if(userDao.queryGoodsList() != null){
			return userDao.queryGoodsList();
		}
		return null;
	}
	
}
