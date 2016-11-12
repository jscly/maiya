package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.enterprise.inject.New;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Operator;
import cn.edu.zhku.model.ShopInfo;
import cn.edu.zhku.service.OperatorManagementService;

public class OperatorQueryShopsInfoDetails extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		PrintWriter out = response.getWriter();
//		shopId-->用于查询当前物品详情，如在运营商主页->查询店铺->显示三个店铺->点击其中一个店铺->查看店铺详情
		String shopId = request.getParameter("shopId");
		
//		”上一个“店铺信息
//		shopCurrentId_forlast
//		operatorId_forlast
		String shopCurrentId_forlast = request.getParameter("shopCurrentId_forlast");
		String operatorId_forlast = request.getParameter("operatorId_forlast");
		
		//"下一个"店铺信息
		String shopCurrentId = request.getParameter("shopCurrentId");
		String operatorId = request.getParameter("operatorId");
		
//		operatorId_queryTheLeft，显示运营商主页已显示的三个店铺id字符串（用分号分隔）,用来得出其他（即"更多店铺信息"的id,不包括已显示的3个店铺的id）
		String operatorId_queryTheLeft = request.getParameter("operatorId_queryTheLeft");
		System.out.println("\"查询更多店铺信息\"按钮中，传到本Servle中的运营商id:" + operatorId_queryTheLeft);
		
//		idsInshopInfos_queryTheLeft，用于查询更多店铺详情，如在运营商主页->查询店铺->显示三个店铺->旁边就可以点击"查看更多店铺详细信息"
		String idsInshopInfos_queryTheLeft = request.getParameter("idsInshopInfos_queryTheLeft");
		
		int shopID = 0;
		if (shopCurrentId != null) {
			
			shopID = Integer.parseInt(shopCurrentId);
		}
		
		OperatorManagementService operatorManagementService = new OperatorManagementService();
		
		//查询当前物品详情
		try {
			//显示所请求的店铺信息
			if(shopId !=null){
				
				ShopInfo shopInfo = operatorManagementService.QueryShopsInfoDetails(Integer.parseInt(shopId));
				
				request.setAttribute("shopInfoDetails", shopInfo);
				request.setAttribute("GenealViewOrSpecificView", new Integer(1));
				
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
			//显示下一个店铺信息
			else if(shopCurrentId != null){
				
			    
				ShopInfo shopInfo = operatorManagementService.QueryNextShopInfoDetails(Integer.parseInt(operatorId),shopID);
				if(shopInfo != null){
					
					request.setAttribute("shopInfoDetails", shopInfo);
				}else if(shopInfo == null){
					
					request.setAttribute("shopInfoDetails", null);
				}
				request.setAttribute("GenealViewOrSpecificView", new Integer(2));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
				
			}
			//显示上一个店铺信息
			else if (shopCurrentId_forlast != null) {
				ShopInfo shopInfo = operatorManagementService.QueryLastShopInfoDetails(Integer.parseInt(operatorId_forlast),Integer.parseInt(shopCurrentId_forlast));
				if(shopInfo != null){
					
					request.setAttribute("shopInfoDetails", shopInfo);
				}else if(shopInfo == null){
					
					request.setAttribute("shopInfoDetails", null);
				}
				request.setAttribute("GenealViewOrSpecificView", new Integer(2));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
			//查询更多店铺
			else if (operatorId_queryTheLeft != null) {
				System.out.println("查询更多店铺操作中，参数：运营商id(operatorId_queryTheLeft)：" + operatorId_queryTheLeft + "\n"
						+"已经显示在运营商首页上的店铺id(idsInshopInfos_queryTheLeft)："+ idsInshopInfos_queryTheLeft);
				List<ShopInfo> theRemainingshopIds = operatorManagementService.QueryTheRemainingShopInfoDetails(Integer.parseInt(operatorId_queryTheLeft), idsInshopInfos_queryTheLeft);
				request.setAttribute("theRemainingshopIds", theRemainingshopIds);
				request.setAttribute("GenealViewOrSpecificView", new Integer(2));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
