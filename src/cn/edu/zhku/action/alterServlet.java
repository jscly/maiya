package cn.edu.zhku.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.control.goodsControl;
import cn.edu.zhku.entity.Goods;


public class alterServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public alterServlet() {
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
		
		int goodsID;
		String goodsName;
		int goodsPrice;
		int goodsLess;
		String beizhu;
		
		goodsID = Integer.parseInt(request.getParameter("goodsID"));
		System.out.println("已经进入servlet");
		goodsName = request.getParameter("goodsName");
		goodsPrice = Integer.parseInt(request.getParameter("goodsPrice"));
		goodsLess = Integer.parseInt(request.getParameter("goodsLess"));
		beizhu = request.getParameter("beizhu");
		
		Goods A = new Goods();
		goodsControl alter = new goodsControl();
		
		A.setGoodsID(goodsID);
		A.setGoodsName(goodsName);
		A.setGoodsPrice(goodsPrice);
		A.setGoodsLess(goodsLess);
		A.setBeizhu(beizhu);
		
		System.out.println(goodsID);
		try {
			boolean p=false;
			p = alter.update(goodsID, goodsName, goodsPrice, goodsLess, beizhu);
			
			//把添加成功的用户对象保存在session中
			request.getSession().setAttribute("servletShop", A);
			
			if(p){
				System.out.println("修改完成");
				request.getRequestDispatcher("../alterGoodsAfter.jsp").forward(request, response);
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
