package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.enterprise.inject.New;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import javax.servlet.http.HttpSession;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Customer;
import cn.edu.zhku.model.Operator;
import cn.edu.zhku.model.Seller;
import cn.edu.zhku.service.LoginService;

public class LoginControl extends HttpServlet {


	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
//	
		
		//会员之前是在购物车界面，现在返回
		if (request.getParameter("ago").equals(new String("cart"))
				&&request.getParameter("identity").equals(new String("customer"))) {
			UserDao userdao = new UserDao();
			//查询到单一记录
			List<?> users = null;
			try {
				users = userdao.query(request.getParameter("identity"), Integer.parseInt(request.getParameter("id")), 0);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			for (Object object : users) {
				
				request.setAttribute("productId",request.getParameter("productId"));
				//用于读取cart表里面会员id对应的购物车详情（即把商品加入购物车后的用例）；
				request.setAttribute("readDB","true");
				request.setAttribute("identity",request.getParameter("identity"));
				request.setAttribute("userIdentity",request.getParameter("identity"));
				//获取会员id
				request.setAttribute("id",((Customer)object).getId());
				request.setAttribute("userId",((Customer)object).getId());
				request.setAttribute("userName",((Customer)object).getName());
//				System.out.println("商品id、会员id分别为 = " + request.getParameter("productId")+"  " +((Customer)object).getId());
				RequestDispatcher rd = request.getRequestDispatcher( "../single.jsp" );
				rd.forward( request, response);
				return;
			}
		}
		
		LoginService lgs = new LoginService();
		String userIdentity = request.getParameter("identity");
		String userId = request.getParameter("id");
		int userID = Integer.parseInt(userId);
		String userPsw = request.getParameter("psw");
		
//		String requestCode = request.getParameter("requestCode");
//		System.out.println("requestCode = "+requestCode);
		try {
			if(lgs.isValidUser(userIdentity,userId,userPsw)){
				UserDao userdao = new UserDao();
				//查询到单一记录
				List<?> users = userdao.query(userIdentity, userID, 0);
//				if (users != null) {
//					out.print("<script>if(confirm('确定要删除？')){}else{}</script>");
//				}
				for (Object object : users) {
					if (userIdentity.equals(new String("customer"))) {
						HttpSession session=request.getSession(true);
						session.setAttribute("userIdentity", userIdentity);
						session.setAttribute("userId", ((Customer)object).getId());
						session.setAttribute("userName", ((Customer)object).getName());
						
						request.setAttribute("identity",userIdentity);
						
						request.setAttribute("userIdentity",userIdentity);
						request.setAttribute("userId", ((Customer)object).getId());
						request.setAttribute("userName",((Customer)object).getName());
						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageCustomer.jsp" );
						
						System.out.println("登录信息 = " + request.getAttribute("identity") + " " +request.getAttribute("userId") + " " +request.getAttribute("userName"));
						rd.forward( request, response);
					}
					
					else if (userIdentity.equals(new String("operator"))) {
						HttpSession session=request.getSession(true);
						session.setAttribute("userIdentity", userIdentity);
						session.setAttribute("userId", ((Operator)object).getOperatorId());
						session.setAttribute("userName", ((Operator)object).getOperatorName());
						
						request.setAttribute("identity",userIdentity);
						
						request.setAttribute("userIdentity",userIdentity);
						request.setAttribute("userId", ((Operator)object).getOperatorId());
						request.setAttribute("userName",((Operator)object).getOperatorName());
						
						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
						rd.forward( request, response);
					}
					//已删除
					else if (userIdentity.equals(new String("seller"))) {
//						out.print("success!");
//						out.print("operator-test!");
						request.setAttribute("userName",((Seller)object).getName());
						request.setAttribute("userId", ((Seller)object).getId());
					}
//					else if (requestCode.equals(new String("displayShops"))) {
//						System.out.println("displayShops");
//					}
				}
				
			}else if(lgs.isValidUser(userIdentity,userId,userPsw)==false){
//				request.setAttribute("userIdentity", userIdentity);
				
				response.sendRedirect("../out.jsp");
			}
//			out.flush();
//			out.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

//	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
//			   throws ServletException, IOException {
////			  doPost(req,resp);
////		requestCode=displayShops
//		String aString = req.getParameter("requestCode");
//		System.out.println("doget =" + aString);
//		
////		req.setAttribute("identity",userIdentity);
////		request.setAttribute("userId", new String(String.valueOf(userId)));
////		request.setAttribute("userName",((Operator)object).getOperatorName());
//		
//		req.setAttribute("reqCode",aString);
//		
//		System.out.println("这里成功-doget");
//		RequestDispatcher rdi = req.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
////		RequestDispatcher rdispp = request.getRequestDispatcher( "../Head.jsp" );
//		rdi.forward( req, resp);
//	}
//	

}
