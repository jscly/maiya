<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
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
		<a href="index.jsp"><h1>买呀</h1></a>
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="index.jsp">主页</a></li>
						<li class="grid"><a href="#">鼠标</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>		
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="#">键盘</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="#">显示器</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="typo.html">游戏手柄</a>
						<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="typo.html">内存</a>
						<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="typo.html">主板</a>
						<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="typo.html">硬盘</a>
						<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="typo.html">显卡</a>
						<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="typo.html">机箱</a>
						<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="typo.html">其他</a>
						<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="contact.html">CPU</a>
						<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>店铺</h4>
										<ul>
											<li><a href="products.html">店铺1</a></li>
											<li><a href="">店铺2</a></li>
											<li><a href="">店铺3</a></li>
											<li><a href="">店铺4</a></li>
											<li><a href="">店铺5</a></li>
											<li><a href="">店铺6</a></li>
											<li><a href="">店铺7</a></li>
											<li><a href="">店铺8</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>类型</h4>
										<ul>
											<li><a href="products.html">类型1</a></li>
											<li><a href="">类型2</a></li>
											<li><a href="">类型3</a></li>
											<li><a href="">类型4</a></li>
											<li><a href="">类型5</a></li>
											<li><a href="">类型6</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.html">品牌1</a></li>
											<li><a href="">品牌2</a></li>
											<li><a href="">品牌3</a></li>
											<li><a href="">品牌4</a></li>
											<li><a href="">品牌5</a></li>
											<li><a href="">品牌6</a></li>
											<li><a href="">品牌7</a></li>
											<li><a href="">品牌8</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				<div class="search-bar">
					<input type="text" value="搜索" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '搜索';}">
					<input type="submit" value="">
				</div>
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
					<li class="active">注册</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--register-starts-->
	<div class="register">
		<div class="container">
			<div class="register-top heading">
				<h3>注册</h3>
			</div>
			<div class="register-main">
				<div class=""></div>
				<div class="">
					<form name="login" method="post" action="./servlet/addCustomer" onsubmit="return check(login);">
						<table border="0" align="center">
							
							<tr height="40px">
								<td width="600px">
									<input type="text" name="customerName" placeHolder="用户名" size="40" class="col-md-6 account-left tabforinput"/>
									&nbsp;&nbsp;&nbsp;
									<label id="show_name_msg" class="style_msg"></label>
								</td>
							</tr>
			
							<tr height="40px">
								<td>
									<input type="password" name="customerPsw" placeHolder="密码" size="40" class="col-md-6 account-left tabforinput"/>
									&nbsp;&nbsp;&nbsp;
									<label id="show_psw_msg" class="style_msg"></label>
								</td>
							</tr>
							
							<tr height="40px">
								<td>
									<input type="password" name="confirmPsw" placeHolder="确认密码" size="40" class="col-md-6 account-left tabforinput"/>
									&nbsp;&nbsp;&nbsp;
									<label id="show_confirmPsw_msg" class="style_msg"></label>
								</td>
							</tr>
							
							<tr height="40px">
								<td>
									<input type="text" name="phone" placeHolder="手机号码" size="40" class="col-md-6 account-left tabforinput"/>
									&nbsp;&nbsp;&nbsp;
									<label id="show_phone_msg" class="style_msg"></label>
								</td>
							</tr>
							
							<tr height="40px">
								<td>
									<input type="submit" name="submit" value="确定" class="btn tabforbutton" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" name="reset" value="重置" class="btn" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" name="cancel" value="返回" class="btn" onclick=""/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
							</tr>
							<tr height="40px">
									<td>
									<input type="text" name="identity" class="" value=<%=request.getParameter("identity") %> size="40"></input>
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
	<!--information-starts-->
	<div class="information">
		<div class="container">
			<div class="infor-top">
				<div class="col-md-3 infor-left">
					<h3>服务</h3>
					<ul>
						<li><a href="#"><span class=""></span><h6>微信</h6></a></li>
						<li><a href="#"><span class=""></span><h6>qq</h6></a></li>
						<li><a href="#"><span class=""></span><h6>email</h6></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>信息</h3>
					<ul>
						<li><a href="#"><p>新产品</p></a></li>
						<li><a href="#"><p>我们的店铺</p></a></li>
						<li><a href="contact.html"><p>联系我们</p></a></li>
						<li><a href="#"><p>待完善-超级会员</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>我的账户</h3>
					<ul>
						<li><a href="account.html"><p>我的账户</p></a></li>
						<li><a href="#"><p>待完善-第三方支付</p></a></li>
						<li><a href="#"><p>退/换货</p></a></li>
						<li><a href="#"><p>个人信息</p></a></li>
						<li><a href="#"><p>收货地址</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>网站信息</h3>
					<h4>公司,
						<span>买呀,</span>
						海珠区.</h4>
					<h5>+86 12345678911</h5>	
					<p><a href="mailto:example@email.com">contactus@maiya.com</a></p>
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
						<input type="submit" value="提交">
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