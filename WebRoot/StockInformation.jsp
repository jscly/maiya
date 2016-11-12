<%@ page language="java" import="java.util.*,cn.edu.zhku.control.goodsControl,java.sql.ResultSet" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
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
					<li class="active">库存信息</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
   <table border="1" width="800" align="center">
   	<tr align="center">
   	<td>商品编号</td>
   	<td>名称</td>
   	<td>类别</td>
   	<td>进货量</td>
   	<td>销量</td>
   	<td>库存</td>
   	<td>价格</td>
   	<td>介绍</td>
   	<td>颜色</td>
   	<td>款式</td>
   	<td>规格说明</td>
   	<td>评价</td>
   	</tr>
<%
goodsControl allSelect=new goodsControl();

ResultSet rs = allSelect.getAll();

 while(rs.next()) { 
 %>  <tr>
     <td><%=rs.getInt(1) %></td>
     <td><%=rs.getString(2) %></td>
     <td><%=rs.getString(3) %></td>
     <td><%=rs.getInt(4) %></td>
     <td><%=rs.getInt(5) %></td>
     <td><%=rs.getInt(6) %></td>
     <td><%=rs.getDouble(7) %></td>
     <td><%=rs.getString(8) %></td>
     <td><%=rs.getString(9) %></td>
     <td><%=rs.getString(10) %></td>
     <td><%=rs.getString(11) %></td>
     <td><%=rs.getString(12) %></td>
     </tr> 
  <% } %>


   </table>
  </body>
</html>
