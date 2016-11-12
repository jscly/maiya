package cn.edu.zhku.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.control.goodsControl;
import cn.edu.zhku.entity.Goods;


public class shopServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public shopServlet() {
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
		System.out.println("1234");
		request.setCharacterEncoding("GB2312");
		
		Goods G = new Goods();
		int goodsID;
		String goodsName;
		int goodsPrice;
		int goodsIN;
		String beizhu;
		
		
		try {
			goodsID = Integer.parseInt(request.getParameter("goodsID"));
			goodsName = request.getParameter("goodsName");
			goodsPrice = Integer.parseInt(request.getParameter("goodsPrice"));
			goodsIN = Integer.parseInt(request.getParameter("goodsIN"));
			beizhu = request.getParameter("beizhu");
			
			G.setGoodsID(goodsID);
			G.setGoodsName(goodsName);
			G.setGoodsPrice(goodsPrice);
			G.setGoodsIN(goodsIN);
			G.setBeizhu(beizhu);
			
			//把添加成功的用户对象保存在session中
			request.getSession().setAttribute("servletShop", G);
			
			goodsControl A = new goodsControl();
			
			boolean b = false;
			 b = A.add(goodsID,goodsName,goodsPrice,goodsIN,beizhu);
			
			if(b){
				HttpSession session=request.getSession(true);
				session.setAttribute("goodsID", goodsID);
				session.setAttribute("goodsName", goodsName);
				session.setAttribute("goodsPrice", goodsPrice);
				session.setAttribute("goodsIN", goodsIN);
				session.setAttribute("beizhu", beizhu);
				System.out.println("YES");
				//跳转到注册成功页面
				request.getRequestDispatcher("../addGoodsAfter.jsp").forward(request, response);
			}else{
				System.out.println("error");
			}
			
			
			
		} catch (Exception e) {

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
