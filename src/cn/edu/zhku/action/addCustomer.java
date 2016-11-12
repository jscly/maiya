package cn.edu.zhku.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.control.customersControl;
import cn.edu.zhku.control.goodsControl;
import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.entity.Customers;
import cn.edu.zhku.entity.Goods;

public class addCustomer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addCustomer() {
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
	
	Customers C = new Customers();
	String customerName;
	String customerPsw;
	String phone;
	
	
	try {
		customerName = request.getParameter("customerName");
		customerPsw = request.getParameter("customerPsw");
		phone = request.getParameter("phone");
		
		
		C.setName(customerName);
		C.setPsw(customerPsw);
		C.setPhone(phone);
		
		
		//把添加成功的用户对象保存在session中
		request.getSession().setAttribute("servletShop", C);
		
		customersControl A = new customersControl();
		
		boolean b = false;
		 b = A.add(customerName,customerPsw,phone);
	
		if(b){
			HttpSession session=request.getSession(true);
			session.setAttribute("customerName", customerName);
			session.setAttribute("userIdentity", "customer");
			session.setAttribute("userName", customerName);
			
			UserDao userDao = new UserDao();
			int id =  userDao.queryIdByName("customer", customerName);
			System.out.println("注册方法中，id = " + id);
			session.setAttribute("userId", id);
			session.setAttribute("customerPsw", customerPsw);
			session.setAttribute("phone", phone);
			
			System.out.println("YES");
			//跳转到注册成功页面
			//request.getRequestDispatcher("../addGoodsAfter.jsp").forward(request, response);
			
			System.out.println("注册成功");
			RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageCustomer.jsp" );
			rd.forward( request, response);
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
