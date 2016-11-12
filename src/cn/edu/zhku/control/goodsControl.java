package cn.edu.zhku.control;


import java.nio.channels.SelectableChannel;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.mail.Address;

import org.omg.CORBA.INTERNAL;

import cn.edu.zhku.DB.*;
import cn.edu.zhku.entity.Goods;

public class goodsControl {
//	GoodsID,goodsName,goodsPrice,goodsIN,beizhu
	public boolean add(int goodsID, String goodsName, int goodsPrice, int goodsIN, String Beizhu) throws ClassNotFoundException, SQLException{
		System.out.println("插入成功");
		int GoodsID = goodsID;
		String GoodsName = goodsName;
		int GoodsPrice = goodsPrice;
		int GoodsIN = goodsIN;
		String beizhu = Beizhu;
		
		Connection conn = DB.DBConn();
		
		String sql = "INSERT INTO goodsforsales(idgoods,goodsName,price,sum,sells,less,notes)" + "VALUES(" 
					+GoodsID  +  ",'"  +  GoodsName  +"',"+GoodsPrice+","+GoodsIN+","+0+","+GoodsIN+",'"+beizhu+"'"+")";
		System.out.println("插入成功");
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
	
		DB.close(conn);
		
		return true;
		
	}
	
	
	 public ResultSet getAll() throws SQLException, ClassNotFoundException{
		 
		    Connection conn = DB.DBConn();
	        ResultSet rs = null;
	        Statement stat = (Statement) conn.createStatement();
	        rs = stat.executeQuery("select * from goods");
	        return rs;
	 }
	 
	 public boolean delete(int id,String name) throws ClassNotFoundException, SQLException{
		 System.out.println(name);
		
		 System.out.println("0");
		 if(name.equals(Select(id))){
			 
			int i = id;
			String sql = "DELETE FROM goods WHERE id='"+i+"'";
			Connection conn = DB.DBConn();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			DB.close(conn);
			System.out.println("kkkkkkk");
			return true;
		 }else {
			 return false;
		}
		 
	 }
//	public static void main(String[] args) throws ClassNotFoundException, SQLException {
//		goodsControl g=new goodsControl();
//		
//		int goodsID=919;
//		String goodsName="G";
//		int goodsPrice = 4000;
//		int goodsIN=20;
//		String beizhu="可退";
//		
//		
//		g.add(goodsID,goodsName,goodsPrice,goodsIN,beizhu);
//	}


	private String Select(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection conn = DB.DBConn();
	
		String sql = "SELECT name FROM goods where id = '" + id+  "'";
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		String[] nameCheck = new String[1];
		while (rs.next()) {
			nameCheck[0] = rs.getString("name");
			
		}
		String nameChecked=nameCheck[0];
		System.out.println("321");
		System.out.println(nameChecked);
		DB.close(conn);
		return nameChecked;
		
		
	}


	public ResultSet selectForAlter(int goodsID) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection conn = DB.DBConn();
		System.out.println("selectForAlter已进入");
		String sql = "SELECT * FROM goodsforsales where idgoods = '" + goodsID+  "'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("selectForAlter已完成");
//		DB.close(conn);
		return rs;
	}


	public boolean update(int goodsID, String goodsName, int goodsPrice,
			int goodsLess, String beizhu) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection conn = DB.DBConn();
		System.out.println("update已进入");
		
		String sql = "UPDATE goodsforsales SET goodsName ='"+goodsName+"' , price = '"+goodsPrice+"' , less='"+goodsLess+"' , notes='"+beizhu+"' WHERE idgoods = "+"'"+goodsID+"'";
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		DB.close(conn);
		
		return true;
	}
	
	public ResultSet selectBySell(int i) throws ClassNotFoundException, SQLException{
		Connection conn = DB.DBConn();
		System.out.println("selectBySell已进入");
		
		String sql = "SELECT * FROM goods where salesvolume = '" + i+  "'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("selectForSell已完成");
//		DB.close(conn);
		while(rs.next()){
		System.out.println(rs.getInt("id"));
		}
		return rs;
		
	}
}
   




