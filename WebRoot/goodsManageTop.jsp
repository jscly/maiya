<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsManageTop.jsp' starting page</title>
    
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
    <a href="StockInformation.jsp" target = "downRightDown1">库存信息</a>&nbsp;
     <a href="AddGoods.jsp" target = "downRightDown1">添加商品</a>&nbsp;
     <a href="DeleteGoods.jsp" target = "downRightDown1">下架商品</a>&nbsp;
     <a href="AlterGoods.jsp" target = "downRightDown1">修改商品信息</a>
       <a href="salesInformation.jsp" target = "downRightDown1">报表</a>
  </body>
</html>
