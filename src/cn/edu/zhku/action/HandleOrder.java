package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.service.CartService;

public class HandleOrder extends HttpServlet {

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
			double totalMoney = 0.0;
			int customerId = -1;
			try {
				totalMoney =  cartService.readOrderMoney(orderId);
				customerId = cartService.readCustomerIdInOrder(orderId);
			} catch (ClassNotFoundException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
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
			
			if (reqCode == 2 && orderId > 0) {
				try {
					if (cartService.editOrderStatus(orderId, status)) {
						
						request.setAttribute("requestCode", new Integer(21));
						RequestDispatcher rd = request.getRequestDispatcher( "../pay.jsp" );
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
			else if (reqCode == 3) {
				
			}
			else if (reqCode == 4) {

				try {
					if (cartService.editOrderStatus(orderId, status)) {
						if (request.getParameter("operatorId") != null ) {
							System.out.println("read from order:"+totalMoney);
							if(cartService.editOperatorTurnOver(Integer.parseInt(request.getParameter("operatorId")), totalMoney,1)){
							
								request.setAttribute("requestCode", new Integer(41));
								RequestDispatcher rd = request.getRequestDispatcher( "../pay.jsp" );
								rd.forward( request, response);
							}
						}
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}
			else if (reqCode == 5) {
				//处理退货申请
				try {
					if (request.getParameter("caozuo").equals(new String("tuihuo"))) {
						
					
					if (cartService.editOrderStatus(orderId, "买家申请退货")) {
						if (request.getParameter("operatorId") != null ) {
							System.out.println("read from order:"+totalMoney);
							if(cartService.editOperatorTurnOver(Integer.parseInt(request.getParameter("operatorId")), totalMoney,0)
									&&
									cartService.editCustomerBalance(customerId, totalMoney, 1)){
							
						
								request.setAttribute("requestCode", new Integer(51));
								RequestDispatcher rd = request.getRequestDispatcher( "../pay.jsp" );
								rd.forward( request, response);
							}
							else {
								request.setAttribute("requestCode", new Integer(52));
								RequestDispatcher rd = request.getRequestDispatcher( "../pay.jsp" );
								rd.forward( request, response);
								
							}
						}
					}
					}
					else if (request.getParameter("caozuo").equals(new String("huanhuo"))) {
						if (cartService.editOrderStatus(orderId, "买家申请换货")) {
							request.setAttribute("requestCode", new Integer(53));
							RequestDispatcher rd = request.getRequestDispatcher( "../pay.jsp" );
							rd.forward( request, response);
						}
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
