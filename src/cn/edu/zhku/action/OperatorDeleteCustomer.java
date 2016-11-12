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

public class OperatorDeleteCustomer extends HttpServlet {

	OperatorManagementService operatorManagementService = new OperatorManagementService();
	//显示删除会员界面
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		./servlet/OperatorDeleteCustomer?requestCode=byId
		
		if (request.getParameter("requestCode") != null) {
			if (request.getParameter("requestCode").equals(new String("byId"))) {
				request.setAttribute("GenealViewOrSpecificView", new Integer(8));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
		}
	}

	//运营商输入会员id，删除之
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		OperatorManagementService operatorManagementService = new OperatorManagementService();
		
		//参数：
//		身份：operatorIdtenToDelCus，
//		运营商id:operatorIdToDelCus，
//		会员id:cusid
//		权限密码：authpsw，
//		请求码：GenealViewOrSpecificView
		
		//身份
		String opidentity = null;
		if (request.getParameter("operatorIdtenToDelCus") != null) {
			opidentity = request.getParameter("operatorIdtenToDelCus");
		}
		
		//id
		String operatorid =null;
		if(request.getParameter("operatorIdToDelCus") != null){
			
			operatorid = request.getParameter("operatorIdToDelCus");
		}
		
		//会员id
		String cusid = null;
		if (request.getParameter("cusid") != null) {
			
			cusid = request.getParameter("cusid");
		}
		
		
		//运营商输入的权限密码
		String operatingAuthorityPsw = null;
		if (request.getParameter("authpsw") != null) {
			operatingAuthorityPsw = request.getParameter("authpsw");
			
		}
		
		//获得请求码
		int GenealViewOrSpecificView = -2;
		if((request.getParameter("GenealViewOrSpecificView") != null)){
			GenealViewOrSpecificView = Integer.parseInt(request.getParameter("GenealViewOrSpecificView"));
		}
		
//		运营商通过id删除cus信息的界面 - 步骤1
//		运营商输入cus-id删除店铺
//		参数
		
//		if (GenealViewOrSpecificView == -3) {
//			if (request.getParameter("operatorIdToDelCus") != null && request.getParameter("operatorIdtenToDelCus") != null && request.getParameter("cusid") != null) {
//					boolean flag = false;
//					try {
//						flag = operatorManagementService.OperatorDeleteOthersInfo(opidentity, cusid,operatorid,2);
//					} catch (NumberFormatException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (ClassNotFoundException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (SQLException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//					
//					if (flag) {
//						request.setAttribute("GenealViewOrSpecificView", new Integer(-3));
//						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
//						rd.forward( request, response);
//					}
//			}		
//		}
		/*运营商在店铺详情下--》删除--》跳到输入权限密码界面*/
		
		if (GenealViewOrSpecificView == 81) {
			
					//验证运营商的支付密码
					boolean authpsw = false;
					try {
						authpsw = operatorManagementService.QueryAuthorityPsw(operatingAuthorityPsw, opidentity, Integer.parseInt(operatorid), 0);
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
					if (authpsw) {
						boolean customersInfolList =  false;
						try {
							customersInfolList = operatorManagementService.OperatorDeleteOthersInfo(opidentity, cusid, operatorid,2);
							if (customersInfolList) {
								request.setAttribute("GenealViewOrSpecificView", new Integer(82));
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
