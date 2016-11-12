package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.enterprise.inject.New;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.service.CartService;

public class CustomerDelCart extends HttpServlet {

	
	UserDao userDao = new UserDao();
	
	CartService cartService = new CartService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("customerIdentity") != null && request.getParameter("customerId") != null && request.getParameter("userName") != null) {
			if (request.getParameter("customerIdentity").equals(new String("customer"))) {
				try {
					System.out.println("CustomerDelCart Servlet÷–£¨customerId = " + request.getParameter("customerId"));
					if(cartService.CustomerDelCart(Integer.parseInt
							(request.getParameter("customerId")),Integer.parseInt
							(request.getParameter("idOfCart")), 0)){
						
					
//							request.setAttribute("userIdentity", request.getParameter("customerIdentity"));
//							request.setAttribute("userName", request.getParameter("userName"));
							RequestDispatcher rd = request.getRequestDispatcher( "../cartDelSuccess.jsp" );
							rd.forward( request, response);
					}
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

}
