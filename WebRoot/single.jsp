<%@page import="cn.edu.zhku.model.Goods,cn.edu.zhku.service.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>物品详情</title>
	

	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
	<script src="js/jquery-1.11.0.min.js"></script>
	<!--Custom-Theme-files-->
	<!--theme-style-->
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--start-menu-->
<script src="js/simpleCart.min.js"> </script>
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>	
<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>
<script type="text/javascript">

function loginFuncton(){
		alert("value");
}
</script>			
</head>
<body> 
	<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
		
<%
if(request.getAttribute("userIdentity") != null 
	&& request.getAttribute("userName") != null
 	&& request.getAttribute("id") != null){
		session.setAttribute("userIdentity",request.getAttribute("userIdentity"));
		session.setAttribute("userId",request.getAttribute("id"));
		session.setAttribute("userName",request.getAttribute("userName"));

}
  String userIdentity = (String)session.getAttribute("userIdentity");
  String userName = (String)session.getAttribute("userName");
  if(userIdentity != null && userName != null){
	  if(userIdentity.equals(new String("customer"))){
	  %>
	 	 		<div class = ''>
	 	 			<div class = 'whi'>欢迎您！<%=userIdentity %>&nbsp;&nbsp;<%=userName %>&nbsp;&nbsp;<a href='PersonalHomePageCustomer.jsp' target='_self'>个人中心</a>&nbsp;&nbsp;
	 	 			</div>
	 	 		<div class = ''>
	 	 			<a href='logout.jsp' target='_self'>
	 	 				退出
	 	 			</a>
	 	 		</div>
	 	 	
	 <% 	
	  }
  }
  else if(userIdentity == null && userName == null){
  
  %> 	
  		<div class = 'box1'>
  			<a href='login.jsp?identity=customer' target='_self'>
  				登录
  			</a>
  		</div>
  		<div class = 'box1'>
  			<a href='register.jsp?identity=customer' target='_self'>
  				注册
  			</a>
  		</div>
  		<div class = 'box1'>
  			<a href='login.jsp?identity=operator' target='_self'>
  				运营商登录
  			</a>
  		</div>
  <% 
  }
  
  %>
  </div>
  
						
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
					
					<!-- 要传参数? -->
					
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
						<li class="grid"><a href="#">鼠标</a>
						</li>
						<li class="grid"><a href="#">键盘</a>
						</li>
						<li class="grid"><a href="#">显示器</a>
						</li>
						<li class="grid"><a href="typo.html">游戏手柄</a>
						</li>
						<li class="grid"><a href="typo.html">内存</a>
						</li>
						<li class="grid"><a href="typo.html">主板</a>
						</li>
						<li class="grid"><a href="typo.html">硬盘</a>
						</li>
						<li class="grid"><a href="typo.html">显卡</a>
						</li>
						<li class="grid"><a href="typo.html">机箱</a>
						</li>
						<li class="grid"><a href="typo.html">其他</a>
						</li>
						<li class="grid"><a href="contact.html">CPU</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				<div class="search-bar">
					<input type="text" value="搜索" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
					<input type="submit" value="">
				</div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	
	<!--start-single-->
	<div class="single contact">
		<div class="container">
			<div class="single-main">
				<div class="col-md-9 single-main-left">
				<div class="sngl-top">
					<div class="col-md-5 single-top-left">	
						<div class="flexslider">
							  <ul class="slides">
							  <%
							  	int productId = -1;
							  	if(request.getParameter("productId") != null){
							  	
							  		productId = Integer.parseInt(request.getParameter("productId"));
							  	}
							  
							  	
								VisitHomeService visitHomeService = new VisitHomeService();
									
								Goods good = visitHomeService.visitGoods(productId);
								
								
								
						 		%>
						 		
						 		
								<li data-thumb="<%=good.getPicturepath() %>">
									<div class="thumb-image"> <img src="<%=good.getPicturepath() %>" data-imagezoom="true" class="img-responsive" alt=""/> </div>
								</li>
								
							  </ul>
						</div>	  
						<!-- FlexSlider -->
						<script src="js/imagezoom.js"></script>
						<script defer src="js/jquery.flexslider.js"></script>
						<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

						<script>
						// Can also be used with $(document).ready()
						$(window).load(function() {
						  $('.flexslider').flexslider({
							animation: "slide",
							controlNav: "thumbnails"
						  });
						});
						</script>
					</div>	
					<div class="col-md-7 single-top-right">
						<div class="single-para simpleCart_shelfItem">
						<h2><%=good.getName() %></h2>
							
							
							<h5 class="price">￥<%=good.getPrice() %></h5>
							<p class = "title"><%=good.getIntroduce() %></p>
							<div class="available">
								<ul>
								<% String colors = good.getColor();
								%>
								<li>颜色
										<select name="color">
										<option><%=colors %></option></select></li>
										
									
									<% String styles = good.getStyle();
								%>
								<li>款式
								<select name="style">
									<option><%=styles %></option>
								</select>
								</li>
								<li>数量
								<select name="style">
									<option>1</option>
								</select>
								</li>
								
									
								<div class="clearfix"> </div>
							</ul>
						</div>
						<!-- 如果会员登录了，则直接把商品增加到购物车；否则，转到登录页面，成功登录后在装回此页面 -->
						<%
						if(session.getAttribute("userIdentity") != null){
						
							if(session.getAttribute("userIdentity").equals(new String("customer"))){
							
								
						 %>
								<a href="CartNew.jsp?productId=<%=good.getId() %>&productName=<%=good.getName() %>&productNum=1&productPrice=<%=good.getPrice() %>&productPicPath=<%=good.getPicturepath() %>&request=addToCart" class="add-cart item_add">加入购物车</a>
							<%
								}
							}
							else{
							 %>	
								<a href="CartNew.jsp?productId=<%=good.getId() %>&productName=<%=good.getName() %>&productNum=1&productPrice=<%=good.getPrice() %>&productPicPath=<%=good.getPicturepath() %>" class="add-cart item_add">加入购物车</a>
								
								<%
								}
								 %>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="tabs">
					<ul class="menu_drop">
				<li class="item1"><a href="#"><img src="images/arrow.png" alt="">介绍</a>
					<ul>
						<li class="subitem1"><a href="#"><%=good.getIntroduce() %></a></li>
					</ul>
				</li>
				<li class="item2"><a href="#"><img src="images/arrow.png" alt="">规格参数</a>
					<ul>
					    <li class="subitem2"><a href="#"><%=good.getSpecification() %></a></li>
					</ul>
				</li>
				<li class="item3"><a href="#"><img src="images/arrow.png" alt="">评价</a>
					<ul>
						<li class="subitem1"><a href="#"><%=good.getEvaluation() %></a></li>
					</ul>
				</li>
	 		</ul>
				</div>
				
				<!-- 表单实现用户选择那些款式、颜色、数量 -->
				
				
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-single-->
	<!--information-starts-->
	<div class="tabBetweenDiv"> </div>
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
						<li><a href="contact.html"><p>关于我们</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>我的账户</h3>
					<ul>
						<li><a href="account.html"><p>我的账户</p></a></li>
						<li><a href=""><p>退/换货</p></a></li>
						<li><a href=""><p>个人信息</p></a></li>
						<li><a href=""><p>收货地址</p></a></li>
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
	
  </body>
</html>
