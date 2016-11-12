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

import cn.edu.zhku.model.Customer;
import cn.edu.zhku.service.CustomerManagementService;

public class AlterCustomerInfo extends HttpServlet {
	
	CustomerManagementService customerManagementService = new CustomerManagementService();
	

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		Customer customer = new Customer();
		
		customer.setId(Integer.parseInt(request.getParameter("id")));
		customer.setName(request.getParameter("name"));
		customer.setPsw(request.getParameter("psw"));
		customer.setPayPsw(request.getParameter("payPsw"));
		customer.setPhone(request.getParameter("phone"));
		customer.setDeliveryAddress(request.getParameter("address"));
		
		try {
			if(customerManagementService.editInfo(customer)){
				System.out.println("success");
				request.setAttribute("editSuccess", new String("yes"));
				RequestDispatcher rd = request.getRequestDispatcher( "../AlterCustomer.jsp" );
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
