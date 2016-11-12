<%@page import="cn.edu.zhku.model.Order"%>
<%@ page language="java" import="java.util.*,cn.edu.zhku.service.CartService,cn.edu.zhku.model.Cart" pageEncoding="gb2312"%>
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
	<%
	}
	}
	 %>
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
	<!--top-header-->
     
     <table border="2">
    	<tr>
    		<td>订单id</td>
    		<td>会员id</td>
    		<td>会员名</td>
    		<td>会员收货地址</td>
    		<td>会员手机号码</td>
    		<td>购物车id</td>
    		<td>订单状态</td>
    		<td>快递方式</td>
    		<td>快递费用</td>
    		<td>支付方式</td>
    		<td>快递员</td>
    		<td>快递员联系电话</td>
    		<td>发票类型及信息</td>
    		<td>总计</td>
    		<td>操作</td>
    		<td>操作</td>
    		<td>操作</td>
    	</tr>
    <%
    
    CartService cartService = new CartService();
    
    List<Order> orders = cartService.queryOrder((Integer)session.getAttribute("userId"), 0);
    
    if(orders == null){
    %>
    
    	订单空空如也！<a href="index.jsp">去浏览商品</a>
    <%
    }
    else if(orders != null){
    
    
    	for(Order order:orders){
    
     %>
    	<tr>
    		<td><%=order.getId() %></td>
    		<td><%=order.getCustomerID() %></td>
    		<td><%=order.getCustomerName() %></td>
    		<td><%=order.getCustomerAddress() %></td>
    		<td><%=order.getCustomerPhone() %></td>
    		<td><%=order.getIdOfCart() %>&nbsp;&nbsp;&nbsp;<a href="customertBoughtGoodsInfo.jsp?cartId=<%=request.getParameter("cartId") %>">查看详情</a></td>
    		<td><%=order.getStatus() %></td>
    		<td><%=order.getExpressMode() %></td>
    		<td><%=order.getExpressCharge() %></td>
    		<td><%=order.getPayMode() %></td>
    		<td><%=order.getExpressWorker() %></td>
    		<td><%=order.getExpressWorkerPhone() %></td>
    		<td><%=order.getInvoiceStypeAndInfo() %></td>
    		<td><%=order.getTotalMoney() %></td>
    		<% if(order.getStatus().equals(new String("交易成功，关闭交易") )
    			|| order.getStatus().equals(new String("卖家申请退货协议已达成"))
    				|| order.getStatus().equals(new String("卖家申请换货协议已达成"))){%>
    					<td><a href="DelOrderNew.jsp?orderId=<%=order.getId()%>">删除订单</a></td>
    		
    		<%
    		}
    		if(order.getStatus().equals(new String("买家已付款，等待平台确认") )
    			|| order.getStatus().equals(new String("等待买家付款") )){
    			%>
    					<td><a href="DelOrderNew.jsp?orderId=<%=order.getId()%>">取消订单</a></td>
    		
    		<%
    		}
    		if(order.getStatus().equals(new String("等待买家付款"))){
    		 %>
    			<td><a href="EditTheOrderStatusByCustomer.jsp?orderId=<%=order.getId()%>&orderStatus=<%=order.getStatus()%>&totalMoney=<%=order.getTotalMoney() %>">付款</a></td>
    		
    		<%
    		}
    		else if(order.getStatus().equals(new String("卖家已发货"))){
    		 %>
    			<td><a href="EditTheOrderStatusByCustomer.jsp?orderId=<%=order.getId()%>&orderStatus=<%=order.getStatus()%>&totalMoney=<%=order.getTotalMoney() %>">确认收货</a></td>
    		
    		<%
    		}
    		else if(order.getStatus().equals(new String("买家已收货"))){
    		 %>
    			<td><a>买家已收货</a></td>
    		
    		<%
    		}
    		else if(order.getStatus().equals(new String("交易成功，关闭交易"))){
    		 %>
    			<td><a href="EditTheOrderStatusByCustomer.jsp?orderId=<%=order.getId()%>&orderStatus=<%=order.getStatus()%>&totalMoney=<%=order.getTotalMoney() %>">申请退、换货</a></td>
    		
    		<%
    		}
    		else if(order.getStatus().equals(new String("买家申请退货"))){
     		%>
    			<td><a>已提交退货申请，请耐心等待！</a></td>
     		<% 
     		}
    		else if(order.getStatus().equals(new String("买家申请换货"))){
     		%>
    			<td><a>已提交换货申请，请耐心等待！</a></td>
     		<% 
     		}
    		else if(order.getStatus().equals(new String("卖家申请退货协议已达成"))){
     		%>
    			<td><a >您的申请退货协议已达成，请耐心等待！</a></td>
     		<% 
     		}
    		else if(order.getStatus().equals(new String("卖家申请换货协议已达成"))){
     		%>
    			<td><a >您的申请换货协议已达成，请耐心等待！</a></td>
     		<% 
     		}
     		
     		%>
    	</tr>
    
    <%
    
    } 
    
   }
    %>
    </table>
     
  </body>
</html>
