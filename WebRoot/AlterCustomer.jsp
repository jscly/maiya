<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>充值页面</title>
    
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
<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
					 
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
			 	 		<div class = 'whi'>
			 	 			<div class = ''>
			 	 				欢迎您！<%=userIdentity%>&nbsp;&nbsp;<%=userName%>
			 	 			</div>
			 	 		<div class = 'whi'>
			 	 			<a href='logout.jsp' target='_self'>
			 	 				退出
			 	 			</a>
			 	 		</div>
			 	 		</div>
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
		<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="PersonalHomePageCustomer.jsp">个人主页</a></li>
					</ul>
					</div>
					</div>
					</div>
					</div>
					</div>
  <%
  }
  }
  %>
  <%
  if(request.getAttribute("editSuccess") != null && 
  		request.getAttribute("editSuccess").equals(new String("yes"))){
   %> 
  		<div class="tab1">修改成功！</div>
  <%
  }
  else{
   %>
  
  <form action="./servlet/AlterCustomerInfo" method="post">
  <table border="2">
	<tr>
		<td>id:</td>
		<td><input type="text" name="id" value=<%=request.getParameter("customerId")%>></input></td>
	</tr>
	<tr>
		<td>姓名:</td>
		<td><input type="text" name="name"/></td>
	</tr>
	<tr>
		<td>登录密码：</td>
		<td><input type="password" name="psw"/></td>
	
	</tr>
	<tr>
		<td>确认登录密码：</td>
		<td><input type="password" name="confirmPsw"/></td>
	
	</tr>
	<tr>
		<td>支付密码：</td>
		<td><input type="password" name="payPsw"/></td>
	
	</tr>
	<tr>
		<td>确认支付密码：</td>
		<td><input type="password" name="confirmPayPsw"/></td>
	
	</tr>
	<tr>
		<td>手机号码：</td>
		<td><input type="text" name="phone"/></td>
	
	</tr>
	<tr>
		<td>收货地址</td>
		<td><input type="text" name="address"/></td>
	
	</tr>
	<tr>
		<td><input type="submit" value="确定"/></td>
		<td><input type="button" value="取消" onclick="javascript:history.back(-1);"/></td>
	
	</tr>

	</table>
  </form>
  <%
  }
   %>
  </body>
</html>
