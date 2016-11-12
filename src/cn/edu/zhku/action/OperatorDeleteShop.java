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

public class OperatorDeleteShop extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		运营商通过id删除店铺信息的界面 - 步骤1
//		./servlet/OperatorDeleteShop?requestCode=byId
		String reqCode = null;
		if (request.getParameter("requestCode") != null) {
			
			reqCode = request.getParameter("requestCode");
		}
		
//		request.setAttribute("GenealViewOrSpecificView", new Integer(3));
//		request.setAttribute("shopCurrentId_deleteShop", shopCurrentId_deleteShop);
		if (reqCode.equals("byId")) {
			request.setAttribute("GenealViewOrSpecificView", new Integer(4));
			RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
			rd.forward( request, response);
		}
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OperatorManagementService operatorManagementService = new OperatorManagementService();
		
		String operatorid =null;
		if(request.getParameter("operatorIdForDeleteShops") != null){
			
			operatorid = request.getParameter("operatorIdForDeleteShops");
		}
		
		
		String userIdentity = request.getParameter("userIdentity");
		
		String shopCurrentId_deleteShop = request.getParameter("shopCurrentId_deleteShop");
		
//		运营商输入的权限密码
		String operatingAuthorityPsw = request.getParameter("operatingAuthorityPsw");
		int GenealViewOrSpecificView = -2;
		if((request.getParameter("GenealViewOrSpecificView") != null)){
			GenealViewOrSpecificView = Integer.parseInt(request.getParameter("GenealViewOrSpecificView"));
		}
		
		
		
//		运营商通过id删除店铺信息的界面 - 步骤1
//		运营商输入店铺id删除店铺
//		参数
//		operatorIdToDelShop
//		operatorIdtenToDelShop
		
		if (GenealViewOrSpecificView == 41) {
			if (request.getParameter("operatorIdToDelShop") != null && request.getParameter("operatorIdtenToDelShop") != null && request.getParameter("shopid") != null) {

				userIdentity = request.getParameter("operatorIdtenToDelShop");
				shopCurrentId_deleteShop = request.getParameter("shopid");
				operatorid = request.getParameter("operatorIdToDelShop");
				
				System.out.println("id 、身份 、要删除的店铺id：" + request.getParameter("operatorIdToDelShop") + "   " + request.getParameter("operatorIdtenToDelShop") + "   " + request.getParameter("shopid"));			}
			
				try {
					boolean flag_deleteShopInfoInShopTable = operatorManagementService.OperatorDeleteOthersInfo(userIdentity, shopCurrentId_deleteShop,operatorid,1);
					
					if (flag_deleteShopInfoInShopTable) {
						request.setAttribute("GenealViewOrSpecificView", new Integer(31));
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
		
		//早运营商主页，运营商输入权限密码，删除店铺信息
		else if(GenealViewOrSpecificView == 3){
			if(operatingAuthorityPsw != null){
				System.out.println("在opdeshop里面，身份：" + userIdentity + "  当前店铺id:" +shopCurrentId_deleteShop +"   权限密码："+operatingAuthorityPsw + "  请求码（3？）：" + GenealViewOrSpecificView);
				try {
					boolean flag_deleteShopInfoInShopTable = operatorManagementService.OperatorDeleteOthersInfo(userIdentity, shopCurrentId_deleteShop,operatorid,1);
					/*删除数据库中相关关联的记录，待完善->已完善*/
					//验证权限密码
	//				boolean flag_authPsw = operatorManagementService.OperatorDeleteOthersInfo(identity, CurrentId, operatorid, requsetCode)
					if (flag_deleteShopInfoInShopTable) {
						request.setAttribute("GenealViewOrSpecificView", new Integer(31));
						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
						rd.forward( request, response);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			}
			
			
		}
		/*运营商在店铺详情下--》删除--》跳到输入权限密码界面*/
		else if(request.getParameter("GenealViewOrSpecificView") == null){
			
			
		
		
			
			request.setAttribute("userIdentity", userIdentity);
			request.setAttribute("GenealViewOrSpecificView", new Integer(3));
			request.setAttribute("shopCurrentId_deleteShop", shopCurrentId_deleteShop);
			
			RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
			rd.forward( request, response);
		}
			
			
			
	}

}
