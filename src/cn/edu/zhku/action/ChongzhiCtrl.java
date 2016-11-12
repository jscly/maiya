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

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Customer;

public class ChongzhiCtrl extends HttpServlet {
	
	UserDao userDao = new UserDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		System.out.println("ChongzhiServlet中,paypsw = "
//				+ request.getParameter("payPsw") + 
//				"\n会员id = "+request.getParameter("userId") 
//				+ "\n身份 = " +request.getParameter("userIdentity") + 
//				"\n总计 = " +request.getParameter("totalMoney") + "\nrequestCode = " + request.getParameter("reqcode")); 
				try {
					List<Customer> customers = (List<Customer>)userDao.query(request.getParameter("userIdentity"), Integer.parseInt(request.getParameter("userId")), 0);
					Customer customer = null;
					for (Customer cus : customers) {
						customer = cus;
					}
					String paypsw = customer.getPayPsw();
					double balance = customer.getBalance();
					
//					System.out.println("，read from customer.payPsw = " + paypsw
//							+"\nbalance = " + balance);
					
					if (paypsw.equals(new String(request.getParameter("payPsw")))) {
						
						if(userDao.editCustomerBalance(Integer.parseInt(request.getParameter("userId")),
								Double.parseDouble(request.getParameter("totalMoney")),0) == 1){
							
							RequestDispatcher rd = request.getRequestDispatcher( "../PaySuccess.jsp" );
							rd.forward( request, response);
						}
						else if (userDao.editCustomerBalance(Integer.parseInt(request.getParameter("userId")),
								Double.parseDouble(request.getParameter("totalMoney")),0) == -1) {
							request.setAttribute("payPsw",request.getParameter("payPsw"));
							request.setAttribute("totalMoney",request.getParameter("totalMoney"));
//							request.setAttribute("GenealViewOrSpecificView", new Integer(6));
							
							RequestDispatcher rd = request.getRequestDispatcher( "../Chongzhi.jsp" );
							rd.forward( request, response);
						}
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
