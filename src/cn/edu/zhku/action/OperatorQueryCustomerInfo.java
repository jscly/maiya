package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.model.Customer;
import cn.edu.zhku.service.OperatorManagementService;

public class OperatorQueryCustomerInfo extends HttpServlet {

	OperatorManagementService operatorManagementService = new OperatorManagementService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		运营商查看会员信息（登录密码、支付密码、余额除外）
//		./servlet/OperatorQueryCustomerInfo?requestCode=displayCustomers
		
		if (request.getParameter("requestCode") != null) {
			if (request.getParameter("requestCode").equals(new String("displayCustomers"))) {
				request.setAttribute("GenealViewOrSpecificView", new Integer(7));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		operatorIdToQureryCustomer operatorIdenToQureryCustomer
		if (request.getParameter("GenealViewOrSpecificView") != null) {
			if (Integer.parseInt(request.getParameter("GenealViewOrSpecificView")) == 71) {
//				参数：operatorIdToSynShop,operatorIdtenToSynShop
				String operatorIdToQureryCustomer = (String)request.getParameter("operatorIdToQureryCustomer");
				String operatorIdenToQureryCustomer = (String)request.getParameter("operatorIdenToQureryCustomer");
				try {
					List<Customer> customersInfolList = operatorManagementService.QueryCustomersInfo(operatorIdenToQureryCustomer, Integer.parseInt(operatorIdToQureryCustomer) );
					
					
					if(customersInfolList != null){

						System.out.println("111");
						request.setAttribute("customersInfolList", customersInfolList);
						request.setAttribute("GenealViewOrSpecificView", new Integer(72));
						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
						rd.forward( request, response);
					}
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
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
