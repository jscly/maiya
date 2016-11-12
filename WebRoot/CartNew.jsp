<%@page import="cn.edu.zhku.service.CartService"%>
<%@page import="cn.edu.zhku.model.Cart"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
  	 	userIdentity = (String)session.getAttribute("userIdentity");
  	 	userName = (String)session.getAttribute("userName");
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
  	
  	<%
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productNum = request.getParameter("productNum");
		String productPicPath = request.getParameter("productPicPath");
						
	%>
	
	<% if(userIdentity == null && userName ==null){
		
	%>
	<div class="whi">
		<a href ="login.jsp?productId=<%=productId %>&ago=cart&identity=customer" >
			<h2>请先登录！</h2>
		</a>
	</div>
	
	
	
	
	<%
	} else if(userIdentity != null && userName !=null){
	 %>
	
	<%
			/*从single页面（商品下面）添加进购物车，所以来到此页面  */
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
								
						/*为了防止刷新页面会错误插入数据进入cart表  ，待完善*/
					%>
						<script>window.alert("添加商品成功！");</script>
					<%
							
					}
					else if(!cartService.addToCart(cart)){
					
					%>
						<script>
							window.alert("商品已存在购物车中商品！");
							window.location="PersonalHomePageCustomer.jsp";
						</script>
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
			<div class="ckeckout-top tab2">
			<div class="cart-items">
				
			   
			   <div class="in-check" >
			   <table border="2">
					<tr>
					<td>购物车id:</td>
		    		<td>会员id:</td>
		    		<td>商品id:</td>
		    		<td>商品数量:</td>
		    		<td>单价</td>
		    		<td>总计:</td>
		    		<td>删除</td>
		    		<td>下单</td>
						
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
										<td><%=cart.getNumOfGoods() %></td>
										<td><%=(int)(cart.getTotalMoney()/cart.getNumOfGoods()) %></td>
										<td><%=cart.getTotalMoney() %></td>
										<td><a href="DelCartNew.jsp?customerId=<%=session.getAttribute("userId")%>&cartId=<%=cart.getIdOfCart()%>&requestCode=0">删除</a></td>
    									<td><a href="PlaceTheOrderNew.jsp?customerId=<%=session.getAttribute("userId")%>&cartId=<%=cart.getIdOfCart()%>">下单</a></td>
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
	
	
	
	
	<%}else if(request.getParameter("customerId")!=null){
 	%>
 	用户从个人主页查看购物车详情！<br>
    customerId：<%=request.getParameter("customerId") %>
    
    <table border="2">
    	<tr>
    		<td>xia购物车id:</td>
    		<td>会员id:</td>
    		<td>商品id:</td>
    		<td>商品数量:</td>
    		<td>单价:</td>
    		<td>总计:</td>
    		<td>删除</td>
    		<td>下单</td>
    	</tr>
    <%
    
    CartService cartService = new CartService();
    
    List<Cart> carts = cartService.readCart(Integer.parseInt(request.getParameter("customerId")));
    
    if(carts == null){
    %>
    
    	购物车空空如也！<a href="index.jsp">去浏览商品</a>
    <%
    }
    else if(carts != null){
    
    
    	for(Cart cart:carts){
    
     %>
    	<tr>
    		<td><%=cart.getIdOfCart() %></td>
    		<td><%=cart.getIdOfCustomer() %></td>
    		<td><%=cart.getIdOfGoods() %></td>
    		<td><%=cart.getNumOfGoods() %></td>
    		<td><%=(int)(cart.getTotalMoney()/cart.getNumOfGoods()) %></td>
    		<td><%=cart.getTotalMoney() %></td>
    		<td><a href="DelCartNew.jsp?customerId=<%=request.getParameter("customerId")%>&cartId=<%=cart.getIdOfCart()%>&requestCode=0">删除</a></td>
    		<td><a href="PlaceTheOrderNew.jsp?customerId=<%=request.getParameter("customerId")%>&cartId=<%=cart.getIdOfCart()%>">下单</a></td>
    	
    	</tr>
    
    <%
   		}
   }
 }
}
    %>
    </table>
  </body>
</html>
