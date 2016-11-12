<%@page import="java.util.jar.Attributes.Name"%>
<%@ page language="java" import="java.util.*,cn.edu.zhku.service.*,cn.edu.zhku.model.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>购物车</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<!--Custom-Theme-files-->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content=""> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
	
	<!-- 标志是否进行添加至并刷新购物车操作，或是删除购物车后刷新操作（需要重返本页面） -->
	
	
						
	<%
  	 String userIdentity = (String)session.getAttribute("userIdentity");
  	 String userName = (String)session.getAttribute("userName");
  	 String userId = "" +session.getAttribute("userId");
  	 if(userIdentity == null && userName == null){
  	 	userIdentity = (String) request.getAttribute("userIdentity");
  	 	userName = (String)request.getAttribute("userName");
  	 }
  	 
 	 if(userIdentity != null && userName != null){
	   if(userIdentity.equals(new String("customer"))){
	   %>
			 	 		<div class = ''>
			 	 			<div class = ''>
			 	 				欢迎您！<%=userIdentity%>&nbsp;&nbsp;<%=userName%>
			 	 			</div>
			 	 		<div class = ''>
			 	 			<a href='logout.jsp' target='_self'>
			 	 				退出
			 	 			</a>
			 	 		</div>
	<%
	}
	   
	  else if(userIdentity.equals(new String("operator"))){
	 %>
			 	 		<div class = 'welcome'>
			 	 			欢迎您！" + userIdentity + "&nbsp;&nbsp;&nbsp;" + userName + "&nbsp;&nbsp;&nbsp;
			 	 			注意：您不能在此买东西！<a href='PersonalHomePageOperator.jsp' target='_self'>
			 	 				千往个人主页
			 	 			</a>
			 	 			&nbsp;&nbsp;&nbsp;
			 	 			<a href='logout.jsp' target='_self'>
			 	 				退出
			 	 			</a>
			 	 		</div>
	  <% 
	  }
  	}
  	%>
  	</div>
  	
						
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						<a href="checkout.jsp">
							 <div class="total">
								<span>￥0.00</span></div>
								<img src="images/cart-1.png" alt="" />
							
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">购物车</a></p>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--start-logo-->
	
	<!-- 加logo -->
	<div class="logo">
		<a href="index.jsp"><img alt="" src="images/logo.png" class="">
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="index.jsp">主页</a></li>
						<li class="grid"><a href="">鼠标</a>
						</li>
						<li class="grid"><a href="">键盘</a>
						</li>
						<li class="grid"><a href="">显示器</a>
						</li>
						<li class="grid"><a href="">游戏手柄</a>
						</li>
						<li class="grid"><a href="">内存</a>
						</li>
						<li class="grid"><a href="">主板</a>
						</li>
						<li class="grid"><a href="">硬盘</a>
						</li>
						<li class="grid"><a href="">显卡</a>
						</li>
						<li class="grid"><a href="">机箱</a>
						</li>
						<li class="grid"><a href="">CPU</a>
						</li>
						<li class="grid"><a href="">其他</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				<div class="search-bar">
				
				<!-- 加链接？ -->
					<input type="text" value="搜索" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
					<input type="submit" value="">
				</div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="index.jsp">主页</a></li>
					<li class="active">购物车</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--start-ckeckout-->
	
	<%
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productNum = request.getParameter("productNum");
		String productPicPath = request.getParameter("productPicPath");
						
	%>
	
	<% if(userIdentity == null && userName ==null){
		
	%>
	<div class="ckeckout container ckeck-top heading">
		<a href ="login.jsp?productId=<%=productId %>&ago=cart&identity=customer" >
			<h2>请先登录！</h2>
		</a>
	</div>
	
	
	
	
	<%
	}
	
	else if(userIdentity != null && userName !=null){
	 %>
	
	<%
			/*从single页面（商品下午页面）添加进购物车，所以来到此页面  */
		if(request.getParameter("request") != null){
			
 				/* session.setAttribute("isBan", "true"); */
 				
				String Request = request.getParameter("request");
					
				if(Request.equals(new String("addToCart"))){
					CartService cartService = new CartService();
					
					Cart cart = new Cart();
					
					cart.setIdOfCustomer((Integer)session.getAttribute("userId"));
					cart.setIdOfGoods(Integer.parseInt(productId));
					cart.setNumOfGoods(1);
					cart.setTotalMoney(Double.parseDouble(productPrice));
					
					if(cartService.addToCart(cart)){
								
						/*为了防止刷新页面会错误插入数据进入cart表  */
					%>
						<script>window.alert("添加商品成功！");</script>
					<%
							
					}
			}
		}
	%>
		
	<div class="ckeckout">
		<div class="container">
			<div class="ckeck-top heading">
				<h2>购物车</h2>
			</div>
			<div class="ckeckout-top">
			<div class="cart-items">
				
			   
			   <div class="in-check" >
			   <table border="2">
					<tr>
						<td>订单号</td>
						<td>顾客id</td>
						<td>商品id</td>
						<td>单价</td>
						<td>数量</td>
						<td>总计</td>
						<td>运送详情</td>
						<td>删除订单</td>
						<td>结算</td>
					</tr>
				
				<!-- 读数据库的Cart表中关于当前会员id的数据 -->
				
					
				<%
				
				if((session.getAttribute("userIdentity") != null) 
					&& session.getAttribute("userIdentity").equals(new String("customer"))){
						CartService cartService = new CartService();
					/* 会员登录到个人主页查看购物车详情 */	
					if(session.getAttribute("userId") != null && session.getAttribute("userName") != null){
						
						List<Cart> carts = cartService.readCart((Integer)session.getAttribute("userId"));
							
							for(Cart cart:carts){
							
					%>
					
								<tr>
										<td><%=cart.getIdOfCart() %></td>
										<td><%=cart.getIdOfCustomer()%></td>
										<td><%=cart.getIdOfGoods() %></td>
										<td><%=(int)(cart.getTotalMoney()/cart.getNumOfGoods()) %></td>
										<td><%=cart.getNumOfGoods() %></td>
										<td><%=cart.getTotalMoney() %></td>
										<td>免邮&nbsp;&nbsp;4-5天内送达</td>
										<td>
											<a href="./servlet/CustomerDelCart?customerIdentity=<%=userIdentity%>&
												customerId=<%=cart.getIdOfCustomer() %>&idOfCart=<%=cart.getIdOfCart()%>&userName=<%=userName%>">
												删除
											</a>
										</td>
										<td>
										
											<a href="CustomerOrder.jsp?idOfCart=<%=cart.getIdOfCart() %>
												&idofgoods=<%=cart.getIdOfGoods() %>&numofgoods=<%=cart.getNumOfGoods() %>
												&totalmoney=<%=cart.getTotalMoney() %>
												&customerId=<%=cart.getIdOfCustomer() %>">
												下订单
											</a>
										</td>
									</tr>
					
					<% 
						}
					}
						
				 %>
					<div class="clearfix"> </div>
				</ul>
				
				
			</div>
			</div>  
		 </div>
		</div>
	</div>
	
	
	
	
	<%} 
	
	}%>
  </body>
</html>
