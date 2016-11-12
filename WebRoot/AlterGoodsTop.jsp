<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AlterGoodsTop.jsp' starting page</title>
    
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
   <script type="text/javascript" src="check_Goods_Message.js"></script>
   <form name="AlterGoodsFirst" method="post" action="servlet/AlterGoodsMessage" onsubmit="return checkGoodsID(AlterGoodsContern);">
<table border="0" align="center">
<tr>
<td >商品编号：</td>
<td ><input type="text" name="goodsID" size="19" ><label id="A1"></label></td>

</tr>

<tr align="center">
<td colspan="2"><input type="submit" name="alterSubmit" value="确定" /></td>
</tr>

</table>
</form>
  </body>
</html>
