package cn.edu.zhku.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.zhku.DB.DB;
import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Customer;
import cn.edu.zhku.model.Operator;
import cn.edu.zhku.model.Order;
import cn.edu.zhku.model.ShopInfo;

public class OperatorManagementService {
	UserDao userDao = new UserDao();
	public ShopInfo QueryShopsInfoDetails(int shopId) throws SQLException, ClassNotFoundException{
		
		return userDao.QueryShopInfo(shopId);
	}
	/**
	 * 显示下一个店铺信息
	 * @param operatorId
	 * @param shopCurrentId
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public ShopInfo QueryNextShopInfoDetails(int operatorId,int shopCurrentId) throws SQLException, ClassNotFoundException{
//		v1.0 - err
//		UserDao userDao = new UserDao();
//		for (int i = 0; i < 10; i++) {
//			if(nextIsValidShopId(shopId+1)){
//				userDao.QueryShopInfo(shopId);
//				break;
//			}
//			else {
//				continue;
//			}
//		}
//		return userDao.QueryShopInfo(shopId);
		
//		UserDao userDao = new UserDao();
		int nextShopId = 0;
		List<?> userlist = userDao.query("operator",operatorId,0);
	    
		String shops = null;
		//获取由所有店铺id组成的字符串，
	    for (Object object : userlist) {
	    	shops = ((Operator)object).getShops();
	    }
	    
	    String [] shopsArr = shops.split(";");
	    int [] shopsIdArr = new int[shopsArr.length];
	    	
	    for(int i = 0;i < shopsIdArr.length;i++){
	    	shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
	    }
	    	
	    
		for (int i = 0; i < shopsIdArr.length; i++) {
			
			
			if(shopsIdArr[i] == shopCurrentId && i != shopsIdArr.length - 1){
				nextShopId = shopsIdArr[i + 1]; 
			}
			else if (shopsIdArr[i] == shopCurrentId && i == shopsIdArr.length - 1) {
				return null;
			}
			
		}
		return userDao.QueryShopInfo(nextShopId);
	}
	
//	err
//	public boolean nextIsValidShopId(int i) throws SQLException, ClassNotFoundException {
//		
//		UserDao userDao = new UserDao();
//		if (userDao.QueryShopInfo(i) != null) {
//			return true;
//		}
//		
//		return false;
//	}

	
	/**
	 * 查询上一个店铺信息
	 * @param operatorId_forlast
	 * @param shopCurrentId_forlast
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public ShopInfo QueryLastShopInfoDetails(int operatorId_forlast,int shopCurrentId_forlast) throws SQLException, ClassNotFoundException {
//		UserDao userDao = new UserDao();
		int lastShopId = 0;
		List<?> userlist = userDao.query("operator",operatorId_forlast,0);
	    
		String shops = null;
		//获取由所有店铺id组成的字符串，
	    for (Object object : userlist) {
	    	shops = ((Operator)object).getShops();
	    }
	    
	    String [] shopsArr = shops.split(";");
	    int [] shopsIdArr = new int[shopsArr.length];
	    	
	    for(int i = 0;i < shopsIdArr.length;i++){
	    	shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
	    }
	    	
	    
		for (int i = 0; i < shopsIdArr.length; i++) {
			
			if(shopsIdArr[i] == shopCurrentId_forlast && i != 0){
				lastShopId = shopsIdArr[i - 1]; 
			}
			else if (shopsIdArr[i] == shopCurrentId_forlast && i == 0) {
				return null;
			}
		}
		return userDao.QueryShopInfo(lastShopId);
	}
	/**
	 * 查询剩下的店铺信息
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<ShopInfo> QueryTheRemainingShopInfoDetails(int operatoeId,String queryedShopIds) throws ClassNotFoundException, SQLException{
		
//		UserDao userDao = new UserDao();
		
		//获得已显示在页面上的店铺的id数组
		String [] shopsArr = queryedShopIds.split(";");
    	int [] shopsIdArr = new int[shopsArr.length - 1];
    	
    	System.out.print("已显示的店铺id:");
    	for(int i = 0;i < shopsIdArr.length;i++){
    		shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
    		System.out.print(shopsIdArr[i] + "  A");
    	}
    	//获取数据库中，operator表中，operatorId对应的店铺id数组（全部店铺）
    	List <?> usersInfo = userDao.query("operator", operatoeId, 0);
    	
    	String shopIds = "";
    	
    	for (Object object : usersInfo) {
    		shopIds = ((Operator)object).getShops();
		}
    	//数据库中，具体获取到的所有店铺id
    	String [] shopsArr_all = shopIds.split(";");
    	int [] shopsIdArr_all = new int[shopsArr_all.length - 1];
    	
    	System.out.println("\n从数据库-operator表中读出来的所有店铺id为：");
    	for(int i = 0;i < shopsIdArr_all.length;i++){
    		shopsIdArr_all[i] = Integer.parseInt(shopsArr_all[i]);
    		System.out.print(shopsIdArr_all[i] + " ");
    	}
    	//得出将要显示在页面上的剩下的店铺id
    	List<Integer> intArrayList = new ArrayList<Integer>();
//    	for (ShopInfo integer : intArrayList) {
//			integer.add(0);
//		}
    	for (int i = 0; i < shopsIdArr_all.length; i++) {
			intArrayList.add(shopsIdArr_all[i]);
		}
    	
    	for (int i = 0; i < intArrayList.size(); i++) {
    		if (i == shopsIdArr.length) {
				break;
			}
    		else if (intArrayList.contains(new Integer(shopsIdArr[i]))) {
    			intArrayList.remove(new Integer(shopsIdArr[i]));
			}
    		
		}
    	//如果从数据库读取到的店铺ids为空
    	if (intArrayList.size() == 0) {
    		return null;
    	}
    	System.out.println("移除后：");
    	for (Integer integer : intArrayList) {
			System.out.print(integer + " ");
		}
    	List<ShopInfo> theRemainingShopsId = new ArrayList<ShopInfo>();
    	
    	for (int i = 0 ; i < intArrayList.size() ; i++) {
    		theRemainingShopsId.add(userDao.QueryShopInfo(intArrayList.get(i).intValue()));
		}
    	System.out.println("l = "+theRemainingShopsId.size() + "   " + theRemainingShopsId.get(0).getShopId());
		return theRemainingShopsId;
		
	}
	
	
	/**
	 * 运营商删除店铺信息、会员信息
	 * @param identity
	 * @param shopCurrentId
	 * @param operatorid
	 * @param requsetCode
	 * @return
	 * @throws SQLException
	 * @throws NumberFormatException
	 * @throws ClassNotFoundException
	 * @throws IOException
	 */
	public boolean OperatorDeleteOthersInfo(String identity,String CurrentId,String operatorid,int requsetCode) throws SQLException, NumberFormatException, ClassNotFoundException, IOException{
		if (identity.equals(new String("operator"))) {
			if (requsetCode == 1) {
				//运营商删除店铺信息
				boolean flag_shop = userDao.delelte(CurrentId, 22);
				//删除seller表中的shopid，如果这个卖家是这个店铺的所有者，则把店铺的记录设为空（表示该卖家暂时没店铺，将来需要运营商通过其提交的申请开店的请求书）
				int sellerId = userDao.getSellerIdByOperator(Integer.parseInt(CurrentId));
				boolean flag_seller = userDao.delelte(String.valueOf(sellerId), 210);
				System.out.println(identity + "   " + CurrentId + "   " + operatorid);
				//operator中，shops的记录进行相应的更新，即删除这个店铺id
				List<?> operatorList = userDao.query(identity, Integer.parseInt(operatorid), 0);
				System.out.println("成功1？");
				
				Operator operator = null;
				for (Object object : operatorList) {
					operator = (Operator)object;
				}
				
				String shops  = operator.getShops();
	//userDao.updateShopsIdByOperator(identity);
				
				boolean flag_operator = userDao.updateShopsIdByOperator(shops,CurrentId,Integer.parseInt(operatorid),1);
				System.out.println("OperatorDeleteShop   servlet 成功");
				if (flag_seller && flag_shop && flag_operator) {
					
					return true;
				}
				else {
					return false;
				}
			}
		//运营商删除会员信息
		else if (requsetCode == 2) {
			System.out.println("h");
			boolean flag_shop = userDao.delelte(CurrentId, 20);
						if (flag_shop ) {
							return true;
						}
						else {
							return false;
						}
		}
		
		}
		return false;
	}
	
	
	public boolean Synchronize(String operatorid,String opearatorIdentity,int reqCode) throws NumberFormatException, ClassNotFoundException, SQLException{
		
		//初步处理同步店铺ip信息，其他的以后完善
		if (reqCode == 1) {
			
		
		System.out.println("zl");
//		List<?> operatorList = userDao.query(opearatorIdentity, Integer.parseInt(operatorid), 0);
//		Operator operator = null;
//		for (Object object : operatorList) {
//			operator = (Operator)object;
//		}
//		
//		String shops  = operator.getShops();
//		System.out.println("123456" +shops);
		//从shop表读取的全部店铺id
		List<?> idOfShopList = userDao.query(opearatorIdentity, Integer.parseInt(operatorid), 11);
		
		String idOfShopString = "";
		
		for (Object object : idOfShopList) {
			idOfShopString += (String)object + ";";
		}
		System.out.println("1234567" + idOfShopString);
		
		Connection conn = null;

			conn = DB.DBConn();

			String sql = "UPDATE operator SET shops = ? where id = ?";

//			File file_edit = new File(jtf_open.getText());
//			FileInputStream fis_edit = new FileInputStream(file_edit);

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, idOfShopString);
			stmt.setString(2, operatorid);
//			stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
			if (stmt.executeUpdate() == 1) {
				DB.close(conn);
				return true;
			}
			
			DB.close(conn);
		}
		
		//从shop表读取的全部会员id
		else if(reqCode == 2){
			List<?> idsList = userDao.query(opearatorIdentity, Integer.parseInt(operatorid), 12);
			
			String idsString = "";
			
			for (Object object : idsList) {
				idsString += (String)object + ";";
			}
			
			Connection conn = null;

				conn = DB.DBConn();

				String sql = "UPDATE operator SET customers = ? where id = ?";

//				File file_edit = new File(jtf_open.getText());
//				FileInputStream fis_edit = new FileInputStream(file_edit);

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, idsString);
				stmt.setString(2, operatorid);
//				stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
				if (stmt.executeUpdate() == 1) {
					DB.close(conn);
					return true;
				}
				
				DB.close(conn);
		}
			
		return false;
	}
	
//	运营商认证店铺
//	参数operatorIdToSynShop,operatorIdtenToSynShop
	public boolean AuthenticateShopCtrl(String operatorId,String operatorIdentity) throws ClassNotFoundException, SQLException, IOException{
		System.out.println("AuthenticateShopCtrl方法里");
		//查询shop表中，
		List<?> isValidShopList = userDao.QueryShopAllInfos(1);
		ShopInfo isValidShop = null;
		
		boolean flag = false;
		
		for (Object object : isValidShopList) {
			isValidShop = (ShopInfo)object;
			//为0则该店铺还没认证
			if (Integer.parseInt(isValidShop.getIsValidShop()) == 0) {
				System.out.println("3,shopid" + isValidShop.getShopId());
				userDao.updateShopsIdByOperator(null, String.valueOf(isValidShop.getShopId()), -1, 2);
				
				flag = true;
			}
		}
		
		//都为1则店铺已全部认证，返回false
			
		return flag;
	}
	
	
//	运营商查看会员信息（登录密码、支付密码除外）
	public List<Customer> QueryCustomersInfo(String operatorIdentity,int operatorId) throws ClassNotFoundException, SQLException{
		
		if (operatorIdentity.equals(new String("operator"))) {
			return (List<Customer>)userDao.query(operatorIdentity, operatorId, 13);
		}
		
		return null;
	}
	/**
	 * 运营商获取权限密码
	 * @param input
	 * @param identity
	 * @param id
	 * @param requestCode
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean QueryAuthorityPsw(String input,String identity,int id,int requestCode) throws ClassNotFoundException, SQLException{
		//reqcode=0
		List<Operator> operatorList = (List<Operator>)userDao.query(identity, id, requestCode);
		
		String getString = null;
		for (Operator operator : operatorList) {
			getString = operator.getOperatingAuthorityPsw();
		}
		
		if (input.equals(new String(getString))) {
			return true;
		}
		return false;
	}
	public boolean edit(Operator operator,int requestCode) throws SQLException, IOException {
		
		if (userDao.edit(operator, requestCode)) {
			return true;
		}
		
		
		return false;
	}

	public List<Order> queryOrders() throws ClassNotFoundException, SQLException{
		
		List<Order> ordersList = userDao.queryOrdersByOperator(0,0);
		
		if (ordersList != null) {
			return ordersList;
		}
		
		return null;
		
	}

}
