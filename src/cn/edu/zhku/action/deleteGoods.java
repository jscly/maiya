package cn.edu.zhku.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.control.goodsControl;
import cn.edu.zhku.model.Goods;


public class deleteGoods extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public deleteGoods() {
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
		
		Goods G = new Goods();
		int goodsID;
		String goodsName;
		
		try {
			goodsID = Integer.parseInt(request.getParameter("deleteGoodsID"));
			goodsName = request.getParameter("deleteGoodsName");
			G.setId(goodsID);
			G.setName(goodsName);
			Boolean b= false;
			
			goodsControl D = new goodsControl();
			b=D.delete(goodsID,goodsName);
			System.out.println("id = " + goodsID + "\nname = " + goodsName);
			
			if(b){
				System.out.println("装入session");
				//把添加成功的用户对象保存在session中
				request.getSession().setAttribute("deleteGoods", G);
				//跳转到注册成功页面
				request.getRequestDispatcher("../deleteGoodsAfter.jsp").forward(request, response);
			}
			
			
	}catch (Exception e) {

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
