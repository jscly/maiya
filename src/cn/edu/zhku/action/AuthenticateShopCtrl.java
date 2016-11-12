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
import cn.edu.zhku.model.ShopInfo;
import cn.edu.zhku.model.User;
import cn.edu.zhku.service.OperatorManagementService;

public class AuthenticateShopCtrl extends HttpServlet {

	OperatorManagementService operatorManagementService = new OperatorManagementService();
	
	UserDao userDao = new UserDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		/servlet/AuthenticateShopCtrl?requestCode=AuthenticateShop,请求查看为完成认证的所有店铺
		if (request.getParameter("requestCode") != null) {
			if (request.getParameter("requestCode").equals(new String("AuthenticateShop"))) {
				
				List<ShopInfo> allInvalidShops = null;
				try {
					allInvalidShops = userDao.QueryAllInvalidShops();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				request.setAttribute("invalidshops",allInvalidShops);
				request.setAttribute("GenealViewOrSpecificView", new Integer(6));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		System.out.println("request.getParameter(\"requestCode\") = " + request.getParameter("requestCode") + " opid = " + request.getParameter("operatorIdToAuthShop") + " opiden = " + request.getParameter("operatorIdtenToAuthShop"));
		if (request.getParameter("requestCode") != null) {
			if (Integer.parseInt(request.getParameter("requestCode")) == 61) {
				
//			参数：operatorIdToAuthShop，operatorIdtenToAuthShop
				String operatorIdToAuthShop = (String)request.getParameter("operatorIdToAuthShop");
				String operatorIdtenToAuthShop = (String)request.getParameter("operatorIdtenToAuthShop");
				try {
					//待认证的店铺认证成功
					if(operatorManagementService.AuthenticateShopCtrl(operatorIdToAuthShop,operatorIdtenToAuthShop)){
						request.setAttribute("GenealViewOrSpecificView", new Integer(62));
						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
						rd.forward( request, response);

					}
					//无可认证的店铺
					else {
						request.setAttribute("GenealViewOrSpecificView", new Integer(63));
						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
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
	
