package cn.edu.zhku.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Cart;
import cn.edu.zhku.model.Customer;
import cn.edu.zhku.model.Operator;
import cn.edu.zhku.model.Order;

public class CartService {
	
	UserDao userDao = new UserDao();
	
	/**
	 * 加入购物车
	 * @param cart
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean addToCart(Cart cart) throws ClassNotFoundException, SQLException{
		
		if (userDao.addToCart(cart)) {
			return true;
		}
		return false;
	}
	
	
	public List<Cart> readCart(int customerId) throws ClassNotFoundException, SQLException {
		List<Cart> carts = new ArrayList<Cart>();
		
		if(userDao.readCart(customerId,0) != null){
			carts = userDao.readCart(customerId,0);
			return carts;
		}
		
		return null;
	}
	
	public List<Cart> readGoodsInTransit(int customerId) throws ClassNotFoundException, SQLException {
		List<Cart> carts = new ArrayList<Cart>();
		
		if(userDao.readGoodsInTransit(customerId,0) != null){
			carts = userDao.readGoodsInTransit(customerId,0);
			return carts;
		}
		
		return null;
	}
	/**
	 * 读取单一已下单的购物车商品
	 * @param idofcart
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Cart readSingleCart(int idofcart) throws ClassNotFoundException, SQLException {
		Cart cart = new Cart();
		
		if(userDao.readSingleProduct(idofcart) != null){
			cart = userDao.readSingleProduct(idofcart);
			return cart;
		}
		
		return null;
	}
	
	public boolean CustomerDelCart(int customerId,int idOfCart, int requestCode) throws ClassNotFoundException, SQLException {
		if (userDao.deleteByCustomer(customerId,idOfCart, requestCode)) {
			return true;
		}
		
		
		return false;
		
	}
	
	public boolean CustomerAddOrder(int customerId,int cartId) throws ClassNotFoundException, SQLException{
		if (userDao.CustomerAddOrder(customerId,cartId)) {
			return true;
		}
		
		return false;
		
		
		
	}
	
	/**
	 * 把购物车中的信息同步增加到goodintransit表中，（因为下单后，cart表中的记录会删除
	 * ，所以需要这个goodintransit表赋值一份资料）
	 * 用于以后的下订单后的（包括支付等操作）订单信息查询
	 * @param customerid
	 * @param cartid
	 * @param idofgoods
	 * @param numofgoods
	 * @param totalmoney
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean CartAddToGoodsInTransit(int customerid,int cartid,int idofgoods,int numofgoods,double totalmoney) throws ClassNotFoundException, SQLException{
//	(Integer.parseInt(customerId),Integer.parseInt(idOfCart));
		if (userDao.CartAddToGoodsInTransit(customerid,cartid,idofgoods,numofgoods,totalmoney)) {
			return true;
		}
		
		return false;
		
		
		
	}
	public List<Order> queryOrder(int customerId,int idOfCart) throws ClassNotFoundException, SQLException{
		if (userDao.queryOrder(customerId,idOfCart) != null) {
			return userDao.queryOrder(customerId,idOfCart);
		}
		
		return null;
		
		
		
	}

	/**
	 * //会员删除订单
		//运营商删除订单(需要权限密码)
	 * @param orderId
	 * @param requestCode
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public boolean delOrder(int orderId,int requestCode) throws ClassNotFoundException, SQLException{
		
		//会员删除订单
		//运营商删除订单
		if (userDao.delOrder(orderId,requestCode)) {
			return true;
		} 
		return false;
		
	}
	public String readOrderStatus(int orderId) throws ClassNotFoundException, SQLException{
		if(userDao.readOrderStatus(orderId) != null){
			return userDao.readOrderStatus(orderId);
		}
		return null;
		
	}


	/**
	 * 修改customer表中的账户余额
	 * @param customerId
	 * @param totalMoney
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */


	public boolean editOrderStatus(int orderId,String status) throws ClassNotFoundException, SQLException {
		if(userDao.editOrderStatus(orderId,status)){
			
			return true;
		}
		return false;
	}


	public int readCartIdInOrderStatus(int orderId) throws ClassNotFoundException, SQLException {
		int cartId =  userDao.readCartIdInOrderStatus(orderId);
		if(cartId != -1){
			return cartId;
		}
		return -1;
	}


	public boolean editOperatorTurnOver(int operatorId, double totalMoney,int requestCode) throws ClassNotFoundException, SQLException {
		if (userDao.editOperatorTurnOver(operatorId,totalMoney,requestCode)) {
			return true;
		}
		
		return false;
	}


	public double readOrderMoney(int orderId) throws ClassNotFoundException, SQLException {
		
		return userDao.readOrderMoney(orderId);
	}


	/**
	 * 在订单中读取会员id，用于修改会员余额，（买东西和退货)
	 * @param orderId
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int readCustomerIdInOrder(int orderId) throws ClassNotFoundException, SQLException {
		int customerId = userDao.readCustomerIdInOrder(orderId);
		if(userDao.readCustomerIdInOrder(orderId) != -1){
			return customerId;
		}
		
		return -1;
	}


	public boolean editCustomerBalance(int customerId, double totalMoney, int requestCode) throws ClassNotFoundException, SQLException {
		
		int retInt =  userDao.editCustomerBalance(customerId, totalMoney,requestCode);
		if(retInt == 1){
			return true;
		}
		return false;
		
	}
	
	
	
}
