<%@page import="cn.edu.zhku.model.Cart"%>
<%@page import="cn.edu.zhku.dao.UserDao"%>
<%@page import="cn.edu.zhku.model.Order"%>
<%@page import="cn.edu.zhku.service.CartService"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CustomerOrder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<div>订单详情</div>
  	<table border="2">
<%--    <a href="CustomerOrder.jsp?customerId=<%=cart.getIdOfCustomer() %>&idOfCart=<%=cart.getIdOfCart()%>">
		下订单
	</a>   --%>
	<%!CartService cartService = new CartService();
		UserDao userDao = new UserDao();
		int idofgoods = -1;
		Order currentOrder = null;
	 %>
  	<%
	if(request.getParameter("customerId") != null 
		&& request.getParameter("idOfCart") != null
		&& request.getParameter("idofgoods") != null
		&& request.getParameter("numofgoods") != null
		&& request.getParameter("totalmoney") != null){
		
			String customerId = request.getParameter("customerId");
			String idOfCart = request.getParameter("idOfCart");
			String idofgoods = request.getParameter("idofgoods");
			String numofgoods = request.getParameter("numofgoods");
			String totalmoney = request.getParameter("totalmoney");
			
			out.print(customerId + " " + idOfCart + " " + idofgoods + " " + numofgoods + " " + totalmoney);
			
			if(cartService.CustomerAddOrder(Integer.parseInt(customerId), Integer.parseInt(idOfCart))){
		
		
		
				if(cartService.CartAddToGoodsInTransit(Integer.parseInt(customerId) ,
					 Integer.parseInt(idOfCart), Integer.parseInt(idofgoods), 
						Integer.parseInt(numofgoods), Double.parseDouble(totalmoney))){
				
		  	
		  			if(cartService.CustomerDelCart(0, Integer.parseInt(idOfCart), 1)){ 
		  	 	%>
		  			<div>成功提交订单！</div>
		  
		  		<%
		  			}
				}
	  		}
	  	}
  	 %>
	<%   	 
  	 
    if(request.getParameter("customerId") != null 
    	&& request.getParameter("idOfCart") != null){
    	
   		String customerId = request.getParameter("customerId");
		String idOfCart = request.getParameter("idOfCart");
		
   		List<Order> currentOrders = cartService.CustomerQueryOrder(Integer.parseInt(customerId),Integer.parseInt(idOfCart));
    	
    	
    	
     %>
   	
  		<tr>
  			<td>订单号</td>
  			<td>顾客id</td>
  			<td>顾客姓名</td>
  			<td>顾客收货地址</td>
  			<td>顾客手机号码</td>
  			<td>商品详情（购物车id）</td>
  			<td>订单状态</td>
  			<td>快递方式</td>
  			<td>快递费用</td>
  			<td>支付方式</td>
  			<td>快递员</td>
  			<td>快递员联系电话</td>
  			<td>发票类型和信息</td>
  			<td>合计</td>
  			<td></td>
  		</tr>
  			
  		
  		<%
  		for(Order order:currentOrders){
    		currentOrder = order;
    		
  		 %>
  		<tr>
  			<td><%=currentOrder.getId() %></td>
  			<td><%=currentOrder.getCustomerID() %></td>
  			<td><%=currentOrder.getCustomerName() %></td>
  			<td><%=currentOrder.getCustomerAddress() %></td>
  			<td><%=currentOrder.getCustomerPhone() %></td>
  			<%
  				idofgoods = userDao.readGoodsInTransit(Integer.parseInt(customerId),Integer.parseInt(idOfCart)).get(0).getIdOfGoods();
  			 %>
  			<td><a href = "customertBoughtGoodsInfo.jsp?idOfgoods=<%=idofgoods %>&idofcart=<%=currentOrder.getIdOfCart()%>"><%=currentOrder.getIdOfCart() %></a></td>
  			<td><%=currentOrder.getStatus() %></td>
  			<td><%=currentOrder.getExpressMode() %></td>
  			<td><%=currentOrder.getExpressCharge() %></td>
  			<td><%=currentOrder.getPayMode() %></td>
  			<td><%=currentOrder.getExpressWorker() %></td>
  			<td><%=currentOrder.getExpressWorkerPhone() %></td>
  			<td><%=currentOrder.getInvoiceStypeAndInfo() %></td>
  			<td><%=currentOrder.getTotalMoney() %></td>
  			<% 
  			if(currentOrder.getStatus().equals(new String("等待买家付款"))){
  			%>
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=0">付款</a></td>
  			<% 
  			}
  			else if(currentOrder.getStatus().equals(new String("买家已付款，等待平台确认"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=1">买家已付款，等待平台确认</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("等待发货"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=2">等待发货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("确认收货"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=3">等待买家确认收货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("已确认收货，去评价"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=4">已确认收货，去评价</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("交易成功"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=5">交易成功</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("申请退、换货"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=6">申请退、换货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("取消订单"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=7">取消订单</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("申请售后"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=8">申请售后</a></td>
  			<%
  			}
  			%> 
  			
  		</tr>
  		
  		<%
  		}
  		%>
  		<tr>
  			<td colspan="2">您的其他订单：</td>
  			<td colspan="13"></td>
  		</tr>
  		<%
  		List<Order> currentOtherOrders = cartService.CustomerQueryOrder(Integer.parseInt(customerId),0);
    	
    	for(Order order:currentOtherOrders){
    		currentOrder = order;
    		if(currentOrder.getIdOfCart() == Integer.parseInt(idOfCart)){
    			continue;
    		}
    	
    	%>
    	<tr>
  			<td><%=currentOrder.getId() %></td>
  			<td><%=currentOrder.getCustomerID() %></td>
  			<td><%=currentOrder.getCustomerName() %></td>
  			<td><%=currentOrder.getCustomerAddress() %></td>
  			<td><%=currentOrder.getCustomerPhone() %></td>
  			<%
  				idofgoods = userDao.readGoodsInTransit(Integer.parseInt(customerId),Integer.parseInt(idOfCart)).get(0).getIdOfGoods();
  			 %>
  			<td><a href = "customertBoughtGoodsInfo.jsp?idOfgoods=<%=idofgoods %>&idofcart=<%=currentOrder.getIdOfCart()%>"><%=currentOrder.getIdOfCart() %></a></td>
  			<td><%=currentOrder.getStatus() %></td>
  			<td><%=currentOrder.getExpressMode() %></td>
  			<td><%=currentOrder.getExpressCharge() %></td>
  			<td><%=currentOrder.getPayMode() %></td>
  			<td><%=currentOrder.getExpressWorker() %></td>
  			<td><%=currentOrder.getExpressWorkerPhone() %></td>
  			<td><%=currentOrder.getInvoiceStypeAndInfo() %></td>
  			<td><%=currentOrder.getTotalMoney() %></td>
  			<% 
  				if(currentOrder.getStatus().equals(new String("买家已付款"))){
  			%>
  				<td><a href = "fahuo.jsp">发货</a></td>
  			<% 
  			}
  			else if(currentOrder.getStatus().equals(new String("买家已付款，等待平台确认"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=1">买家已付款，等待平台确认</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("等待发货"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=2">等待发货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("确认收货"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=3">等待买家确认收货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("已确认收货，去评价"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=4">已确认收货，去评价</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("交易成功"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=5">交易成功</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("申请退、换货"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=6">申请退、换货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("取消订单"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=7">取消订单</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("申请售后"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=8">申请售后</a></td>
  			<%
  			}
  			%>
  			
		</tr>
    	
    	
    	<%
    		}
  		} 
  		else if(session.getAttribute("userIdentity")!=null&&
  			session.getAttribute("userName")!=null&&
  			session.getAttribute("userId")!=null){
  		
  			%>
  			
  			
  			
  			
  			<%
  		List<Order> currentOtherOrders = cartService.CustomerQueryOrder(0,0);
  		if(currentOtherOrders != null){
    		out.print("currentOtherOrders != null");
    	}
    	for(Order order:currentOtherOrders){
    		currentOrder = order;
    	%>
    	<tr>
  			<td><%=currentOrder.getId() %></td>
  			<td><%=currentOrder.getCustomerID() %></td>
  			<td><%=currentOrder.getCustomerName() %></td>
  			<td><%=currentOrder.getCustomerAddress() %></td>
  			<td><%=currentOrder.getCustomerPhone() %></td>
  			<%
  				idofgoods = userDao.readGoodsInTransit(currentOrder.getCustomerID(),currentOrder.getIdOfCart()).get(0).getIdOfGoods();
  			 %>
  			<td><a href = "customertBoughtGoodsInfo.jsp?idOfgoods=<%=idofgoods %>&idofcart=<%=currentOrder.getIdOfCart()%>"><%=currentOrder.getIdOfCart() %></a></td>
  			<td><%=currentOrder.getStatus() %></td>
  			<td><%=currentOrder.getExpressMode() %></td>
  			<td><%=currentOrder.getExpressCharge() %></td>
  			<td><%=currentOrder.getPayMode() %></td>
  			<td><%=currentOrder.getExpressWorker() %></td>
  			<td><%=currentOrder.getExpressWorkerPhone() %></td>
  			<td><%=currentOrder.getInvoiceStypeAndInfo() %></td>
  			<td><%=currentOrder.getTotalMoney() %></td>
  			<% 
  			if(currentOrder.getStatus().equals(new String("等待买家付款"))){
  			%>
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&ididoforder=<%=currentOrder.getId()%>&requestCode=0">付款</a></td>
  			<% 
  			}
  			else if(currentOrder.getStatus().equals(new String("买家已付款，等待平台确认"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=1">买家已付款，等待平台确认</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("等待发货"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=2">等待发货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("确认收货"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=3">等待买家确认收货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("已确认收货，去评价"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=4">已确认收货，去评价</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("交易成功"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=5">交易成功</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("申请退、换货"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=6">申请退、换货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("取消订单"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=7">取消订单</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("申请售后"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=8">申请售后</a></td>
  			<%
  			}
  			%>
  			
		</tr>
    	
    	
    	<%
    		}
  			
  			
  			%>
  			
  			
  			<% 
  		}
  		
  		%>
   
  	</table>
  </body>
</html>
