package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisteredControl extends HttpServlet {

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

//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out
//				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the POST method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
		
//		RegisterService registerservise = new RegisterService();
		
		String identity = request.getParameter("identity");
		String name = request.getParameter("name");
//		String identity = request.getParameter("identity");
		
		if(identity.equals("customer")){
			request.setAttribute("userIdentity", identity);
			request.setAttribute("userName", name);
			RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageCustomer.jsp" );
			rd.forward( request, response);
		
		}
		else if(identity.equals("seller")){
			request.setAttribute("userIdentity", identity);
			request.setAttribute("userName", name);
			RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
			rd.forward( request, response);
			
			
		}
		
	}

}
