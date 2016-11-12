<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editMessage.jsp' starting page</title>
    
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
<form >
<table border="0" align="center" width="45%">
<tr>
<td >会员名：</td>
<td ><input type="text" name="userID" size="19" style="color: White; "><label id="E1"></label>
</td>
</tr>

<tr>
<td >店铺名称：</td>
<td ><input type="text" name="shopID" size="19"><label id="E2"></label>
</td>
</tr>

<tr>
<td width="116" height="45">注册日期：</td>
<td width="289" height="45"><input type="text" name="birthday" size="19">
<label id="E3"></label></input>
</td>
</tr>

<tr>
<td width="116" height="45">地区：</td>
<td width="50" height="45"><input type="text" name="address" size="19">
<label id="E4"></label>
</td>
</tr>

<tr>
<td width="116" height="45">邮箱：</td>
<td width="289" height="45"><input type="text" name="youxiang" size="19"/>
<label id="E5"></label></td>
</tr>

<tr>
<td width="116" height="45">电话：</td>
<td width="289" height="45"><input type="text" name="phone" size="19"/>
<label id="E6"></label></td>
</tr>

<tr>
<td width="116" height="45">备注：</td>
<td width="289" height="45"><textarea name="beizhu" cols="50" rows="10"></textarea><label id="E7"></label></td>
</tr>


</table>
</form>
</body>

</html>
