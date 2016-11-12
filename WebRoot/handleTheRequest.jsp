<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'handleTheRequest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <!-- session.setAttribute("userIdentity",request.getAttribute("userIdentity"));
  session.setAttribute("userId",request.getAttribute("userId"));
  session.setAttribute("userName",request.getAttribute("userid")); -->
   
  <!-- session.setAttribute("userIdentity",request.getAttribute("identity"));
  session.setAttribute("userId",request.getAttribute("userId"));
  session.setAttribute("userName",request.getAttribute("userName")); -->
    <%
    String userIdentity = (String)session.getAttribute("userIdentity");
    String userId = (String)session.getAttribute("userId");
    String userName = (String)session.getAttribute("userName");
    
    
    
    
    
    
    
    
    
    
    
    
    
   /*  handleTheRequest.jsp?requestCode=displayShops */
    /* String requestCode = request.getParameter("requestCode"); */
    
    
    String reqCode = request.getParameter("reqCode"); 
    
    out.print("身份 id 姓名" + userIdentity + userId + userName + "    " + reqCode );
    
    
     if(userIdentity !=null && userId != null && userName != null && reqCode != null){
    	if(userIdentity.equals(new String("operator")) && reqCode.equals(new String("displayShops"))){
    		session.setAttribute("personalhomePageOperatorRequestCode", new String("displayShops"));
    		out.print("if语句里面：" + reqCode);
    	}
    } 
    
     %>
     <%-- <jsp:forward page="PersonalHomePageOperator.jsp"/> --%>
<%=request.getParameter("reqCode") %>
  </body>
</html>
