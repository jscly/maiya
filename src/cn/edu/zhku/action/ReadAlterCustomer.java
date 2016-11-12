package cn.edu.zhku.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.control.customersControl;
import cn.edu.zhku.entity.Customers;


public class ReadAlterCustomer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ReadAlterCustomer() {
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
		int ID;
		String Name;
		String Psw;
		String Phone;
		String address;
		
		
		try {
			ID = Integer.parseInt(request.getParameter("ID"));
			Name = request.getParameter("Name");
			System.out.println("get到name");
			Psw = request.getParameter("Psw");
			Phone=request.getParameter("Phone");
			address=request.getParameter("address");
			
			C.setName(Name);
			System.out.println(C.getName());
			C.setPsw(Psw);
			C.setPhone(Phone);
			C.setAddress(address);
			
			//把添加成功的用户对象保存在session中
			request.getSession().setAttribute("servletShop", C);
			
			customersControl R = new customersControl();
			
			boolean b = false;
			 b = R.upDate(ID, Name, Psw, Phone, address);
		
			if(b){
				HttpSession session=request.getSession(true);
				session.setAttribute("ID", ID);
				session.setAttribute("Name", Name);
				session.setAttribute("Psw", Psw);
				session.setAttribute("Phone", Phone);
				session.setAttribute("address", address);
				System.out.println("YES");
				//跳转到注册成功页面
				request.getRequestDispatcher("../alterCustomerAfter.jsp").forward(request, response);
				
				
			}else{
				System.out.println("error");
			}
		}catch (Exception e) {
				// TODO: handle exception
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
