<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
					<li><a href="index.jsp" target="_self">主页</a></li>
					<li class="active">登录</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--register-starts-->
	<div class="register">
		<div class="container">
			<div class="register-top heading">
				<h3>登录</h3>
			</div>
			<div class="register-main">
				<div class=""></div>
				<div class="">
					<form name="login" method="post" action="./servlet/LoginControl" onsubmit="return check(login);">
						<table border="0" align="center">
							
							<tr height="40px">
								<td width="600px">
									<input type="text" name="id" placeHolder="ID"
										title="请输入ID！" size="40" class="col-md-6 account-left tabforinput"/>
									&nbsp;&nbsp;&nbsp;
									<label id="show_ID_msg" class="style_msg"></label>
								</td>
							</tr>
			
							<tr height="40px">
								<td>
									<input type="password" name="psw" placeHolder="密码"
										title="请输入密码！" size="40" class="col-md-6 account-left tabforinput"/>
									&nbsp;&nbsp;&nbsp;
									<label id="show_psw_msg" class="style_msg"></label>
								</td>
							</tr>
							
							<tr height="40px">
								<td colspan="2" align="center">
									<input type="submit" name="submit" value="登录" class="btn tabforbutton" />
									
									<input type="button" name="back" value="主页" class="btn tabforbutton" onclick="location.href='index.jsp';"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<%
									if(request.getParameter("identity").equals(new String("customer"))){
									 %>
									<a href="customerAdd.jsp?identity=<%=request.getParameter("identity") %>" >注册新账号</a>
									<%
									}
									 %>
									</td>
							</tr>
							
							<tr height="40px">
								<td>
									<input type="text" name="identity"  class="hide" size = "40" value=<%=request.getParameter("identity") %>></input>
								</td>
								<td>
									<input type="text" name="ago"  class="hide" size = "40" value=<%=request.getParameter("ago") %>></input>
								</td>
									
								<td>
									<input type="text" name="productId"  class="hide" size = "40" value=<%=request.getParameter("productId") %>></input>
								</td>
							</tr>
						</table>
		</form>
				</div>
				
				<div class="clearfix"></div>
			</div>
			
		</div>
	</div>
	<!--register-end-->
	<div class="tabBetweenDiv"></div>
	<!--information-starts-->
	<div class="information">
		<div class="container">
			<div class="infor-top">
				<div class="col-md-3 infor-left">
					<h3>服务</h3>
					<ul>
						<li><a href=""><span class=""></span><h6>email</h6></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>信息</h3>
					<ul>
						<li><a href=""><p>关于我们</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>友情链接</h3>
					<ul>
						<li><a href=""><p>京东</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>网站信息</h3>
					<h4>公司,
						<span>买呀,</span>
						海珠区.</h4>
					<h5>+86 12345678911</h5>	
					<p><a href="mailto:contactus@maiya.com">contactus@maiya.com</a></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--information-end-->
	<!--footer-starts-->
	<div class="footer">
		<div class="container">
			<div class="footer-top">
				<div class="col-md-6 footer-left">
					<form>
						<input type="text" name="email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入email';}">
						<input type="submit" value="反馈">
					</form>
				</div>
				<div class="col-md-6 footer-right">					
					<p>Copyright &copy; 2016.maiya All rights reserved.<a target="_blank" href=""></a></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-end-->	
</body>
</html>