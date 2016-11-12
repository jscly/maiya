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
import cn.edu.zhku.service.ChongzhiService;

public class ChongzhiDaoZhanghu extends HttpServlet {

	ChongzhiService chongzhiService = new ChongzhiService();
	UserDao userDao = new UserDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		System.out.println("Chongzhi到账户Servlet中,支付密码 = "
//				+ request.getParameter("payPsw") + 
//				"\n会员id = "+request.getParameter("userId") 
//				+ "\n身份 = " +request.getParameter("userIdentity") + 
//				"\n总计 = " +request.getParameter("totalMoney") +
//				"\n充值的金额 = " + request.getParameter("money")+
//				"\n 当前订单id(用于充值成功后继续支付) = " + request.getParameter("orderId")); 
		
		
			//会员在个人主页充值		
		
		String customerId =  request.getParameter("userId");
		String customerIdentity =  request.getParameter("userIdentity");
		List<Customer> customers = null;
		try {
			customers = (List<Customer>) userDao.query(customerIdentity, Integer.parseInt(customerId), 0);
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Customer customer = null;
		
		for (Customer cus : customers) {
			customer = cus;
		}
		System.out.println("jieshoudaodemm" + request.getParameter("payPsw"));
		System.out.println("paypsw = " + customer.getPayPsw());
		if(request.getParameter("payPsw") != null && customer.getPayPsw().equals(request.getParameter("payPsw"))){
			
			
			
		
			if(request.getParameter("position") != null &&
				request.getParameter("position").equals("personalHomePage")){
					String money =  request.getParameter("money");
					System.out.println("customerId = " + customerId + " money = " + money);
					//id、金额
					try {
						if(chongzhiService.chongzhiBalance(Integer.parseInt(customerId), Double.parseDouble(money))){
							
							request.setAttribute("position","personalHomePage");
							
							RequestDispatcher rd = request.getRequestDispatcher( "../ChongzhiSuccessFromHomePage.jsp" );
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
			else{
				try {
					if(chongzhiService.chongzhiBalance(Integer.parseInt(request.getParameter("userId")),
							Double.parseDouble(request.getParameter("money")))){
								
						request.setAttribute("orderId",request.getParameter("orderId"));
						request.setAttribute("totalMoney",request.getParameter("totalMoney"));
						request.setAttribute("delCart","true");
						
						RequestDispatcher rd = request.getRequestDispatcher( "../chongzhiSuccess.jsp" );
						rd.forward( request, response);
					} else
						try {
							if (!chongzhiService.chongzhiBalance(Integer.parseInt(request.getParameter("userId")),
									Double.parseDouble(request.getParameter("totalMoney")))) {
//					request.setAttribute("payPsw",request.getParameter("payPsw"));
//					request.setAttribute("totalMoney",request.getParameter("totalMoney"));
//					request.setAttribute("GenealViewOrSpecificView", new Integer(6));
										
								RequestDispatcher rd = request.getRequestDispatcher( "../ChongzhiFail.jsp" );
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
		else{
			
			System.out.println("支付密码错误");
		}
	}
}
