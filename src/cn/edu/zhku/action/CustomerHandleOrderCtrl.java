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

import cn.edu.zhku.service.CartService;

public class CustomerHandleOrderCtrl extends HttpServlet {

	CartService cartService = new CartService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("requestCode") != null && 
				request.getParameter("orderId") != null) {
			
			String requestCode = request.getParameter("requestCode");
			int reqCode = Integer.parseInt(requestCode);
			
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			
			//读取当前的订单状态
			String status = null;
			try {
				status = cartService.readOrderStatus(orderId);
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			if (reqCode == 1 && orderId > 0) {
				try {
					if (cartService.editOrderStatus(orderId, status)) {
						
						request.setAttribute("requestCode", new Integer(11));
						RequestDispatcher rd = request.getRequestDispatcher( "../EditTheOrderStatusByCustomer.jsp" );
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
			else if (reqCode == 2) {
				try {
					//会员选择退货或换货
					String caozuo = request.getParameter("caozuo");
					System.out.println("caozuo = " + caozuo);
					if (caozuo.equals(new String("tuihuo"))&&cartService.editOrderStatus(orderId, caozuo)) {
						
						request.setAttribute("requestCode", new Integer(21));
						RequestDispatcher rd = request.getRequestDispatcher( "../EditTheOrderStatusByCustomer.jsp" );
						rd.forward( request, response);
					}else if (caozuo.equals(new String("huanhuo"))
							&&cartService.editOrderStatus(orderId, caozuo)) {
						request.setAttribute("requestCode", new Integer(22));
						System.out.println("reqcode = " + 22);
						RequestDispatcher rd = request.getRequestDispatcher( "../EditTheOrderStatusByCustomer.jsp" );
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
		
	}

}
