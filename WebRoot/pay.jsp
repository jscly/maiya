<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>处理订单</title>
    
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
					<li class="active">处理订单</li>
				</ol>
			</div>
		</div>
	</div>
  <%!int reqcode = -1; %>
  	<%
  	if(request.getParameter("idoforder") != null && request.getParameter("requestCode") != null){
  	
	  	
	  	String idoforder = request.getParameter("idoforder");
	  	String requestCode = request.getParameter("requestCode");
	  	String identity = (String)session.getAttribute("userIdentity");
	  	
	  	
	  	reqcode = Integer.parseInt(requestCode);
	  
	  	/* reqcode == 1 : 处理等待买家付款的操作，查看详情，不用发送到servlet */
	  	
	  	if(reqcode == 2){
	  	%>
	  		<form action="./servlet/HandleOrder" method="post" onclick="">
		  		<table>
		  			
		  			<tr>
		  				<td colspan="2" align="center">确定发货？</td>
		  			</tr>
		  			<tr class="hide">
		  				<td>参数-请求码</td>
		  				<td><input type="text" value="2" name="requestCode"/></td>
		  			</tr>
		  			<tr class="hide">
		  				<td>订单号</td>
		  				<td><input type="text" value=<%=idoforder %> name="orderId"/></td>
		  			</tr>
		  			<tr>
		  				<td><input type="submit" value="确定"/></td><td><input type="button" value="取消" onclick="javascript:history.back(-1);"/></td>
		  			</tr>
		  		</table>
	  		</form>
	  	
	  	
	  	<% 
	  	}
	  	else if(reqcode == 4){
	  	%>
	  		<form action="./servlet/HandleOrder" method="post" onclick="">
		  		<table>
		  			
		  			<tr>
		  				<td colspan="2" align="center">确认关闭交易？</td>
		  			</tr>
		  			<tr class="hide">
		  				<td>参数-请求码</td>
		  				<td><input type="text" value="4" name="requestCode"/></td>
		  			</tr>
		  			<tr class="hide">
		  				<td>运营商id</td>
		  				<td><input type="text" value=<%=session.getAttribute("userId") %> name="operatorId"/></td>
		  			</tr>
		  			<tr class="hide">
		  				<td>订单号</td>
		  				<td><input type="text" value=<%=idoforder %> name="orderId"/></td>
		  			</tr>
		  			<tr>
		  				<td><input type="submit" value="确定"/></td><td><input type="button" value="取消" onclick="javascript:history.back(-1);"/></td>
		  			</tr>
		  		</table>
	  		</form>
	  	
	  	
	  	<% 
	  	}
	  	else if(reqcode == 5){
	  	%>
	  		<form action="./servlet/HandleOrder" method="post" onclick="">
		  		<table>
		  			
		  			<tr class="hide">
		  				<td>参数-请求码</td>
		  				<td><input type="text" value="5" name="requestCode"/></td>
		  			</tr>
		  			<tr class="hide">
		  				<td>运营商id</td>
		  				<td><input type="text" value=<%=session.getAttribute("userId") %> name="operatorId"/></td>
		  			</tr>
		  			<tr class="hide">
		  				<td>订单号</td>
		  				<td><input type="text" value=<%=idoforder %> name="orderId"/></td>
		  			</tr>
		  			<tr>
		  				<td>请选择操作：</td>
		  				<td>
		  					<select name="caozuo" class="">
		  					<%
		  					if(request.getParameter("caozuo") != null){
		  						if(request.getParameter("caozuo").equals("tuihuo")){
		  					
			  					 %>
									<option value="tuihuo">同意退货</option>
									
								<%
								}
								else if(request.getParameter("caozuo").equals("huanhuo")){
								
								 %>
									<option value="huanhuo">同意换货</option>
									
								<%
								} 
							}
							%>
							</select>
		  				</td>
		  			</tr>
		  			<tr>
		  				<td><input type="submit" value="确定"/></td><td><input type="button" value="取消" onclick="javascript:history.back(-1);"/></td>
		  			</tr>
		  		</table>
	  		</form>
	  	
	  	
	  	<% 
	  	}
  	}
  	 %>
  	 
  	 <% 
  	 /* 从HandleOrder接收到的参数 */
  	 	if(request.getAttribute("requestCode") != null){
	  		reqcode = (Integer)request.getAttribute("requestCode");
  	 		if(reqcode == 21){
	  		%>
	  			<div class="tab1">商品已发货</div>
	  	
  	 		<% 
	  		}
	  		else if(reqcode == 41){
	  		%>
	  			<div class="tab1">交易成功，关闭交易</div>
	  	
  	 		<% 
	  		}
	  		else if(reqcode == 51){
	  		%>
	  			<div class="tab1">已同意退货</div>
	  	
  	 		<% 
	  		}
	  		else if(reqcode == 52){
	  		%>
	  			<div class="tab1">退货失败！运营商余额不足！</div>
	  	
  	 		<% 
	  		}
	  		else if(reqcode == 53){
	  		%>
	  			<div class="tab1">换货成功！！</div>
	  	
  	 		<% 
	  		}
	  	}
	  	%>
  </body>
</html>
