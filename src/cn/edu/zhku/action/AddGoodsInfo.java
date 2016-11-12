package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Goods;

public class AddGoodsInfo extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		String goodsID = request.getParameter("goodsID");
		String goodsName = request.getParameter("goodsName");
		String goodsClass = request.getParameter("goodsClass");
		String goodsIN = request.getParameter("goodsIN");
		String goodsPrice = request.getParameter("goodsPrice");
		String intro = request.getParameter("intro");
		String color = request.getParameter("color");
		String style = request.getParameter("style");
		String speci = request.getParameter("speci");
		String pic = request.getParameter("pic");
		
		Goods goods = new Goods();
		
		goods.setId(Integer.parseInt(goodsID));
		goods.setName(goodsName);
		goods.setSort(goodsClass);
		goods.setTotalvolume(Integer.parseInt(goodsIN));
		goods.setPrice(Double.parseDouble(goodsPrice));
		goods.setIntroduce(intro);
		goods.setColor(color);
		goods.setStyle(style);
		goods.setSpecification(speci);
		goods.setPicturepath(pic);
//		System.out.println(goodsID+goodsName+goodsClass+goodsIN+goodsPrice+intro+color+style+speci+pic);
		
		UserDao userDao = new UserDao();
		
		try {
			if (userDao.addGoodsInfo(goods)) {
				request.setAttribute("success", "true");
				RequestDispatcher rd = request.getRequestDispatcher( "../AddGoods.jsp" );
				rd.forward( request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

}
