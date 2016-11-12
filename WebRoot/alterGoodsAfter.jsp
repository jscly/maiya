<%@ page language="java" import="java.util.*,cn.edu.zhku.entity.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'alterGoodsAfter.jsp' starting page</title>
    
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
    <jsp:useBean id="servletShop" class="cn.edu.zhku.entity.Goods" scope="session"/>
  
<table border="0" align="center" width="55%">
<caption><font size="5" color="black">商品修改成功</font></caption>
<tr>
<td >商品编号：</td>
<td ><label id="A1"><jsp:getProperty name="servletShop" property="goodsID"/></label>
</td>
</tr>

<tr>
<td >商品名称：</td>
<td ><label id="A2"><jsp:getProperty name="servletShop" property="goodsName"/></label>
</td>
</tr>

<tr>
<td width="116" height="45">商品价格：</td>
<td width="289" height="45">
<label id="A3"><jsp:getProperty name="servletShop" property="goodsPrice"/></label></input>
</td>
</tr>

<tr>
<td width="116" height="45">库存：</td>
<td width="50" height="45">
<label id="A4"><jsp:getProperty name="servletShop" property="goodsLess"/></label>
</td>
</tr>

<tr>
<td width="116" height="45">备注：</td>
<td width="289" height="45"><textarea name="beizhu" cols="50" rows="10"><jsp:getProperty name="servletShop" property="beizhu"/></textarea></td>
</tr>
<tr>
<td></td>
<td><a href="AlterGoodsTop.jsp"><input type="button" value="继续修改商品"/></a></td>
</table>
</form>
  </body>
</html>
