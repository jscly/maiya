package cn.edu.zhku.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.control.goodsControl;
import cn.edu.zhku.entity.Goods;


public class AlterGoodsMessage extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AlterGoodsMessage() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("GB2312");
		
		Goods A = new Goods();
		int goodsID;
		String goodsName=null;
		 int goodsPrice = 0;
		 String beizhu = null;
		 int goodsLess = 0;
		
		
		
		try {
			goodsID = Integer.parseInt(request.getParameter("goodsID"));
			
			A.setGoodsID(goodsID);
			
			//把添加成功的用户对象保存在session中
			request.getSession().setAttribute("servletShop", A);
			
			goodsControl S = new goodsControl();
			ResultSet result;
			
			result=S.selectForAlter(goodsID);
			
			while(result.next()){
				goodsPrice=result.getInt("price");
			
				beizhu=result.getString("notes");
			
			
				goodsLess=result.getInt("less");
			
				goodsName=result.getString("goodsName");
			}
			
			
		
//			System.out.println(beizhu);
//			System.out.println("成功赋值goodsName"+ goodsName);
			A.setGoodsName(goodsName);
			A.setGoodsPrice(goodsPrice);
			A.setGoodsLess(goodsLess);
			A.setBeizhu(beizhu);
			
//			System.out.println("数值已传入javabean");
			goodsName=A.getGoodsName();
			goodsPrice=A.getGoodsPrice();
			beizhu=A.getBeizhu();
			goodsLess=A.getGoodsLess();
//			System.out.println("数值已传出javabean");
//			System.out.println(goodsPrice);
			
			HttpSession session=request.getSession(true);
			session.setAttribute("goodsID", goodsID);
			session.setAttribute("goodsName", goodsName);
			session.setAttribute("goodsPrice", goodsPrice);
			session.setAttribute("goodsLess", goodsLess);
			session.setAttribute("beizhu", beizhu);
		
			//跳转到注册成功页面
			request.getRequestDispatcher("../alterGoodsreal.jsp").forward(request, response);
			
	}catch(Exception e){
		e.printStackTrace();
	}
	}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
