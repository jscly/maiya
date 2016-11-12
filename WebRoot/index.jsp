<%@page import="cn.edu.zhku.service.VisitHomeService"%>
<%@page import="cn.edu.zhku.dao.UserDao,cn.edu.zhku.model.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页</title>
	

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
  String userIdentity = (String)session.getAttribute("userIdentity");
  String userName = (String)session.getAttribute("userName");
  if(userIdentity != null && userName != null){
	  if(userIdentity.equals(new String("customer"))){
	 	 		out.print("<div class = 'whi'><div class = ''>欢迎您！" + userIdentity + "&nbsp;&nbsp;" + userName + "&nbsp;&nbsp;<a href='PersonalHomePageCustomer.jsp' target='_self'>个人中心</a>&nbsp;&nbsp;<a href='logout.jsp' target='_self'>退出</a></div></div>");
	  }
	  else if(userIdentity.equals(new String("operator"))){
	 	 		out.print("<div class = 'welcome whi'>欢迎您！" + userIdentity + "&nbsp;&nbsp;" + userName + "&nbsp;&nbsp;<a href='PersonalHomePageOperator.jsp' target='_self'>个人中心</a>&nbsp;&nbsp;<a href='logout.jsp' target='_self'>退出</a></div>");
	  
	  }
  }
  else if(userIdentity == null && userName ==null){
  		out.print("<div class = 'box1 whi'><a href='login.jsp?identity=customer' target='_self'>登录</a></div><div class = 'box1'><a href='customerAdd.jsp?identity=customer' target='_self'>注册</a></div><div class = 'box1'><a href='login.jsp?identity=operator' target='_self'>运营商登录</a></div>");
  }
  
   %>
						
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						<a href="PersonalHomePageCustomer.jsp">
							 <div class="total">
								<span></span></div>
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
		<a href="index.jsp"><img alt="" src="images/logo.png" class="" height="60px">
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="index.jsp">主页</a></li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=sb">鼠标</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=jp">键盘</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=xsq">显示器</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=yxsb">游戏手柄</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=nc">内存</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=zb">主板</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=yp">硬盘</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=xk">显卡</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=jx">机箱</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=cpu">CPU</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				<div class="search-bar">
				<form action="./servlet/SearchGoods" method="post">
					<input type="text" value="搜索" onfocus="this.value = '';"name ="search"  onblur="if (this.value == '') {this.value = '搜索';} ">
					<input type="submit" value="">
				</form>
				</div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	<!--banner-starts-->
	<div class="bnr" id="home">
		<div  id="top" class="callbacks_container">
			<ul class="rslides" id="slider4">
			    <li>
					<div class="banner">
					</div>
				</li>
				<li>
					<div class="banner1">
					</div>
				</li>
				<li>
					<div class="banner2">
					</div>
				</li>
			</ul>
		</div>
		<div class="clearfix"> </div>
	</div>
	<!--banner-ends--> 
	<!--Slider-Starts-Here-->
				<script src="js/responsiveslides.min.js"></script>
			 <script>
			    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 4
			      $("#slider4").responsiveSlides({
			        auto: true,
			        pager: true,
			        nav: true,
			        speed: 500,
			        namespace: "callbacks",
			        before: function () {
			          $('.events').append("<li>before event fired.</li>");
			        },
			        after: function () {
			          $('.events').append("<li>after event fired.</li>");
			        }
			      });
			
			    });
			  </script>
			<!--End-slider-script-->
	<!--about-starts-->
	<div class="about"> 
	<%
	
	VisitHomeService visitHomeService = new VisitHomeService();
	
	List<Goods> goodsList = visitHomeService.visitSingle();
	
	 %>
	 <table>
	 
	 <tr>
	 	<td>
			<table>
				<tr>
				<%
				for(int j = 0;j < 3;j++){
				 %>
					<td>
						<table class="tab1" border="0">
							<tr>
								<td colspan="2"><a href ="single.jsp?productId=<%=goodsList.get(j).getId() %>"><img src = "<%=goodsList.get(j).getPicturepath()%>" width="300px" height="300px"/></a></td>
							</tr>
							<tr>
								<td colspan="2" class = ""><a href ="single.jsp?productId=<%=goodsList.get(j).getId() %>"><%=goodsList.get(j).getName() %></a></td>
							</tr>
							<tr>
								<td colspan="2" class =""><a href ="single.jsp?productId=<%=goodsList.get(j).getId() %>"><%=goodsList.get(j).getIntroduce()%></a></td>
							</tr>
							<tr>
								<td><input type="text" class="hide"></td>
								<td><input type="text" class="hide"></td>
							</tr>
						</table>
					</td>
					
					
				<%
				} 
				%>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
	 	<td>
			<table>
				<tr>
				<%
				for(int j = 0;j < 3;j++){
				 %>
					<td>
						<table class="tab1" border="0">
							<tr>
								<td colspan="2"><a href ="single.jsp?productId=<%=goodsList.get(j+3).getId() %>"><img src = "<%=goodsList.get(j+3).getPicturepath()%>" width="330px" height="300px"/></a></td>
							</tr>
							<tr>
								<td colspan="2" class = ""><a href ="single.jsp?productId=<%=goodsList.get(j+3).getId() %>"><%=goodsList.get(j+3).getName() %></a></td>
							</tr>
							<tr>
								<td colspan="2" class =""><a href ="single.jsp?productId=<%=goodsList.get(j+3).getId() %>"><%=goodsList.get(j+3).getIntroduce()%></a></td>
							</tr>
							<tr>
								<td><input type="text" class="hide"></td>
								<td><input type="text" class="hide"></td>
							</tr>
						</table>
					</td>
					
					
				<%
				} 
				%>
				</tr>
			</table>
			</td>
		</tr>
		
		
		
		</table>
	</div>
	<!--product-end-->
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