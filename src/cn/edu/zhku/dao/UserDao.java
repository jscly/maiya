package cn.edu.zhku.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.ldap.Rdn;

import cn.edu.zhku.DB.*;
import cn.edu.zhku.model.*;

public class UserDao {

	// 增加
	/*
	public boolean add(User user, String identity) throws SQLException,
			IOException {
		Connection conn = null;

		String id = user.getId();
		String name = user.getName();
		String psw = user.getPsw();
		String sex = user.getSex();
		String age = user.getAge();
		String birthday = user.getBirthday();
		String note = user.getNote();
		// String pic = user.getAge();

		String sql = "";
		try {
			conn = DB.DBConn();

			if (identity.equals(new String("commonUser"))) {
				sql = "INSERT INTO user " + "VALUES(?,?,?,?,?,?,?)";
			} else if (identity.equals(new String("superUser"))) {
				sql = "INSERT INTO superuser " + "VALUES(?,?,?,?,?,?,?)";

			}
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, psw);
			stmt.setString(4, sex);
			stmt.setString(5, age);
			stmt.setString(6, birthday);
			stmt.setString(7, note);
			// stmt.setString(8, pic);
			stmt.executeUpdate();

			DB.close(conn);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
*/
	// 删除
	/**
	 * 根据姓名删除普通用户信息
	 * 
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public boolean delelte(String id, int requestCode) throws SQLException {
		Connection conn = null;

		String sql = "";
		try {
			conn = DB.DBConn();
			// 会员删除自己的账号
			if (requestCode == 0) {
				sql = "delete from customer where id = '" + id + "'";

			}
			// 卖家删除自己的账号
			else if (requestCode == 1) {
				sql = "delete from seller where id = '" + id + "'";
			}
			// 卖家不能删除会员的账号
			
			// 运营商删除会员信息
			else if (requestCode == 20) {
				sql = "delete from customer where id = '" + id + "'";
			}
			// 运营商删除卖家信息，整条记录
			else if (requestCode == 21) {
				sql = "delete from seller where id = '" + id + "'";
			}
			//运营商删除卖家的店铺信息
			else if (requestCode == 210) {
//				参考：UPDATE testmysql SET name = ?,sex = ?,birthday = ?"
//						+ ",note = ?,pic = ? where id = ?
				sql = "update seller set shopid = null where id = '" + id +"'";
			}
			// 运营商删除店铺信息
			else if (requestCode == 22) {
				sql = "delete from shop where id = '" + id + "'";
			}
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			DB.close(conn);
			return true;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 顾客删除信息（购物车、等）
	 * @param customerId
	 * @param requestCode
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException 
	 */
	public boolean deleteByCustomer(int customerId, int idOfCart,int requestCode) throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

		Statement stmt = conn.createStatement();
		String sql = "";
		//顾客删除购物车的记录（每次删除一条）
		if (requestCode == 0) {
			sql = "delete from cart where idofcustomer = '" + customerId + "' and idofcart = '" + idOfCart + "'";
		}
		//下订单后删除购物车的信息（根据订单号）
		else if (requestCode == 1 && customerId == 0) {
			sql = "delete from cart where idofcart = '" + idOfCart + "'";
		}
		
		if (stmt.executeUpdate(sql) == 1) {
			
			DB.close(conn);
			return true;
		}
		
		DB.close(conn);
		
		return false;
	}

	// 查询
	/**
	 * 会员、店铺、运营商以identity登录、查询信息(查询符合自己身份的个人信息)
	 * 如
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<?> query(String identity, int id, int requestCode)
			throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		// 用于顾客、店铺主、运营商登录验证过程中的数据库查询,及以后查看个人信息
		if (requestCode == 0) {
			if (identity.equals(new String("customer"))) {
				List<Customer> userList = new ArrayList<Customer>();
				sql = "SELECT * FROM " + identity +" where id = '" + id + "'";
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {

					int userid = rs.getInt(1);
					String name = rs.getString(2);
					String psw = rs.getString(3);
					String payPsw = rs.getString(4);
					String phone = rs.getString(5);
					double balance = rs.getDouble(6);
					String ordersId = rs.getString(7);
					String deliveryAddress = rs.getString(8);
					String isValidCustomer = rs.getString(9);

					Customer user = new Customer();
					user.setId(userid);
					user.setName(name);
					user.setPsw(psw);
					user.setPayPsw(payPsw);
					user.setPhone(phone);
					user.setBalance(balance);
					user.setOrdersId(ordersId);
					user.setDeliveryAddress(deliveryAddress);
					user.setIsValidCustomer(isValidCustomer);
					
					userList.add(user);
				}
				DB.close(conn);
				return userList;
				
			} 
			//注意：
			//财务报表id
			//第三方支付，初步计划用微信生产二维码支付
			else if (identity.equals(new String("seller"))) {
				List<Seller> userList = new ArrayList<Seller>();
				sql = "SELECT * FROM " + identity +" where id = '" + id + "'";
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {

					int userid = rs.getInt(1);
					String name = rs.getString(2);
					String psw = rs.getString(3);
					String isValidSeller = rs.getString(4);
					String shopId = rs.getString(5);

					Seller user = new Seller();
					user.setId(userid);
					user.setName(name);
					user.setIsValidSeller(isValidSeller);
					user.setShopId(shopId);
					
					userList.add(user);
				}
				DB.close(conn);
				return userList;
			}else if (identity.equals(new String("operator"))) {
				List<Operator> userList = new ArrayList<Operator>();
				
				sql = "SELECT * FROM " + identity + " where id = '" + id + "'";
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {

					int userid = rs.getInt(1);
					String name = rs.getString(2);
					String psw = rs.getString(3);
					String operatingAuthorityPsw = rs.getString(4);
					//财务报表id
					int financialStatementId = rs.getInt(5);
					//第三方支付，初步计划用微信生产二维码支付
					String thirdPartyPayment = rs.getNString(6);
					String sellers = rs.getString(7);
					String shops = rs.getString(8);
					String cumstomers = rs.getString(9);
					double turnover = rs.getDouble(10);

					Operator user = new Operator();
					
					user.setOperatorId(userid);
					user.setOperatorName(name);
					user.setOperatorPsw(psw);
					user.setOperatingAuthorityPsw(operatingAuthorityPsw);
					user.setFinancialStatementId(financialStatementId);
					user.setThirdPartyPayment(thirdPartyPayment);
					user.setSellers(sellers);
					user.setShops(shops);
					user.setCustomers(cumstomers);
					user.setTurnover(turnover);
					userList.add(user);
				}
				DB.close(conn);
				return userList;
			}
		}
		
		// 运营商同步店铺信息-->查询店铺（Shop）信息
		else if (requestCode == 11) {
			if (identity.equals(new String("operator"))) {
				sql = "SELECT id FROM shop";
				
				ResultSet rs = stmt.executeQuery(sql);

				List<String> idOfShopList = new ArrayList<String>();
				
				String idOfShop = null;
				int i = 0;
//				System.out.println("list大小："+idOfShopList.size());
				while (rs.next()) {

					idOfShop = rs.getString(1);
					System.out.println(idOfShop + idOfShopList.size()+ " ");
					idOfShopList.add(idOfShop);
					i++;
				}
				DB.close(conn);
				return idOfShopList;
			}
		}
		// 运营商同步会员信息-->查询会员信息
		else if (requestCode == 12) {
			if (identity.equals(new String("operator"))) {
				sql = "SELECT id FROM customer";
				
				ResultSet rs = stmt.executeQuery(sql);
				
				List<String> idOfShopList = new ArrayList<String>();
				
				String idsOfCustomer = null;
				while (rs.next()) {
					
					idsOfCustomer = rs.getString(1);
					idOfShopList.add(idsOfCustomer);
				}
				DB.close(conn);
				return idOfShopList;
			}
		}
		
		//运营商查看会员所有信息（支付密码、登录密码除外）
		else if (requestCode == 13) {
			if (identity.equals(new String("operator"))) {
				sql = "SELECT * FROM customer";
				
				ResultSet rs = stmt.executeQuery(sql);

				List<Customer> customerList = new ArrayList<Customer>();
				
				 int ID;//int(11) NN
				 String name;//varc(45) NN
//				 String psw;//varc(20) NN
//				 String payPsw;//varc(20) NN
				
				 String phone;//varc(11) NN
				 double balance;//double NN def :0.00
				
				 String ordersId;//varc(255) 以英文分号分隔
				 String deliveryAddress;//varc(255) 
				 String isValidCustomer;//varc(1) 默认：0（未认证）
				
				 Customer customer = null;
				 
				 while (rs.next()) {

					 customer = new Customer();
//					ID = rs.getInt(1);
					name = rs.getString(2);
					
					phone = rs.getString(5);
					balance = rs.getDouble(6);
					
					ordersId = rs.getString(7);//varc(255) 以英文分号分隔
					deliveryAddress = rs.getString(8);//varc(255) 
					isValidCustomer = rs.getString(9);
					
					customer.setId(rs.getInt(1));
					customer.setName(name);
					customer.setPhone(phone);
					customer.setBalance(balance);
					customer.setOrdersId(ordersId);
					customer.setDeliveryAddress(deliveryAddress);
					customer.setIsValidCustomer(isValidCustomer);
					
					customerList.add(customer);
				}
				DB.close(conn);
				return customerList;
			}
		}
		//一般顾客流量商品
//		else if(requestCode == 2){
//			List<Goods> goodsliList =  new ArrayList<Goods>();
//			
//			for (Goods goods : goodsliList) {
//				goods.QueryGood(0);
//			}
//			System.out.println("goods大小:"+goodsliList.size());
//			return goodsliList;
//		}
//		//店铺在查看店铺详情
//		else if (requestCode == 12) {
//			if (id == null || id == "") {
//				if (identity.equals(new String("seller"))) {
//					sql = "SELECT * FROM shop";
//				}
//			}
//		}
//		// 超级用户查看单一的普通用户信息，密码除外
//		else if (requestCode == 2) {
//			if (identity.equals(new String("superUser"))) {
//				sql = "SELECT * FROM user where id = '" + id + "'";
//			}
//		}
		

//		ResultSet rs = stmt.executeQuery(sql);
//
//		while (rs.next()) {
//
//			String userid = rs.getString(1);
//			String name = rs.getString(2);
//			String psw = rs.getString(3);
//			String phone = rs.getString(4);
//			String balance = rs.getString(5);
//			String orders = rs.getString(6);
//			String deliveryAddress = rs.getString(7);
//
//			User user = new User();
//			user.setId(userid);
//			user.setName(name);
//			user.setPsw(psw);
////			user.setSex(sex);
////			user.setAge(age);
////			user.setBirthday(birthday);
////			user.setNote(note);
//
//			user.setPhone(phone);
//			user.setBalance(balance);
//			user.setDeliveryAddress(deliveryAddress);
//			userList.add(user);
//		}
//		DB.close(conn);
		return null;
	}

	// 修改
	/**
	 * 普通用户修改信息
	 * 
	 * @param user
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	/*
	public boolean edit(User user, int requestCode) throws SQLException,
			IOException {
		Connection conn = null;

		String id = user.getId();
		String name = user.getName();
		String psw = user.getPsw();
		String sex = user.getSex();
		String age = user.getAge();
		String birthday = user.getBirthday();
		String note = user.getNote();

		// System.out.println(name+psw+age);
		try {
			conn = DB.DBConn();

			String sql = "";
			// 超级用户修改普通用户信息
			if (requestCode == 0 && psw == null) {
				sql = "UPDATE user SET name = ?,sex = ?,age = ?"
						+ ",birthday = ?,note = ? where id = ?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, sex);
				stmt.setString(3, age);
				stmt.setString(4, birthday);
				stmt.setString(5, note);
				stmt.setString(6, id);
				stmt.executeUpdate();
			}
			// 超级用户修改自己的信息
			else if (requestCode == 1) {
				sql = "UPDATE superuser SET name = ?,psw = ?,sex = ?,age = ?"
						+ ",birthday = ?,note = ? where id = ?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, psw);
				stmt.setString(3, sex);
				stmt.setString(4, age);
				stmt.setString(5, birthday);
				stmt.setString(6, note);
				stmt.setString(7, id);
				stmt.executeUpdate();
			}
			// 普通用户修改自己的信息
			else if (requestCode == 2) {
				sql = "UPDATE user SET name = ?,psw = ?,sex = ?,age = ?"
						+ ",birthday = ?,note = ? where id = ?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, psw);
				stmt.setString(3, sex);
				stmt.setString(4, age);
				stmt.setString(5, birthday);
				stmt.setString(6, note);
				stmt.setString(7, id);
				stmt.executeUpdate();
			}

			DB.close(conn);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
*/
	/**预留功能
	 * 
	 * 增加头像
	 * 
	 * @param i
	 * @param f
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	public boolean addPic(int id, String filePath, int identity)
			throws SQLException, IOException {
		Connection conn = null;

		String sql = "";
		try {
			conn = DB.DBConn();
			if (identity == 0) {
				sql = "INSERT INTO user(id,pic)" + "VALUES(?,?)";

			}
			PreparedStatement stmt = conn.prepareStatement(sql);

			File file = new File(filePath);

			FileInputStream fis = new FileInputStream(file);

			stmt.setString(1, "" + id);
			stmt.setBinaryStream(2, fis, (int) file.length());

			stmt.executeUpdate();

			DB.close(conn);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 验证运营商登录信息的有效性
	 * 
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	
	//统一用User(id、name、psw)
	public boolean isValidUser(String identity,String userid,String password) throws ClassNotFoundException,
			SQLException {
		boolean flag = false;
		Connection conn = DB.DBConn();

		String sql = "SELECT * FROM " + identity + " where id = '" + userid + "'";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		User user = new User();
		if (rs.next()) {

//			String id = rs.getString(1);
//			String name = rs.getString(2);
			String psw = rs.getString(3);
			// String sex = rs.getString(4);
			// String age = rs.getString(5);
			// String birthday = rs.getString(6);
			// String note = rs.getString(7);

			// User user = new User();
//			user.setId(id);
//			user.setName(name);
			user.setPsw(psw);
			// user.setSex(sex);
			// user.setAge(age);
			// user.setBirthday(birthday);
			// user.setNote(note);
			//		
			// userList.add(user);

		}
		DB.close(conn);
		if (user.getPsw().equals(password)) {
			
			flag = true;
		}
		else if(!user.getPsw().equals(password)){
			flag = false;
			
		}
		return flag;
	}
	
	/**
	 * 运营商根据shopid查看店铺信息
	 * @param shopId
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public ShopInfo QueryShopInfo(int shopId) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		ShopInfo shopInfo = new ShopInfo();
		
		sql = "SELECT * FROM shop where id = '" + shopId + "'";
		ResultSet rs = stmt.executeQuery(sql);

		
		if (rs.next()) {

			int shopID = rs.getInt(1);
			String shopName = rs.getString(2);
			//卖家id
			int sellerId = rs.getInt(3);
			//是否有效认证店铺
			String isValidShop = rs.getString(4); 
			
			double shopTurnOver = rs.getDouble(5);
			//商品ids
			String shopGoodsId = rs.getString(6);
			//订单s
			String shopOrdersId = rs.getString(7);

			shopInfo.setShopId(shopID);
			shopInfo.setShopName(shopName);
			shopInfo.setSellerId(sellerId);
			shopInfo.setIsValidShop(isValidShop);
			shopInfo.setShopTurnOver(shopTurnOver);
			shopInfo.setShopGoodsId(shopGoodsId);
			shopInfo.setShopOrdersId(shopOrdersId);
				
		}
		DB.close(conn);
		return shopInfo;
		
	}
	
	
	public int getSellerIdByOperator(int shopCurrentId) throws SQLException, ClassNotFoundException {
		String sql = null;
		
		Connection conn = DB.DBConn();
		
		sql = "SELECT id FROM seller where shopid = '" + shopCurrentId + "'";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {

			int userid = rs.getInt(1);
//			System.out.println("在seller表中，getSellerIdByOperator（），得到卖家的id");
			return userid;
		}
		DB.close(conn);
		
		return -1;
		
	}
	
	
	/**
	 * 1、requstCode = 1,代表运营商认证店铺，需要查询店铺的isvalidshop的状态（目前只能得到id和待认证状态）；
	 * 2、运营商在认证店铺操作中，查看未认证的店铺
	 * @param requstCode
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
//		requstCode = 1,代表运营商认证店铺，需要查询店铺的isvalidshop的状态
	public List<?> QueryShopAllInfos(int requstCode) throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
//		requstCode = 1,代表运营商认证店铺，需要查询店铺的isvalidshop的状态
		if (requstCode == 1) {
			List<ShopInfo> isValidShopList = new ArrayList<ShopInfo>();
			
			sql = "SELECT * FROM shop";
			ResultSet rs = stmt.executeQuery(sql);
			ShopInfo shopInfo;
			while (rs.next()) {
				shopInfo = new ShopInfo();
				shopInfo.setShopId(rs.getInt(1));
//				shopInfo.setShopName(rs.getString(2));;
//				shopInfo.setSellerId(rs.getInt(3));
				shopInfo.setIsValidShop(rs.getString(4));
//				shopInfo.setIsValidShop(rs.getString(4));
				isValidShopList.add(shopInfo);
			}
			DB.close(conn);
			return isValidShopList;
		}
		//运营商在认证店铺操作中，查看未认证的店铺
		else if (requstCode == 2) {
//			System.out.println("运营商不是待认证店铺！");
			
		List<ShopInfo> inValidShopList = new ArrayList<ShopInfo>();
		
		sql = "SELECT * FROM shop";
		ResultSet rs = stmt.executeQuery(sql);
		ShopInfo shopInfo;
		while (rs.next()) {
			shopInfo = new ShopInfo();
			if (rs.getString(4).equals(new String("0"))) {
				shopInfo.setShopId(rs.getInt(1));
				shopInfo.setIsValidShop(rs.getString(4));
				
				inValidShopList.add(shopInfo);
			}
		}
		DB.close(conn);
		return inValidShopList;
		}
		
		return null;
	}
	
	/**
	 * 运营商更改运营商表所拥有的的店铺id,或更改店铺表中的isvalidshop（店铺认证状态）
	 * @param shopsIdString
	 * @param shopCurrentID
	 * @param operatorId
	 * @param requestCode
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 * @throws ClassNotFoundException 
	 */
//	运营商更改运营商表的所拥有的店铺id,或更改店铺表中的isvalidshop（店铺认证状态）
	public boolean updateShopsIdByOperator(String shopsIdString , String shopCurrentID,int operatorId,int requestCode) throws SQLException, IOException, ClassNotFoundException {
		
//		System.out.println("在updateShopsIdByOperator，得到的从Operator表中查到的shopids字符串为：" + shopsIdString + "当前店铺id"+shopCurrentID +"运营商id" + operatorId);
		
	//运营商更改运营商表的所拥有的店铺id
	//在删除店铺信息的过程中，需要同步更新Operator表中的shopsId（字符串）信息，即删除这个店铺id
		if (requestCode == 1) {
	

		
		//获得Operator表中，制定运营商账号里面的所拥有的所有店铺的id数组-》分离
				String [] shopsArr = shopsIdString.split(";");
//				System.out.println("shopids数组长度为 =" + shopsArr.length + "最后一个元素 = " + shopsArr[shopsArr.length - 1]);
		    	int [] shopsIdArr = new int[shopsArr.length];
		    	
//		    	System.out.print("已显示的店铺id:");
//		    	for(int i = 0;i < shopsIdArr.length;i++){
//		    		shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
//		    		System.out.print(shopsIdArr[i] + "  A");
//		    	}
		    	
//		    	//获取数据库中，operator表中，operatorId对应的店铺id数组（全部店铺）
//		    	List <?> usersInfo = query("operator", operatoeId, 0);
//		    	
//		    	String shopIds = "";
//		    	
//		    	for (Object object : usersInfo) {
//		    		shopIds = ((Operator)object).getShops();
//				}
		    	//数据库中，具体获取到的所有店铺id
		    	
//		    	System.out.println("\nz在updateShopsIdByOperatorzhing,\n字符串数组转化成int数组：");
		    	for(int i = 0;i < shopsIdArr.length;i++){
		    		shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
		    		System.out.print(shopsIdArr[i] + " ");
		    	}
		    	
		    	//得出除去删除的特定店铺id（子字符串）后剩下的字符串
		    	List<Integer> intArrayList = new ArrayList<Integer>();
		    	for (int i = 0; i < shopsIdArr.length; i++) {
					intArrayList.add(shopsIdArr[i]);
				}
		    	
		    	for (int i = 0; i < intArrayList.size(); i++) {
		    		if(intArrayList.contains(new Integer(shopCurrentID))) {
		    			intArrayList.remove(new Integer(shopCurrentID));
					}
		    		
				}
		    	
//		    	System.out.println("移除后：");
		    	for (Integer integer : intArrayList) {
					System.out.print(integer + " ");
				}
		    	
		    	String result = "";
		    	for (int i = 0; i < intArrayList.size(); i++) {
					result += intArrayList.get(i) +";";
				}
		    	
//		    	System.out.println(result);
		    	
		    	Operator operator = new Operator();
		    	
		    	operator.setOperatorId(operatorId);
		    	operator.setShops(result);
		    	
		    	if(edit(operator,1)){
		    		return true;
		    	}
		}
		
		//运营商更改店铺的认证状态
//		参数：if (userDao.updateShopsIdByOperator(null, String.valueOf(isValidShop.getSellerId()), 0, 2)) {
//			
		else if (requestCode == 2) {
			
			Connection conn = null;

			conn = DB.DBConn();

			//参考:"UPDATE operator SET shops = ? where id = ?";
			String sql = "UPDATE shop SET isvalidshop = ? where id = ?";

			
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "1");
			stmt.setString(2, shopCurrentID);
			if (stmt.executeUpdate() == 1) {
				DB.close(conn);
				System.out.println("shopCurrentID = "+shopCurrentID + "修改成功！");
				return true;
			}
			else {
				return false;
			}
			
			
		}
		return false;
				
	}
	
	
	/**
	 * 根据Operator对象edit运营商信息(店铺id信息)
	 * @param operator
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	public boolean edit(Operator operator , int requestCode) throws SQLException, IOException {
		Connection conn = null;

		//运营商同步店铺id
		if (requestCode == 1) {
			
		
		String id = String.valueOf(operator.getOperatorId());
		String shopsid = operator.getShops();
//		String name = user.getName();
//		String sex = user.getSex();
//		String birthday = user.getBirthday();
//		String note = user.getNote();

		try {
			conn = DB.DBConn();

			String sql = "UPDATE operator SET shops = ? where id = ?";

//			File file_edit = new File(jtf_open.getText());
//			FileInputStream fis_edit = new FileInputStream(file_edit);

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, shopsid);
			stmt.setString(2, id);
//			stmt.setString(3, birthday);
//			stmt.setString(4, note);
//			stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
//			stmt.setString(6, id);
			if (stmt.executeUpdate() == 1) {
				DB.close(conn);
				return true;
			}
			return false;
			
//			fis_edit.close();
			
//			参考sql = "update seller set shopid = '' where id = '" + id +"'";

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
			
		
		}
		//运营商修改自己的信息
		else if (requestCode == 2) {
			String id = ""+operator.getOperatorId();
			String name = operator.getOperatorName();
			String psw = operator.getOperatorPsw();
			String authoritypsw = operator.getOperatingAuthorityPsw();
			String thirdpartpay = operator.getThirdPartyPayment();
			String financialstatementid = ""+operator.getFinancialStatementId();
			String sellersid = operator.getSellers();
			String shopsid = operator.getShops();
			String customerid = operator.getCustomers();
			
//			String id = String.valueOf(operator.getOperatorId());
//			String shopsid = operator.getShops();
			
			try {
				conn = DB.DBConn();

				String sql = "UPDATE operator SET name = ? , psw = ? , operatingauthoritypsw = ?"
						+ " , financialstatementid = ? , thirdpartypayment = ? , sellers = ? , "
						+ "shops = ? , customers = ? where id = ?";

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, psw);
				stmt.setString(3, authoritypsw);
				stmt.setString(4, financialstatementid);
				stmt.setString(5, thirdpartpay);
				stmt.setString(6, sellersid);
				stmt.setString(7, shopsid);
				stmt.setString(8, customerid);
				stmt.setString(9, id);
//				stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
//				stmt.setString(6, id);
				if (stmt.executeUpdate() == 1) {
					DB.close(conn);
					return true;
				}
				return false;
				
//				fis_edit.close();
//				参考sql = "update seller set shopid = '' where id = '" + id +"'";

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} 
			
		}
		//卖家已付款
		
		return false;
	}

	/**
	 * yys查询所有为认证的店铺---显示未认证店铺（id、认证状态)的界面
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<ShopInfo> QueryAllInvalidShops() throws ClassNotFoundException, SQLException {
		
		List<?> allInvalidShops = QueryShopAllInfos(2);
		
		if (allInvalidShops != null) {
			return (List<ShopInfo>)allInvalidShops;
		}
		return null;
	}

	//登录首页查询商品
	public Goods QueryGoods(int id) throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

//		List<Goods> = new 
		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM goods where id = '" + id + "'";
		ResultSet rs = stmt.executeQuery(sql);

		//用于被查询全部商品的方法调用
		if (id ==0 ) {
			Goods good = new Goods();
			while (rs.next()) {

				int ID = rs.getInt(1);
				String name = rs.getString(2);
//				System.out.println("1 = " + name);
				//类型
				String sort = rs.getString(3);
				
				//总量
				int totalvolume = rs.getInt(4);
				//销售量
				int salesvolume = rs.getInt(5);
				//剩余
				int left = rs.getInt(6);
				
				double price = rs.getDouble(7);
				
				String introduce = rs.getString(8);
				String color = rs.getString(9);
				String style = rs.getString(10);
				String specification = rs.getString(11);
				String evaluation = rs.getString(12);
				String picturepath = rs.getString(13);
				
				good.setId(ID);
				good.setName(name);
				good.setSort(sort);
				good.setTotalvolume(totalvolume);
				good.setSalesvolume(salesvolume);
				good.setKucun(left);
				good.setPrice(price);
				good.setIntroduce(introduce);
				good.setColor(color);
				good.setStyle(style);
				good.setSpecification(specification);
				good.setEvaluation(evaluation);
				good.setPicturepath(picturepath);
					
				
			}
			DB.close(conn);
			return good;
		}
		//查询特定id的商品
		else {
			
		
		Goods good = new Goods();
		while (rs.next()) {

			int ID = rs.getInt(1);
			String name = rs.getString(2);
//			System.out.println("1 = " + name);
			//类型
			String sort = rs.getString(3);
			
			//总量
			int totalvolume = rs.getInt(4);
			//销售量
			int salesvolume = rs.getInt(5);
			//剩余
			int left = rs.getInt(6);
			
			double price = rs.getDouble(7);
			
			String introduce = rs.getString(8);
			String color = rs.getString(9);
			String style = rs.getString(10);
			String specification = rs.getString(11);
			String evaluation = rs.getString(12);
			String picturepath = rs.getString(13);
			
			good.setId(ID);
			good.setName(name);
			good.setSort(sort);
			good.setTotalvolume(totalvolume);
			good.setSalesvolume(salesvolume);
			good.setKucun(left);
			good.setPrice(price);
			good.setIntroduce(introduce);
			good.setColor(color);
			good.setStyle(style);
			good.setSpecification(specification);
			good.setEvaluation(evaluation);
			good.setPicturepath(picturepath);
				
			
		}
		DB.close(conn);
		return good;
		}
	}
	
	
//	public static void main(String[] args) throws ClassNotFoundException, SQLException {
//		UserDao userDao = new UserDao();
//		
//		Goods goods = userDao.QueryGoods(401);
//		System.out.println("picpath = " + goods.getPicturepath());
//	}
	
	/**
	 * 根据类别查询商品
	 * @param sort
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<Goods> queryGoodsList(String sort) throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

//		List<Goods> = new 
		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM goods where class = '" + sort + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Goods> goodsList = new ArrayList<Goods>();
		
		Goods good = null;
		while (rs.next()) {

			good = new Goods();
			int ID = rs.getInt(1);
			String name = rs.getString(2);
//			System.out.println("1 = " + name);
			//类型
			String Sort = rs.getString(3);
			
			//总量
			int totalvolume = rs.getInt(4);
			//销售量
			int salesvolume = rs.getInt(5);
			//剩余
			int left = rs.getInt(6);
			
			double price = rs.getDouble(7);
			
			String introduce = rs.getString(8);
			String color = rs.getString(9);
			String style = rs.getString(10);
			String specification = rs.getString(11);
			String evaluation = rs.getString(12);
			String picturepath = rs.getString(13);
			
			good.setId(ID);
			good.setName(name);
			good.setSort(Sort);
			good.setTotalvolume(totalvolume);
			good.setSalesvolume(salesvolume);
			good.setKucun(left);
			good.setPrice(price);
			good.setIntroduce(introduce);
			good.setColor(color);
			good.setStyle(style);
			good.setSpecification(specification);
			good.setEvaluation(evaluation);
			good.setPicturepath(picturepath);
				
			goodsList.add(good);
			
		}
		DB.close(conn);
		return goodsList;
	}
	
	public List<Goods> queryGoodsList() throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

//		List<Goods> = new 
		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM goods";
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Goods> goodsList = new ArrayList<Goods>();
		
		Goods good = null;
		while (rs.next()) {

			good = new Goods();
			int ID = rs.getInt(1);
			String name = rs.getString(2);
//			System.out.println("1 = " + name);
			//类型
			String sort = rs.getString(3);
			
			//总量
			int totalvolume = rs.getInt(4);
			//销售量
			int salesvolume = rs.getInt(5);
			//剩余
			int left = rs.getInt(6);
			
			double price = rs.getDouble(7);
			
			String introduce = rs.getString(8);
			String color = rs.getString(9);
			String style = rs.getString(10);
			String specification = rs.getString(11);
			String evaluation = rs.getString(12);
			String picturepath = rs.getString(13);
			
			good.setId(ID);
			good.setName(name);
			good.setSort(sort);
			good.setTotalvolume(totalvolume);
			good.setSalesvolume(salesvolume);
			good.setKucun(left);
			good.setPrice(price);
			good.setIntroduce(introduce);
			good.setColor(color);
			good.setStyle(style);
			good.setSpecification(specification);
			good.setEvaluation(evaluation);
			good.setPicturepath(picturepath);
				
			goodsList.add(good);
			
		}
		DB.close(conn);
		return goodsList;
	}

	public boolean addToCart(Cart cart) throws ClassNotFoundException, SQLException {
		
//		private int idOfCart;//int(11) pk NN
//		private int idOfCustomer;//int(11) NN
//		private int idOfGoods;//int(11) NN
//		private int numOfGoods;//int(11) NN
//		private double totalMoney;
		
		
//		int idOfCart = cart.getIdOfCart();
		int idOfCustomer = cart.getIdOfCustomer();
		int idOfGoods = cart.getIdOfGoods();
		int numOfGoods = cart.getNumOfGoods();
		double totalMoney = cart.getTotalMoney();
		
		Connection conn = DB.DBConn();
		
		//int 得出订单号中的最大值，加1则为当前加入订单的订单号
//		int maxIdOfCart = maxIdOfCart();
		
//		System.out.println("maxIdOfCart11 = " + maxIdOfCart);
		
		try {
			conn = DB.DBConn();
//			File pic_file = new File(pic);
//			FileInputStream pic_fis = new FileInputStream(pic_file);

			String sql = "INSERT INTO cart "
					+ "VALUES(?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
//			stmt.setString(1, id);
			
			stmt.setInt(1, readMaxIdOfCartFromCart() + 1);
//			System.out.println("readmaxidofcartformgoodsintransit() + 1 = " + (readmaxidofcartformgoodsintransit()));
			stmt.setInt(2, idOfCustomer);
			stmt.setInt(3, idOfGoods);
			stmt.setInt(4, numOfGoods);
			stmt.setDouble(5, totalMoney);
//			stmt.setBinaryStream(5, pic_fis, (int) pic_file.length());
			
			if(stmt.executeUpdate() == 1){
				DB.close(conn);
				return true;
			}else {
				return false;
			}
				
//			pic_fis.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		return false;
	}

	
	public int readMaxIdOfCartFromCart() throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		String sql = null;
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM cart";
		ResultSet rs = stmt.executeQuery(sql);
		
		int maxid = 0;
		
		List<Integer> idsIntegers = new ArrayList<Integer>();
		while (rs.next()) {
			
			idsIntegers.add(rs.getInt(1));
		}
		
		if(idsIntegers != null){
			System.out.println("cg?" + idsIntegers.size());
			if (idsIntegers.size() == 1) {
				return idsIntegers.get(0).intValue();
			}
			for (int i = 1;i < idsIntegers.size();i++) {
				if (idsIntegers.get(i) > idsIntegers.get(i-1)) {
					maxid = idsIntegers.get(i);
				}
			}
			System.out.println("cart里面最大的id = " + maxid);
			
		}
		return maxid;
		
	}

	/**
	 * 查看购物车（int idOfCustomer,int idOfCart）
	 * @param idOfCustomer
	 * @param idOfCart
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Cart QueryCartInfoByCus(int idOfCustomer,int idOfCart) throws ClassNotFoundException, SQLException{
		Cart cart = new Cart();
		
		Connection conn = DB.DBConn();
		String sql = null;
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM cart where idofcustomer = '" + idOfCustomer + "' and idofcart = '"
				+ idOfCart + "'";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			
			cart.setIdOfCart(rs.getInt(1));
			cart.setIdOfCustomer(rs.getInt(2));
			cart.setIdOfGoods(rs.getInt(3));
			cart.setNumOfGoods(rs.getInt(4));
			cart.setTotalMoney(rs.getDouble(5));
		}
		if(cart != null){
			DB.close(conn);
			return cart;
		}else {
			return null;
		}
		
	}
	
	public int maxIdOfCart() throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		String sql = null;
		Statement stmt = conn.createStatement();
		
		
		sql = "SELECT idofcart FROM cart";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Integer> idsofcart = new ArrayList<Integer>();
		
//		for (Integer integer : idsofcart) {
//			if (!rs.next()){
//				break;
//			}
		
			while (rs.next()) {
				idsofcart.add(rs.getInt(1));
//				System.out.println("有订单号 ： " +idsofcart.get(i));
			}
			
//		System.out.println("list<Integer> size = " + idsofcart.size());
		//一张单就返回这一张单号
		if (idsofcart.size() == 0) {
			return 0;
		}
			
		else if (idsofcart.size() == 1) {
			return idsofcart.get(0).intValue();
		}
		
		//否则，调用maxInt(List<Integer>)得出集合中的最大值
		else if(maxInt(idsofcart) != 0){
			System.out.println("maxInt(idsofcart) = " + maxInt(idsofcart));
			return maxInt(idsofcart);
		}
		
		//默认返回0
//		if (idsofcart.size() == 0) {
//			System.out.println("list = null");
//		}
		return 0;
	}

	public int maxInt(List<Integer> idsoOfCart) {
		//最大值初始化为0
		int max = 0;
		
		
		
		if (idsoOfCart != null) {
			
			for (int i = 1; i < idsoOfCart.size(); i++) {
				if(idsoOfCart.get(i) > idsoOfCart.get(i - 1)){
					max = idsoOfCart.get(i).intValue();
					System.out.println("222222222order里面有数据" + idsoOfCart.get(i));
				}
			}
		}
		
		return max;
	}

	/**
	 * 读取指定会员id的全部购物车信息
	 * @param customerId
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<Cart> readGoodsInTransit(int customerId,int idofcart) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		if (idofcart == 0) {
			
			sql = "SELECT * FROM goodsintransit where idofcustomer = '" + customerId + "'";
		}
		else if (idofcart != 0) {
			
			sql = "SELECT * FROM goodsintransit where idofcustomer = '" + customerId + "' and idofcart = '" + idofcart + "'";
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Cart> carts = new ArrayList<Cart>();
		
		Cart cart = null;
		
		while (rs.next()) {

			cart = new Cart();
			
			int idOfCart = rs.getInt(1);
			int idOfCustomer = rs.getInt(2);
			int idOfGoods = rs.getInt(3);
			int numOfGoods = rs.getInt(4);
			double totalMoney = rs.getDouble(5);
			
			cart.setIdOfCart(idOfCart);
			cart.setIdOfCustomer(idOfCustomer);
			cart.setIdOfGoods(idOfGoods);
			cart.setNumOfGoods(numOfGoods);
			cart.setTotalMoney(totalMoney);
			
			carts.add(cart);
		}
		
		if (carts != null) {
			return carts;
		}
		
		return null;
	}
	
	
	/**
	 * 顾客查看购物车信息
	 * @param customerId
	 * @param idofcart
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<Cart> readCart(int customerId,int idofcart) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		
		String sql = null;
		
		Statement stmt = conn.createStatement();
		if (idofcart == 0) {
			
			sql = "SELECT * FROM cart where idofcustomer = '" + customerId + "'";
		}
		else if (idofcart != 0) {
			
			sql = "SELECT * FROM cart where idofcustomer = '" + customerId + "' and idofcart = '" + idofcart + "'";
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Cart> carts = new ArrayList<Cart>();
		
		Cart cart = null;
		
		while (rs.next()) {
			
			cart = new Cart();
			
			int idOfCart = rs.getInt(1);
			int idOfCustomer = rs.getInt(2);
			int idOfGoods = rs.getInt(3);
			int numOfGoods = rs.getInt(4);
			double totalMoney = rs.getDouble(5);
			
			cart.setIdOfCart(idOfCart);
			cart.setIdOfCustomer(idOfCustomer);
			cart.setIdOfGoods(idOfGoods);
			cart.setNumOfGoods(numOfGoods);
			cart.setTotalMoney(totalMoney);
			
			carts.add(cart);
		}
		
		if (carts != null) {
			return carts;
		}
		
		return null;
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		UserDao userDao = new UserDao();
		
//		if(userDao.deleteByCustomer(12, 0)){
//			System.out.println("成功");
//		}
		
//		List<Integer> intArr = new ArrayList<Integer>();
//		
//		intArr.add(1);
//		intArr.add(2);
		
		
//		int max = userDao.maxOrderId();
		
		
//		int max = userDao.maxIdOfCart();
//		
//		System.out.println("userDao.maxOrderId()中，max = " + max);
//		System.out.println("订单表中，idmax："+userDao.maxIdOfCart());
		
		
		
//		if(userDao.QueryCartInfoByCus(201, 101) != null){
//			
//			
//			System.out.println("详情：\n"+userDao.QueryCartInfoByCus(201, 101).getIdOfCart()+"  "+userDao.QueryCartInfoByCus(201, 101).getIdOfCustomer() + "  " +userDao.QueryCartInfoByCus(201, 101).getIdOfGoods() + "  " + userDao.QueryCartInfoByCus(201, 101).getNumOfGoods() + "  " + userDao.QueryCartInfoByCus(201, 101).getTotalMoney());
//		}
//		if(userDao.CustomerAddOrder(201, 101)){
//			
//			
//			System.out.println("添加购物车成功！");
//		}
		
		if (userDao.CartAddToGoodsInTransit(1, 2, 3, 4, 5)) {
			System.out.println("cg");
		}
		
		
	}

	
	/**
	 * 增加订单(int customerId, int idOfCart)
	 * @param customerId
	 * @param idOfCart
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public boolean CustomerAddOrder(int customerId, int idOfCart) throws SQLException, ClassNotFoundException {
		
		Cart cart = QueryCartInfoByCus(customerId, idOfCart);
		
		List<Customer> customers =  (List<Customer>)query("customer", customerId, 0);
//		System.out.println("select form custoer 成功");
		Customer customer = null;
		
		
		for (Customer cus : customers) {
			customer = cus;
		}
		
		Connection conn = DB.DBConn();
		
//		String sql = "UPDATE customerorder SET customername = ? where idoforder = ?";

//		File file_edit = new File(jtf_open.getText());
//		FileInputStream fis_edit = new FileInputStream(file_edit);

//		PreparedStatement stmt = conn.prepareStatement(sql);
//		stmt.setString(1, "11");
//		stmt.setString(2, "601");
//		stmt.setString(3, birthday);
//		stmt.setString(4, note);
//		stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
//		stmt.setString(6, id);
//		if (stmt.executeUpdate() == 1) {
//			DB.close(conn);
//			return true;
//		}else {
//			return false;
//		}
		
//			String sql = "update order set customername = 'qq' where idoforder = '601' ";
//			
//			Statement stmt = conn.createStatement();
//
//			if(stmt.executeUpdate(sql) == 1){
//				DB.close(conn);
//				return true;
//			}else {
//				return false;
//			}
			
			String sql = null;
			
			
			
			sql = "INSERT INTO customerorder "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			//idoforder
//			System.out.println(" maxOrderId() + 100 = " + ( maxOrderId() + 100));
			stmt.setInt(1, maxOrderId() + 1);
//			System.out.println("1");
			
			//
			stmt.setInt(2, customerId);
//			System.out.println("2");
			
			stmt.setString(3, customer.getName());
//			System.out.println("3");
			
			//收货地址
			stmt.setString(4, customer.getDeliveryAddress());
//			System.out.println("4");
			
			//手机号码
			stmt.setString(5, customer.getPhone());
//			System.out.println("5");
			
			//购物车id
			stmt.setInt(6, idOfCart);
//			System.out.println("6");
			
			//订单状态
			stmt.setString(7, "等待买家付款");
//			System.out.println("7");
			
			//快递方式
			stmt.setString(8, "申通");
//			System.out.println("8");
			
			//快递费
			stmt.setDouble(9,0);
//			System.out.println("9");
			
			//支付方式
			stmt.setString(10, "线上支付");
//			System.out.println("10");
			
			//快递员名字
			stmt.setString(11, "小二哥");
//			System.out.println("11");
			
			//快递员联系电话
			stmt.setString(12, "12312312311");
//			System.out.println("12");
			
			//发票类型和学习
			stmt.setString(13,"电子发票");
//			System.out.println("13");
			
			//总计
			stmt.setDouble(14, cart.getTotalMoney());
//			System.out.println("14");
			
//			stmt.setBinaryStream(5, pic_fis, (int) pic_file.length());
			
			
//			stmt.setInt(1, 889);
//			stmt.setString(2, "小时2");
//			stmt.setInt(3, 1234);
//			stmt.setString(4, "1");
//			stmt.setString(5, "111");
//			stmt.setString(6, "222");
//			stmt.setString(7, "333");
//			
			if(stmt.executeUpdate() == 1){
				DB.close(conn);
				return true;
			}else {
				return false;
			}
	
	}

	public int maxOrderId() throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();
		String sql = null;
		Statement stmt = conn.createStatement();
		
		int maxid = 0;
		
		sql = "SELECT * FROM customerorder";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Integer> idoforder = new ArrayList<Integer>();
		
//错误：		if (!rs.next()) {
//			return 0;
//		}
		while (rs.next()) {
			idoforder.add(rs.getInt(1));
		}
			
		if(idoforder != null){
			if (idoforder.size() == 1) {
				return idoforder.get(0).intValue();
			}
			for (int i = 1;i < idoforder.size();i++) {
				if (idoforder.get(i) > idoforder.get(i-1)) {
					maxid = idoforder.get(i);
				}
			}
			System.out.println("order里面最大的id = " + maxid);
			
		}
		return maxid;
//		System.out.println("list<Integer> size = " + idoforder.size());
		//一张单就返回这一张单号
//		if (idoforder.size() == 0) {
//			return 0;
//		}
//		else if (idoforder.size() == 1) {
//			return idoforder.get(0).intValue();
//		}
//		
//		//否则，调用maxInt(List<Integer>)得出集合中的最大值
//		else if(mant(idoforder) != 0){
//			System.out.println("订单表里面，最大订单号"+maxInt(idoforder));
//			return maxInt(idoforder);
//		}
//		return 0;
	}

	/**
	 * 顾客查询订单
	 * @param customerId
	 * @param idOfCart
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Order> queryOrder(int customerId ,int idOfCart) throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		List<Order> orderList = new ArrayList<Order>();
		//查询指定会员id的全部订单
		if (idOfCart == 0) {
			
			sql = "SELECT * FROM customerorder where customerid = '" + customerId +"'";
		}
		//查询指定会员id和购物车id的全部订单
		else if(idOfCart != 0){
			
			sql = "SELECT * FROM customerorder where customerid = '" + customerId +"' and idofcart = '" + idOfCart + "'";
		}
		//运营商查询全部订单
		else if(idOfCart == 0 && customerId == 0){
			
			sql = "SELECT * FROM customerorder";
		}
		System.out.println(idOfCart + "<- ->" + customerId);
		ResultSet rs = stmt.executeQuery(sql);

		Order order = null;
		while (rs.next()) {

			int idoforder = rs.getInt(1);
			int customerid = rs.getInt(2);
			String customername = rs.getString(3);
			String customeraddress = rs.getString(4);
			String customerphone = rs.getString(5);
			
			int idofcart = rs.getInt(6);
			String status = rs.getString(7);
			String expressmode = rs.getString(8);
//			System.out.println("快递方式 = " + expressmode);
			double expresscharge = rs.getDouble(9);
			String paymode = rs.getString(10);
			String expressworker = rs.getString(11);
			String expressworkerphone = rs.getString(12);
			String invoicestypeandinfo = rs.getString(13);
//			System.out.println("发票类型及信息 = " + invoicestypeandinfo);
			double totalmoney = rs.getDouble(14);

			
			order = new Order();
			
			order.setId(idoforder);
			order.setCustomerID(customerid);
			order.setCustomerName(customername);
			order.setCustomerAddress(customeraddress);
			order.setCustomerPhone(customerphone);
			order.setIdOfCart(idofcart);
			order.setStatus(status);
			order.setExpressMode(expressmode);
			order.setExpressCharge(expresscharge);
			order.setPayMode(paymode);
			order.setExpressWorker(expressworker);
			order.setExpressWorkerPhone(expressworkerphone);
			order.setInvoiceStypeAndInfo(invoicestypeandinfo);
			order.setTotalMoney(totalmoney);
			
			
			orderList.add(order);
		}
		DB.close(conn);
		if (orderList != null) {
			
			return orderList;
		}
		
		return null;
	}

	/**
	 * 读取单一购物车
	 * @param idofcart
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Cart readSingleProduct(int idofcart) throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM cart where idofcart = '" + idofcart + "'";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		Cart cart = new Cart();
		
		while (rs.next()) {

			int idOfCart = rs.getInt(1);
			int idOfCustomer = rs.getInt(2);
			int idOfGoods = rs.getInt(3);
			int numOfGoods = rs.getInt(4);
			double totalMoney = rs.getDouble(5);
			
			cart.setIdOfCart(idOfCart);
			cart.setIdOfCustomer(idOfCustomer);
			cart.setIdOfGoods(idOfGoods);
			cart.setNumOfGoods(numOfGoods);
			cart.setTotalMoney(totalMoney);
			
		}
		
		if (cart != null) {
			return cart;
		}
		
		return null;
	}

	
	/**
	 * 把购物车中的信息同步增加到goodintransit表中，（因为下单后，cart表中的记录会删除，所以需要这个goodintransit表赋值一份资料）
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
	public boolean CartAddToGoodsInTransit(int customerid, int cartid,
			int idofgoods, int numofgoods, double totalmoney) throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();
		
			conn = DB.DBConn();

			String sql = "INSERT INTO goodsintransit(idofcart,idofcustomer,idofgoods,numofgoods,totalmoney) "
					+ "VALUES(?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, cartid);
			stmt.setInt(2, customerid);
			stmt.setInt(3, idofgoods);
			stmt.setInt(4, numofgoods);
			stmt.setDouble(5, totalmoney);
			
			if(stmt.executeUpdate() == 1){
				DB.close(conn);
				return true;
			}else {
				return false;
			}
	}

	public List<Order> queryOrdersByOperator(int idofcustomer, int requestCode) throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM orders";
		
		
		List<Order> orderList = new ArrayList<Order>();
		
		if (requestCode == 0 && idofcustomer == 0) {
			
			sql = "SELECT * FROM customerorder";
		}
		else if(requestCode != 0 && idofcustomer != 0){
			
			sql = "SELECT * FROM customerorder where customerorder = '" + idofcustomer +"'";
		}
		ResultSet rs = stmt.executeQuery(sql);

		Order order = null;
		
		while (rs.next()) {

			int idoforder = rs.getInt(1);
			int customerid = rs.getInt(2);
			String customername = rs.getString(3);
			String customeraddress = rs.getString(4);
			String customerphone = rs.getString(5);
			
			int idofcart = rs.getInt(6);
			String status = rs.getString(7);
			String expressmode = rs.getString(9);
			double expresscharge = rs.getDouble(9);
			String paymode = rs.getString(10);
			String expressworker = rs.getString(11);
			String expressworkerphone = rs.getString(12);
			String invoicestypeandinfo = rs.getString(13);
			double totalmoney = rs.getDouble(14);

			order = new Order();
			
			order.setId(idoforder);
			order.setCustomerID(customerid);
			order.setCustomerName(customername);
			order.setCustomerAddress(customeraddress);
			order.setCustomerPhone(customerphone);
			order.setIdOfCart(idofcart);
			order.setStatus(status);
			order.setExpressMode(expressmode);
			order.setExpressCharge(expresscharge);
			order.setPayMode(paymode);
			order.setExpressWorker(expressworker);
			order.setExpressWorkerPhone(expressworkerphone);
			order.setInvoiceStypeAndInfo(invoicestypeandinfo);
			order.setTotalMoney(totalmoney);
			
			
			orderList.add(order);
		}
		DB.close(conn);
		if (orderList != null) {
			
			return orderList;
		}
		
		return null;
	}
	
	
	public boolean editCustomerOrderStatus(int customerid,int requestCode) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		if (requestCode == 11) {

			try {
				conn = DB.DBConn();

				sql = "UPDATE customerorder SET status = ? where idoforder = ?";

//				File file_edit = new File(jtf_open.getText());
//				FileInputStream fis_edit = new FileInputStream(file_edit);

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, "卖家已付款");
				stmt.setInt(2, customerid);
//				stmt.setString(3, birthday);
//				stmt.setString(4, note);
//				stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
//				stmt.setString(6, id);
				if (stmt.executeUpdate() == 1) {
					DB.close(conn);
					return true;
				}
				return false;
				
//				fis_edit.close();
				
//				参考sql = "update seller set shopid = '' where id = '" + id +"'";

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} 
				
			
		}
		return false;
	}

	/**
	 * 会员、运营商删除订单（每次删除一条）
	 * @param orderId
	 * @param requestCode
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public boolean delOrder(int orderId, int requestCode) throws SQLException, ClassNotFoundException {

		Connection conn = DB.DBConn();

		Statement stmt = conn.createStatement();
		String sql = "";
		//会员删除订单（每次删除一条）
		if (requestCode == 0) {
			sql = "delete from customerorder where idoforder = '" + orderId + "'";
		}
		//运营商删除订单，需输入权限密码
		else if (requestCode == 1 ) {
			sql = "delete from customerorder where idoforder = '" + orderId + "'";
		}
		
		if (stmt.executeUpdate(sql) == 1) {
			
			DB.close(conn);
			return true;
		}
		
		DB.close(conn);
		
		return false;
	}
	
	//查询订单状态
	public String readOrderStatus(int orderId) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		sql = "SELECT status FROM customerorder where idoforder = '" + orderId +"'";
		ResultSet rs = stmt.executeQuery(sql);
		String status = null;
		if (rs.next()) {

			status = rs.getString(1);
		}
		DB.close(conn);
		if (status != null) {
			
			return status;
		}
		
		return null;
	}

	/**
	 * 根据订单金额和会员id修改customer表的余额
	 * @param customerId
	 * @param totalMoney
	 * @return -1(余额不足) 1(余额充足)
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int editCustomerBalance(int customerId,double totalMoney,int requestCode) throws SQLException, ClassNotFoundException {

		Connection conn = DB.DBConn();

		String sql = null;
		
		conn = DB.DBConn();

		Statement stmt = conn.createStatement();
		
		sql = "SELECT balance FROM customer where id = '" + customerId +"'";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		double balance = 0.0;
		
		if (rs.next()) {

			balance = rs.getDouble(1);
//			System.out.println("balance = " + balance);
		}
		
		//会员买东西，减去金额
		if (requestCode == 0) {
			
				balance -= totalMoney;
		}
		//会员退货成功，收到全额退款
		else if (requestCode == 1) {
				balance += totalMoney;
			
		}
		
//		System.out.println("now,balance = " + balance);
		if (balance >= 0) {
			sql = "UPDATE customer SET balance = " + balance + " where id = '" + customerId + "'";
			
			if (stmt.executeUpdate(sql) == 1) {
				DB.close(conn);
				return 1;
			}else {
				return -1;
			}
		}
//		fis_edit.close();
				
//		参考sql = "update seller set shopid = '' where id = '" + id +"'";
		return -1;
	}

	/**
	 * 充值页面验证会员身份、id、支付密码的有效性
	 * @param customerId
	 * @param userIdentity
	 * @param payPsw
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean isValidCustomer(int customerId, String userIdentity,
			String payPsw) throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();
		String sql = null;
		
		conn = DB.DBConn();
		Statement stmt = conn.createStatement();
//		System.out.println("1");
		List<Customer> customers =  (List<Customer>)query(userIdentity, customerId, 0);
		Customer customer = null;
		
		if (customers == null) {
			return false;
		}
		else if (customers != null) {
			
		
			for (Customer cus : customers) {
				customer = cus;
			}
			
			if (customer.getPayPsw().equals(payPsw)) {
				return true;
			}
			else {
				return false;
			}
		
		}
		return false;
	}

	/**
	 * 会员输入支付密码，而且账户余额充足，支付成功后，更改订单状态:
	 * 1、等待买家付款->卖家已付款
	 * @param orderId
	 * @param status
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public boolean editOrderStatus(int orderId, String status) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		conn = DB.DBConn();

		sql = "UPDATE customerorder SET status = ? where idoforder = ?";

		PreparedStatement stmt = conn.prepareStatement(sql);
		//买家操作
		if (status.equals("等待买家付款")) {
			
			stmt.setString(1, "买家已付款，等待平台确认");
		}
		//卖家操作
		else if (status.equals(new String("买家已付款，等待平台确认"))) {
			stmt.setString(1, "卖家已发货");
		}
		//买家操作
		else if (status.equals(new String("卖家已发货"))) {
			stmt.setString(1, "买家已收货");
		}
		//卖家操作
		else if (status.equals(new String("买家已收货"))) {
			stmt.setString(1, "交易成功，关闭交易");
		}
		//
//		else if (status.equals(new String("交易成功，关闭交易"))) {
//			stmt.setString(1, "申请退换货");
//		}
		//买家操作
		else if (status.equals(new String("tuihuo"))) {
			stmt.setString(1, "买家申请退货");
		}
		//卖家操作
		else if (status.equals(new String("买家申请退货"))) {
			stmt.setString(1, "卖家申请退货协议已达成");
		}
		//买家操作
		else if (status.equals(new String("huanhuo"))) {
			stmt.setString(1, "买家申请换货");
		}
		//卖家操作
		else if (status.equals(new String("买家申请换货"))) {
			stmt.setString(1, "卖家申请换货协议已达成");
		}
		stmt.setInt(2, orderId);
		if (stmt.executeUpdate() == 1) {
			DB.close(conn);
			return true;
		}
		return false;
	}

	/**
	 * 会员充值账户余额
	 * @param parseInt 会员id
	 * @param parseDouble 要充值的金额
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public boolean chongzhiBalance(int parseInt, double parseDouble) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		conn = DB.DBConn();

		sql = "SELECT balance FROM customer where id = '" + parseInt +"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		double balance = 0.0;
		
		if (rs.next()) {

			balance = rs.getDouble(1);
//			System.out.println("chongzhiBalance（）中，当前balance = " + balance);
		}
		System.out.println("之前的balance"+balance);
		balance += parseDouble;
		sql = "UPDATE customer SET balance = " + balance + " where id = '" + parseInt+"'";

			
		if (stmt.executeUpdate(sql) == 1) {
			DB.close(conn);
			return true;
		}
		DB.close(conn);
		return false;
	}

	/**
	 * 根据订单查询购物车，用于订单状态更改为“买家已付款，等待平台确认”，删除对应的购物车记录
	 * @param orderId
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public int readCartIdInOrderStatus(int orderId) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		conn = DB.DBConn();

		sql = "SELECT idofcart FROM customerorder where idoforder = '" + orderId +"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		int cartId = -1;
		if (rs.next()) {

			cartId = rs.getInt(1);
		}
		if (cartId != -1) {
			return cartId;
		}
		return cartId;
	}

	/**
	 * 查询订单的总额-》得出运营商的营业额
	 * @param orderId
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public double readOrderMoney(int orderId) throws SQLException, ClassNotFoundException {

		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		sql = "SELECT totalmoney FROM customerorder where idoforder = '" + orderId +"'";
		ResultSet rs = stmt.executeQuery(sql);
		double totalmoney = 0.0;
		if (rs.next()) {

			totalmoney = rs.getDouble(1);
		}
		DB.close(conn);
		if (totalmoney != 0) {
			
			return totalmoney;
		}
		
		return totalmoney;
	}
	
	/**
	 * 在订单中读取会员id，用于修改会员余额，（买东西和退货)
	 * @param orderId
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int readCustomerIdInOrder(int orderId) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		
		String sql = null;
		
		Statement stmt = conn.createStatement();
		sql = "SELECT customerid FROM customerorder where idoforder = '" + orderId +"'";
		ResultSet rs = stmt.executeQuery(sql);
		int customerId = -1;
		if (rs.next()) {
			
			customerId = rs.getInt(1);
		}
		DB.close(conn);
		if (customerId != -1) {
			
			return customerId;
		}
		
		return customerId;
	}

	public boolean editOperatorTurnOver(int operatorId, double totalMoney,int requestCode) throws ClassNotFoundException, SQLException {

		List<Operator> operators = (List<Operator>)query("operator", operatorId, 0);
		
		Operator operator = null;
		
		for (Operator op : operators) {
			operator = op;
		}
				
		double turnover = 0.0;
		if (requestCode == 1) {
			
			turnover = operator.getTurnover() + totalMoney;
		}
		else if(requestCode == 0){
			turnover = operator.getTurnover() - totalMoney;
			
		}
		if (turnover < 0) {
			return false;
		}
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		conn = DB.DBConn();

		Statement stmt = conn.createStatement();
		
		sql = "UPDATE operator SET turnover = " + turnover + " where id = '" + operatorId + "'";
			
		if (stmt.executeUpdate(sql) == 1) {
			DB.close(conn);
			return true;
		}else {
			DB.close(conn);
			return false;
		}
	}

	/**
	 * 会员修改信息
	 * @param customer
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean editCustomerInfo(Customer customer) throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		conn = DB.DBConn();

		sql = "UPDATE customer SET name = ?,psw = ?,paypsw = ?,phone = ?,deliveryaddresses = ? where id = ?";

		PreparedStatement stmt = conn.prepareStatement(sql);
			
		stmt.setString(1, customer.getName());
		stmt.setString(2, customer.getPsw());
		stmt.setString(3, customer.getPayPsw());
		stmt.setString(4, customer.getPhone());
		stmt.setString(5, customer.getDeliveryAddress());
		stmt.setInt(6, customer.getId());
		if (stmt.executeUpdate() == 1) {
			DB.close(conn);
			return true;
		}
		DB.close(conn);
		return false;
	}

	/**
	 * 根据身份和小明查找id
	 * @param identity
	 * @param customerName
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int queryIdByName(String identity, String customerName) throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		if (identity.equals(new String("customer"))) {
			
			sql = "SELECT id FROM customer where name = '" + customerName +"'";
		}
		ResultSet rs = stmt.executeQuery(sql);
		int id = -1;
		if (rs.next()) {

			id = rs.getInt(1);
		}
		DB.close(conn);
		if (id != -1) {
			
			return id;
		}
		
		return id;
		
	}

	public boolean addGoodsInfo(Goods goods) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		
			conn = DB.DBConn();

			String sql = "INSERT INTO goods "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
//			stmt.setString(1, id);
			
			stmt.setInt(1, goods.getId());
			stmt.setString(2, goods.getName());
			stmt.setString(3, goods.getSort());
			stmt.setInt(4, goods.getTotalvolume());
			stmt.setInt(5, 0);
			stmt.setInt(6, (goods.getTotalvolume() - 0));
			stmt.setDouble(7, goods.getPrice());
			stmt.setString(8, goods.getIntroduce());
			stmt.setString(9,goods.getColor() );
			stmt.setString(10,goods.getStyle() );
			stmt.setString(11,goods.getSpecification() );
			stmt.setString(12,"" );
			stmt.setString(13, goods.getPicturepath());
			
			if(stmt.executeUpdate() == 1){
				DB.close(conn);
				return true;
			}else {
				return false;
			}

	}

	public boolean editGoodsInfo(Goods goods) throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();
		
		conn = DB.DBConn();

		String sql = null;
//		"INSERT INTO goods "
//				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		sql = "UPDATE goods SET name = ?,class = ?,totalvolume = ?,salesvolume = ?,kucun = ?"
				+ ",price = ?,introduce = ?,color = ?,style = ?,specification = ?,evaluation = ?,"
				+ "picturepath = ? where id = ?";

		PreparedStatement stmt = conn.prepareStatement(sql);
//		stmt.setString(1, id);
		
		stmt.setString(1, goods.getName());
		stmt.setString(2, goods.getSort());
		stmt.setInt(3, goods.getTotalvolume());
		stmt.setInt(4, goods.getSalesvolume());
		stmt.setInt(5, (goods.getTotalvolume() - goods.getSalesvolume()));
		stmt.setDouble(6, goods.getPrice());
		stmt.setString(7, goods.getIntroduce());
		stmt.setString(8,goods.getColor() );
		stmt.setString(9,goods.getStyle() );
		stmt.setString(10,goods.getSpecification() );
		stmt.setString(11,goods.getEvaluation() );
		stmt.setString(12, goods.getPicturepath());
		stmt.setInt(13, goods.getId());
		
		if(stmt.executeUpdate() == 1){
			DB.close(conn);
			return true;
		}else {
			DB.close(conn);
			return false;
		}
	}	
}