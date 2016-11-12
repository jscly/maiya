<%@page import="cn.edu.zhku.service.CartService"%>
<%@page import="cn.edu.zhku.model.Order"%>
<%@page import="cn.edu.zhku.service.OperatorManagementService"%>
<%@page import="cn.edu.zhku.model.Customer"%>
<%@page import="cn.edu.zhku.dao.UserDao"%>
<%@ page language="java" import="java.util.*,cn.edu.zhku.model.Operator,cn.edu.zhku.model.ShopInfo" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>买家首页</title>
    
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

function handle(){
		document.f1.ctrl.value = "dianwo";
}
</script>			
</head>
<body> 

<!-- <form action="" name="f1">
<input type="text" value="" name = "ctrl" id="ctrl"/>
</form -->


	<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
					
		<%!UserDao userDao = new UserDao(); %>
		<%
if(session.getAttribute("userIdentity").equals(new String("operator"))){
 %>
	  <div class="clearfix"></div>
						</div>
					</div>
					<div class="col-md-6 top-header-left">
						<div class="cart box_1">
							 <img alt="" src="./images/logo.png" height="50px">
							
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
			<a href="index.jsp"><h1>买呀</h1></a>
		</div>
	<!--start-logo-->
 	<div class="tab1"><a href ="login.jsp?identity=customer" >请以会员身份登录</a></div>
 	<%
 }else if(session.getAttribute("userIdentity") == null && session.getAttribute("userId") == null){
 
 %>
  <div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						 <img alt="" src="./images/logo.png" height="50px">
						
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
		<a href="index.jsp"><h1>买呀</h1></a>
	</div>
	<!--start-logo-->
 <div class="ckeckout container ckeck-top heading">
		<a href ="login.jsp?identity=customer" >
			<h2>请先登录！</h2>
		</a>
	</div>
 <% 
 }
 
 else{
 	
  if(request.getAttribute("userIdentity") != null && request.getAttribute("userId")!= null 
  		&& request.getAttribute("userName")!= null){
  
	  session.setAttribute("userIdentity",request.getAttribute("identity"));
	  session.setAttribute("userId",request.getAttribute("userId"));
	  session.setAttribute("userName",request.getAttribute("userName"));
  } 
  
  if(session.getAttribute("userIdentity") != null && session.getAttribute("userName") != null){
	  if(session.getAttribute("userIdentity").equals(new String("customer"))){
	 	 		out.print("<div class = 'whi'><div class = ''>欢迎您！" + session.getAttribute("userIdentity") + "&nbsp;&nbsp;" + session.getAttribute("userName") + "</div><div class = ''><a href='logout.jsp' target='_self'>退出</a></div></div>");
	  }
  }
  else if(session.getAttribute("userIdentity") != null && session.getAttribute("userName") != null){
  		out.print("<div class = 'box1'><a href='login.jsp?identity=customer' target='_self'>登录</a></div><div class = 'box1'><a href='register.jsp?identity=customer' target='_self'>注册</a></div><div class = 'box1'><a href='login.jsp?identity=seller' target='_self'>商家中心</a></div><div class = 'box1'><a href='register.jsp?identity=seller' target='_self'>商家入驻</a></div><div class = 'box1'><a href='login.jsp?identity=operator' target='_self'>运营商登录</a></div>");
  }
   
  
  %>
  <div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						 <img alt="" src="./images/logo.png" height="50px">
						
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
		<a href="index.jsp"><h1>买呀</h1></a>
	</div>
	<!--start-logo-->
	
    
  	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="index.jsp">主页</a></li>
						<li class="grid"><a href="CartNew.jsp?customerId=<%=session.getAttribute("userId")%>">购物车</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>
										<a href="CartNew.jsp?customerId=<%=session.getAttribute("userId")%>">管理购物车</a>
										</h4>
									</div>
									
								</div>
							</div>
						</li>
						
						
						
						<li class="grid"><a href="CustomerOrderNew.jsp?customerId=<%=session.getAttribute("userId")%>">订单</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>
										<a href="CustomerOrderNew.jsp?customerId=<%=session.getAttribute("userId")%>">管理订单</a>
										</h4>
										
									</div>
									
								</div>
							</div>
						</li>
						<li class="grid"><a href="myMessage.jsp?customerId=<%=session.getAttribute("userId")%>">个人信息</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
									
										<%
										int id = (Integer)session.getAttribute("userId");
										 %>
										<h4>
										
										<a href="myMessage.jsp?customerId=<%=session.getAttribute("userId")%>">查询个人信息</a>
										</h4>
										
									</div>
										
									<div class="col1 me-one">
										<h4>
										<a href="AlterCustomer.jsp?customerId=<%=session.getAttribute("userId")%>">修改个人信息</a>
										</h4>
											
									</div>
									
								</div>
							</div>
						</li>
						<li class="grid"><a href="Chongzhi.jsp">充值余额</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>
										<a href="Chongzhi.jsp">充值余额</a>
										</h4>
									</div>
										
									
								</div>
							</div>
						</li>
						
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
   
    <%
    
    } %>
    
    
    
  </body>
</html>
