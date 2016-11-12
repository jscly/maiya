<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品上架</title>
    
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<!--Custom Theme files-->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Luxury Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>	
<!--start-menu-->
<script src="js/simpleCart.min.js"> </script>
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>	
<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>			
</head>
<body> 
<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
						
						
						<div class="clearfix"></div>
					</div>
				</div>
				
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--start-logo-->
	<div class="logo">
		<a href="index.jsp"><img alt="" src="images/logo.png" class="" height="50px">
		</a>
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	<!--banner-starts-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="PersonalHomePageOperator.jsp" target="_self">个人主页</a></li>
					<li class="active">商品上架</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
     <script type="text/javascript" src="check_Goods_Message.js"></script>
     
     <%
     if(request.getAttribute("success") != null 
     	&& request.getAttribute("success").equals(new String("true"))){
     
     %>
     	<div class="tab1">商品上架成功！</div>
     <%
     
     }
     else{
      %>
<form name="AddGoods" method="post" action="./servlet/AddGoodsInfo" onsubmit="return check(AddGoods);">
<table border="0" align="center" width="60%">
<tr>
<td >商品编号：</td>
<td ><input type="text" name="goodsID" size="40" id="goodsid"><label id="A1"></label>
</td>
</tr>

<tr>
<td >商品名称：</td>
<td ><input type="text" name="goodsName" size="40"><label id="A2"></label>
</td>
</tr>
<tr>
<td >商品类别：</td>
<td ><input type="text" name="goodsClass" size="40"><label id="A2"></label>
</td>
</tr>

<tr>
<td width="116" height="45">进货量：</td>
<td width="50" height="45"><input type="text" name="goodsIN" size="40">
<label id="A4" color="red"></label>
</td>
</tr>
<tr>
<td width="116" height="45">商品价格：</td>
<td width="289" height="45"><input type="text" name="goodsPrice" size="40">
<label id="A3"></label>
</td>
</tr>
<tr>
<td width="116" height="45">介绍：</td>
<td width="289" height="45"><textarea name="intro" cols="50" rows="10"></textarea><label id="A7"></label></td>
</tr>


<tr>
<td width="116" height="45">颜色：</td>
<td width="289" height="45"><input type="text" name="color" size="40"><label id="A7"></label></td>
</tr>
<tr>
<tr>
<td width="116" height="45">款式：</td>
<td width="289" height="45"><input type="text" name="style" size="40"><label id="A7"></label></td>
</tr>
<tr>
<td width="116" height="45">规格说明：</td>
<td width="289" height="45"><input type="text" name="speci" size="40"><label id="A7"></label></td>
</tr>
<tr>
<td width="116" height="45">图片：</td>
<td width="289" height="45"><input type="text" name="pic" size="40"><label id="A7"></label></td>
</tr>
<tr height="40px">
					<td colspan="2" align="center">
						<input type="submit" name="submit" value="确定" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" name="reset" value="重置" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</table>
</form>

<%} %>
</body>
</html>
