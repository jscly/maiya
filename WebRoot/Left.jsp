<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>shopDown-left</title>
    
	

  </head>
  
  <body background = "yellow">
<ul>
    <li ><a href = "myInformation.jsp" target = "right">我的信息</a></li>
    <li ><a href = "salesInformation.jsp" target = "right">销售信息</a></li>
    <li ><a href = "orderControl.jsp" target = "right">订单管理</a></li>
    <li ><a href = "goodsControl.jsp" target = "right">商品管理</a></li>
    
</ul>
  </body>
</html>
