<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ReadAlterCustomer.jsp' starting page</title>
    
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
<form name="AlterDMessage" method="post" action="servlet/ReadAlterCustomer" onsubmit="return checkAlter(AlterDMessage);">
<table border="0" align="center" width="40%">
<caption><font size="5" color="black">个人信息</font></caption>
<tr>
<td >账号：</td>
<td ><input type="text" name="ID" size="19" ><label id="C1"></label>
</td>
</tr>

<tr>
<td >姓名：</td>
<td ><input type="text" name="Name" size="19"><label id="C2"></label>
</td>
</tr>

<tr>
<td width="116" height="45">密码：</td>
<td width="289" height="45"><input type="text" name="Psw" size="19">
<label id="A3"></label>
</td>
</tr>

<tr>
<td width="116" height="45">电话：</td>
<td width="50" height="45"><input type="text" name="Phone" size="19">
<label id="C4" color="red"></label>
</td>
</tr>



<tr>
<td width="116" height="45">地址：</td>
<td width="289" height="45"><input type="text" name="address" size="19"><label id="C7"></label></td>
</tr>
<tr height="40px">
					<td colspan="2" align="center">
						<input type="submit" name="submit" value="确定修改" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" name="reset" value="恢复" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</table>
</form>
  </body>
</html>
