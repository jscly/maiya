<%@ page language="java" import="java.util.*,cn.edu.zhku.model.*" pageEncoding="gb2312"%>
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
	<!--start-logo-->
	<div class="logo">
		<a href="index.jsp"><img alt="" src="images/logo.png" class="" height="60px">
	</div>
	<!--top-header-->
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
	
   
   <table border="1">
	   <tr>
		  	<td>商品编号</td>
		   	<td>名称</td>
		   	<td>类别</td>
		   	<td>销量</td>
		   	<td>库存</td>
		   	<td>价格</td>
		   	<td>介绍</td>
		   	<td>颜色</td>
		   	<td>款式</td>
		   	<td>规格说明</td>
	   	</tr>
   <%
   if(session.getAttribute("goodsList") != null){
   		List<Goods> goodsList = (List<Goods>)session.getAttribute("goodsList");
   		for(Goods goods:goodsList){
   		%>
   		<tr>
   			<td><a href ="single.jsp?productId=<%=goods.getId() %>"><%=goods.getId() %></a></td>
   			<td><a href ="single.jsp?productId=<%=goods.getId() %>"><%=goods.getName() %></a></td>
   			<td><%=goods.getSort() %></td>
   			<td><%=goods.getSalesvolume() %></td>
   			<td><%=goods.getKucun() %></td>
   			<td><%=goods.getPrice() %></td>
   			<td><%=goods.getIntroduce() %></td>
   			<td><%=goods.getColor() %></td>
   			<td><%=goods.getStyle() %></td>
   			<td><%=goods.getSpecification() %></td>
   		
   		</tr>
   		
   		
   		
    
   	<%
   }
   }
   	 %>
   </table>
  </body>
</html>
