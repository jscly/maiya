package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.service.OperatorManagementService;

public class Synchronize extends HttpServlet {

	OperatorManagementService operatorManagementService = new OperatorManagementService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		//		./servlet/Synchronize?requestCode=operatorAndShop
		//		处理这个请求：./servlet/Synchronize?requestCode=operatorAndShop
		if (request.getParameter("requestCode") != null) {
			if (request.getParameter("requestCode").equals(new String("operatorAndShop"))) {
				request.setAttribute("GenealViewOrSpecificView", new Integer(5));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
//			同步会员信息到operator表。
//			./servlet/Synchronize?requestCode=operatorAndCustomer
			else if (request.getParameter("requestCode").equals(new String("operatorAndCustomer"))) {
				request.setAttribute("GenealViewOrSpecificView", new Integer(9));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
		}
		
		
		
		
	}

	/**运营商同步店铺ids
	 * 运营商同步会员ids
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("GenealViewOrSpecificView") != null) {
			
			//运营商同步店铺ids
			if (Integer.parseInt(request.getParameter("GenealViewOrSpecificView")) == 51) {
//				参数：operatorIdToSynShop,operatorIdtenToSynShop
				String operatorIdToSynShop = (String)request.getParameter("operatorIdToSynShop");
				String operatorIdtenToSynShop = (String)request.getParameter("operatorIdtenToSynShop");
				try {
					if(operatorManagementService.Synchronize(operatorIdToSynShop,operatorIdtenToSynShop,1)){

						request.setAttribute("GenealViewOrSpecificView", new Integer(52));
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
			
			//运营商同步会员ids
			else if (Integer.parseInt(request.getParameter("GenealViewOrSpecificView")) == 91) {
//				参数：operatorIdToSynCus,operatorIdtenToSynCus
				String operatorIdToSynShop = (String)request.getParameter("operatorIdToSynCus");
				String operatorIdtenToSynShop = (String)request.getParameter("operatorIdtenToSynCus");
					try {
						if(operatorManagementService.Synchronize(operatorIdToSynShop,operatorIdtenToSynShop,2)){

							request.setAttribute("GenealViewOrSpecificView", new Integer(52));
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
