package cn.edu.zhku.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Operator;
import cn.edu.zhku.service.OperatorManagementService;

public class OperatorManSelf extends HttpServlet {

	UserDao userDao = new UserDao();
	OperatorManagementService operatorManagementService = new OperatorManagementService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("requestCode") != null) {
			if (request.getParameter("requestCode").equals(new String("qs"))) {
				request.setAttribute("GenealViewOrSpecificView", new Integer(10));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
//			同步会员信息到operator表。
//			./servlet/Synchronize?requestCode=operatorAndCustomer
			else if (request.getParameter("requestCode").equals(new String("es"))) {
				request.setAttribute("GenealViewOrSpecificView", new Integer(11));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
			//管理订单
			else if (request.getParameter("requestCode").equals(new String("121"))) {
				request.setAttribute("GenealViewOrSpecificView", new Integer(121));
				System.out.println("获取");
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		if (request.getParameter("reqcode") != null) {
			
			//运营商查询自己信息
			if (Integer.parseInt(request.getParameter("reqcode")) == 101) {
//				参数：,
				String id = (String)request.getParameter("id");
				String iden = (String)request.getParameter("iden");
				System.out.println(id+iden);
//					if(operatorManagementService.Synchronize(operatorIdToSynShop,operatorIdtenToSynShop,1)){

//				userDao.query(iden, id, 0);
						try {
							System.out.println("1");
							request.setAttribute("info", (List<Operator>)userDao.query(iden, Integer.parseInt(id), 0));
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
						request.setAttribute("GenealViewOrSpecificView", new Integer(102));
						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
						rd.forward( request, response);
			}
			
			//运营商修改自己信息
			else if (Integer.parseInt(request.getParameter("reqcode")) == 111) {
//				参数：operatorIdToSynCus,operatorIdtenToSynCus
				
				String id = (String)request.getParameter("id");
				String iden = (String)request.getParameter("iden");
				String rq = (String)request.getParameter("reqcode");
				
				String name = (String)request.getParameter("name");
				String psw = (String)request.getParameter("psw");
				String authpsw = (String)request.getParameter("authpsw");
				String cus = (String)request.getParameter("cus");
				
				Operator operator = new Operator();
				operator.setOperatorId(Integer.parseInt(id));
				operator.setOperatorName(name);
				operator.setOperatorPsw(psw);
				operator.setOperatingAuthorityPsw(authpsw);
				operator.setThirdPartyPayment("");
				operator.setFinancialStatementId(Integer.parseInt("0"));
				operator.setSellers("");
				operator.setShops("");
				operator.setCustomers(cus);
						try {
							if(operatorManagementService.edit(operator,2)){

								request.setAttribute("GenealViewOrSpecificView", new Integer(112));
								RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
								rd.forward( request, response);
							}
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
		}
		
	}
}
}

