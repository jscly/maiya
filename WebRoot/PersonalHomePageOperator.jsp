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
    
    <title>运营商首页</title>
    
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
  String userIdentity = null;
  /* 错误：String userId = (String)request.getAttribute("userId"); */
  String userId = null;
  /*考虑到运营商第一次登陆时，需要 request.getAttribute("userId")，再次载入这页面是，userId就为null了 */
  if(request.getAttribute("userId") != null ){
  		userId = String.valueOf((Integer)request.getAttribute("userId"));
  }
  /* 所以需要从session里面获取 */
  else if(request.getAttribute("userId") == null){
  		userId = String.valueOf((Integer)request.getAttribute("userId"));
  
  }
  
  /*考虑到运营商第一次登陆时，需要 request.getAttribute("identity")，再次载入这页面是，identity就为null了 */
  if( request.getAttribute("identity") != null){
  		userIdentity = (String)request.getAttribute("identity");
  }
  /* 所以需要从session里面获取 */
  else if(request.getAttribute("identity") == null){
  		userIdentity = (String)session.getAttribute("userIdentity");
  
  }
  
  String userName = (String)request.getAttribute("userName");
  
  if(userIdentity != null && userId!= null && userName!= null){
  
	  session.setAttribute("userIdentity",request.getAttribute("identity"));
	  session.setAttribute("userId",request.getAttribute("userId"));
	  session.setAttribute("userName",request.getAttribute("userName"));
  } 
  
  
  userIdentity = (String)session.getAttribute("userIdentity");
  userName = (String)session.getAttribute("userName");
  if(userIdentity != null && userName != null){
	  if(userIdentity.equals(new String("customer"))){
	 	 		out.print("<div class = ''><div class = ''>欢迎您！" + userIdentity + "&nbsp;&nbsp;" + userName + "</div><div class = ''><a href='logout.jsp' target='_self'>退出</a></div></div>");
	  }
	  else if(userIdentity.equals(new String("seller"))){
	 	 		out.print("<div class = ''><div class = ''>欢迎您！" + userIdentity + "&nbsp;&nbsp;" + userName + "</div><div class = ''><a href='logout.jsp' target='_self'>退出</a></div></div>");
	  }
	  else if(userIdentity.equals(new String("operator"))){
	 	 		out.print("<div class = 'welcome'>欢迎您！" + userIdentity + "&nbsp;&nbsp;" + userName + "&nbsp;&nbsp;&nbsp;<a href='logout.jsp' target='_self'>退出</a></div>");
	  
	  }
  }
  else if(userIdentity == null && userName ==null){
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
						<li class="grid"><a>管理商品</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<a href="StockInformation.jsp"><h4>库存信息</h4></a>
									
									</div>
									<div class="col1 me-one">
										<h4>
										<a href="AddGoods.jsp">商品上架</a>
										</h4>
											
									</div>
									<div class="col1 me-one">
										<h4>
										<A href="AlterGoods.jsp">修改商品信息</A>
										</h4>
											
									</div>
									<div class="col1 me-one">
										<h4>
										<A href="DeleteGoods.jsp">删除商品</A>
										</h4>
											
									</div>
									
								</div>
							</div>
						</li>
						
						<li class="grid"><a>财务报表</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>
										<a href="salesInformation.jsp">
										销量报表
										</a>
										</h4>
										
									</div>
									
									
								</div>
							</div>
						</li>
						
						<li class="grid"><a>管理会员</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>
										<a href="./servlet/OperatorQueryCustomerInfo?requestCode=displayCustomers">查询会员</a>
										</h4>
										
									</div>
										
									<div class="col1 me-one">
										<h4>
									<a href="./servlet/Synchronize?requestCode=operatorAndCustomer">同步会员信息</a>
										</h4>
											
									</div>
									<div class="col1 me-one">
										<h4>
										<a href="./servlet/OperatorDeleteCustomer?requestCode=byId">删除会员</a>
										</h4>
											
									</div>
									
								</div>
							</div>
						</li>
						<li class="grid"><a>管理订单</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>
										<a href="./servlet/OperatorManOrders?requestCode=121">查询订单</a>
										</h4>
										
									</div>
										
									<div class="col1 me-one">
										<h4>
									<a href="./servlet/OperatorManOrders?requestCode=121">修改订单状态</a>
										</h4>
											
									</div>
									
								</div>
							</div>
						</li>
						
						<li class="grid"><a>个人信息</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4><a href="./servlet/OperatorManSelf?requestCode=qs">查询个人信息</a></h4>
										
									</div>
									<div class="col1 me-one">
										<h4><a href="./servlet/OperatorManSelf?requestCode=es">修改个人信息</a></h4>
											
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
					<input type="text" value="搜索" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
					<input type="submit" value="">
				</div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
    <%
    String requsetCode = (String)request.getAttribute("reqCode");
    
    String identity = (String)session.getAttribute("userIdentity");
    /*运营商id  */
    String id = String.valueOf((Integer)request.getAttribute("userId"));
    
    int genealViewOrSpecificView = -2;
    if(request.getAttribute("GenealViewOrSpecificView") != null){
    	/* if(request.getAttribute("GenealViewOrSpecificView") instanceof String){
    		genealViewOrSpecificView = Integer.parseInt((String)(request.getAttribute("GenealViewOrSpecificView")));
    	}else{ */
     		genealViewOrSpecificView= (Integer)request.getAttribute("GenealViewOrSpecificView");
     	/* } */
    }
    
    if(genealViewOrSpecificView != -1){
    
	/* 显示处理结果,比如运营商点击“查询店铺”,则向OperatorQueryShopsInfo.java(Servlet)传递参数（requestCode<参数名>=displayShops<值>）,Servlet request。getParameter(name)后，在传递给本jsp页面*/
    	if(genealViewOrSpecificView == 0){ 
    
    
	    if(requsetCode == null){
	    	out.print("欢迎！");
	    }
	    else if(requsetCode != null){
	    	if(requsetCode.equals(new String("displayShops"))){
	    	
	    		/*id:运营商id  */
	    		List<?> userlist = userDao.query(identity,Integer.parseInt(id),0);
	    		if(userlist == null){
	    			out.print("为空");
	    		}
	    		else if(userlist != null){
			    	String shops = null;
			    	for (Object object : userlist) {
			    		
			    		shops = ((Operator)object).getShops();
			    	}
			    	//获取每个店铺id
			    	String [] shopsArr = shops.split(";");
			    	
			    	int [] shopsIdArr = new int[3];
			    	
			    	List<ShopInfo> shopInfos = new ArrayList<ShopInfo>();
			    	
			    	for(int i = 0;i < 3;i++){
			    		shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
			    		shopInfos.add(userDao.QueryShopInfo(shopsIdArr[i]));
			    	}
			    	
			    	
			    	out.print("<div class = ''>管理店铺</div>");
			    	out.print("<div class = ''>查询店铺</div>");
			    	
			    	session.setAttribute("shopsInfo",shopInfos);
			    	out.print("<table border = '1' class = 'displayShops'><tr>");
			    	String idsInshopInfos = "";
			    	for(int i = 0;i < shopsIdArr.length;i++){
			    	
			    		idsInshopInfos += shopsIdArr[i] + ";";
			    	}
			    	System.out.print("ids = "+ idsInshopInfos);
			    	for(int i = 0;i < 3;i++){    		
			    		out.print("<td class ='shop'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr height='150px'><td colspan='2'>商品图片</td></tr><tr><td>"+ shopInfos.get(i).getShopId() + "</td><td>" +shopInfos.get(i).getShopName()+"</td></tr><tr><td colspan='2'><input name = 'shopId' type='text' value="+ shopInfos.get(i).getShopId()+" class = 'hideShopIdInInput'/></td></tr><tr><td colspan='2'><input type='submit' value='查询'/></td></tr></table></form></td>");
			    	}
			    	/* userId:运营商id ; idsInshopInfos:已经显示在运营商首页的店铺id*/
			    	out.print("<td width = '135px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorId_queryTheLeft' type='text' value="+ userId+" class = ''/></td></tr><tr><td><input type = 'submit' value = '更多店铺信息'/></td></tr><tr><td><input name = 'idsInshopInfos_queryTheLeft' type='text' value="+ idsInshopInfos+" class = ''/></td></tr></table></form></td></tr></table>");
			    	out.print("<div class = ''>删除店铺</div>");
	    		}
	    	}
	    }	
    }
    
    /* 用户点击店铺下面的"查询"按钮，显示店铺详情 */
    else if(genealViewOrSpecificView == 1){
    	 out.print("用户点击店铺下面的 查询 按钮，显示店铺详情");
	     out.print("<div><a href = 'PersonalHomePageOperator.jsp' target = '_self'><</a></div>");
    	
    	/*id:运营商id,用于传入到Servlet->OperatorDeleteShop里面，进行删除Operator表中店铺信息的操作（删除当前店铺id）  */
    	 id = (String)session.getAttribute("userId");
    	 
    	 
    	 int operatorId = Integer.parseInt((String)session.getAttribute("userId"));
    	 /*shopInfo（）用于查询下一个和下一个店铺  */
	     ShopInfo shopInfo = (ShopInfo)request.getAttribute("shopInfoDetails");
	     if(shopInfo != null){
	       out.print("<table><tr><td colspan='2'>店铺图片:</td><td>待完善功能</td></tr><tr><td colspan='2'>店铺Id:</td><td>"+shopInfo.getShopId()+"</td></tr><tr><td colspan='2'>店铺名:</td><td>"+shopInfo.getShopName()+"</td></tr><tr><td colspan='2'>卖家id:</td><td>"+shopInfo.getSellerId()+"</td></tr><tr><td colspan='2'>是否有效认证卖家(1:有效；0：无效):</td><td>"+shopInfo.getIsValidShop()+"</td></tr><tr><td colspan='2'>营业额:</td><td>"+shopInfo.getShopTurnOver()+"</td></tr><tr><td colspan='2'>商家拥有的商品id（运营商不可修改）:<td>"+shopInfo.getShopGoodsId() + "</td></tr><td colspan='2'>订单（运营商不可修改）:</td><td>"+shopInfo.getShopOrdersId()+"<td></tr></table>");
	       /*根据店铺当前id 和运营商id(可以得出全部店铺id)，从而定位下一个和上一个店铺*/
	       out.print("<table border='1'><tr><td width = '100px'><form action='./servlet/OperatorDeleteShop' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='删除' class = 'btn'/></td></tr><tr><td><input name = 'userIdentity' type='text' value="+ userIdentity+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_deleteShop' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td><td width = '100px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='上一个' class = 'btn'/></td></tr><tr><td><input name = 'operatorId_forlast' type='text' value="+ operatorId+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_forlast' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td><td width = '100px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='下一个' class = 'btn'/></td></tr><tr><td><input name = 'operatorId' type='text' value="+ operatorId+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td></tr></table>");
	     }
	   	 else if(shopInfo == null){
	    	out.print("无更多店铺信息！");
	     }
	   /*  
	    <tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr>
     */
    
    }
    /* 用户点击店铺"上、下一个/更多店铺信息"按钮，也可以删除对于店铺，显示上、下一个/更多店铺信息店铺详情 */
    else if(genealViewOrSpecificView == 2){
    	out.print("用户点击店铺 上、下一个/更多店铺信息 按钮，显示上、下一个/更多店铺信息店铺详情 ");
    	
    	/*id:运营商id,用于传入到Servlet->OperatorDeleteShop里面，进行删除Operator表中店铺信息的操作（删除当前店铺id）  */
    	 id = (String)session.getAttribute("userId");
    	
	     out.print("<div><a href = 'PersonalHomePageOperator.jsp' target = '_self'><</a></div>");
    	if(request.getAttribute("theRemainingshopIds") != null){
	    	List<ShopInfo> shopsInfo_theLeft = new ArrayList<ShopInfo>();
	    	
	     shopsInfo_theLeft = (List<ShopInfo>)request.getAttribute("theRemainingshopIds");
	     for(ShopInfo shopsInfo : shopsInfo_theLeft){
	    		out.print("<td class ='shop'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table border = '1'><tr height='150px'><td colspan='2'>商品图片</td></tr><tr><td>"+ shopsInfo.getShopId() + "</td><td>" +shopsInfo.getShopName()+"</td></tr><tr><td colspan='2'><input name = 'shopId' type='text' value="+ shopsInfo.getShopId()+" class = 'hideShopIdInInput'/></td></tr><tr><td colspan='2'><input type='submit' value='查询'/></td></tr></table></form></td>");
    		}
    	}
    	
    	 int operatorId = Integer.parseInt((String)session.getAttribute("userId"));
    	 /*shopInfo（）用于查询下一个和下一个店铺  */
	     ShopInfo shopInfo = (ShopInfo)request.getAttribute("shopInfoDetails");
	      if(shopInfo != null){
	       out.print("<table><tr><td colspan='2'>店铺图片:</td><td>待完善功能</td></tr><tr><td colspan='2'>店铺Id:</td><td>"+shopInfo.getShopId()+"</td></tr><tr><td colspan='2'>店铺名:</td><td>"+shopInfo.getShopName()+"</td></tr><tr><td colspan='2'>卖家id:</td><td>"+shopInfo.getSellerId()+"</td></tr><tr><td colspan='2'>是否有效认证卖家(1:有效；0：无效):</td><td>"+shopInfo.getIsValidShop()+"</td></tr><tr><td colspan='2'>营业额:</td><td>"+shopInfo.getShopTurnOver()+"</td></tr><tr><td colspan='2'>商家拥有的商品id（运营商不可修改）:<td>"+shopInfo.getShopGoodsId() + "</td></tr><td colspan='2'>订单（运营商不可修改）:</td><td>"+shopInfo.getShopOrdersId()+"<td></tr></table>");
	       /*根据店铺当前id 和运营商id(可以得出全部店铺id)，从而定位下一个和上一个店铺*/
	       out.print("<table border='1'><tr><td width = '100px'><form action='./servlet/OperatorDeleteShop' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='删除' class = 'btn'/></td></tr><tr><td><input name = 'userIdentity' type='text' value="+ userIdentity+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_deleteShop' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td><td width = '100px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='上一个' class = 'btn'/></td></tr><tr><td><input name = 'operatorId_forlast' type='text' value="+ operatorId+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_forlast' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td><td width = '100px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='下一个' class = 'btn'/></td></tr><tr><td><input name = 'operatorId' type='text' value="+ operatorId+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td></tr></table>");
	     }
	   	 else if(shopInfo == null){
	    	out.print("无更多店铺信息！");
	     }
	    
	     
    }
   /*  删除店铺信息，需要输入运营商权限密码的页面  */
    else if(genealViewOrSpecificView == 3){
    	out.print("删除店铺信息，需要输入运营商权限密码页面");
    	/* request.setAttribute("userIdentity", userIdentity);
			request.setAttribute("GenealViewOrSpecificView", new Integer(3));
			request.setAttribute("shopCurrentId_deleteShop", shopCurrentId_deleteShop); */
    	String userIdentityFromOperatorDeleteShopServlet = (String)request.getAttribute("userIdentity");
    	int GenealViewOrSpecificView = (Integer)request.getAttribute("GenealViewOrSpecificView");
    	String shopCurrentId_deleteShop = (String)request.getAttribute("shopCurrentId_deleteShop");
    	
    	/* 继续传递到OperatorDeleteShop这个Servlet里面进行处理 */
    	out.print("userIdentityFromOperatorDeleteShopServlet GenealViewOrSpecificView shopCurrentId_deleteShop=" + userIdentityFromOperatorDeleteShopServlet +GenealViewOrSpecificView +shopCurrentId_deleteShop);
    	
    	out.print("<form action='./servlet/OperatorDeleteShop' method='post'><table><tr><td><input name = 'operatorIdForDeleteShops' type='text' value='"+session.getAttribute("userId")+"' class = '' size = '5'/></td></tr><tr><td><input name = 'userIdentity' type='text' value='"+userIdentityFromOperatorDeleteShopServlet+"' class = '' size = '5'/></td></tr><tr><td><input name = 'GenealViewOrSpecificView' type='text' value='"+GenealViewOrSpecificView+"' class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_deleteShop' type='text' value='"+shopCurrentId_deleteShop+"' class = '' size = '5'/></td></tr><tr><td>权限密码：</td><td><input name = 'operatingAuthorityPsw' type='text' class = '' size = '5'/></td></tr><tr><td><input type='submit' value='删除' class = 'btn'/></td><td><input type= 'button' value = '后退' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
    }
    /* <tr><td><input name = 'operatorIdForDeleteShops' type='text' value='"+sess+"' class = '' size = '5'/></td></tr> */
    
         /* 用户点击"更多店铺信息"按钮，显示更多店铺详情  */
    else if(genealViewOrSpecificView == 31){
    	out.print("删除全部操作成功！");
    }
    /* 运营商输入店铺id删除店铺 */
    else if(genealViewOrSpecificView == 4){
    	out.print("删除byid！");
    	/* String userIdentityFromOperatorDeleteShopServlet = (String)request.getAttribute("userIdentity");
    	int GenealViewOrSpecificView = (Integer)request.getAttribute("GenealViewOrSpecificView");
    	String shopCurrentId_deleteShop = (String)request.getAttribute("shopCurrentId_deleteShop");
    	 */
    	/* 继续传递到OperatorDeleteShop这个Servlet里面进行处理 */
    	/* out.print("userIdentityFromOperatorDeleteShopServlet GenealViewOrSpecificView shopCurrentId_deleteShop=" + userIdentityFromOperatorDeleteShopServlet +GenealViewOrSpecificView +shopCurrentId_deleteShop);
    	 */out.print("identity = " + identity);
    	
    	out.print("<form action='./servlet/OperatorDeleteShop' method='post'><table><tr><td><input name = 'operatorIdToDelShop' type='text' value='"+session.getAttribute("userId")+"' class = '' size = '5'/></td><td><input name = 'operatorIdtenToDelShop' type='text' value='"+session.getAttribute("userIdentity")+"' class = '' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='41' class = '' size = '5'/></td></tr><tr><td>店铺id:</td><td colspan='2'><input name = 'shopid' type='text' class = '' size = '40'/></td></tr><tr><td><input type='submit' value='删除' class = 'btn'/></td><td><input type= 'button' value = '后退' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
   
      }
    
    
     /* 运营商同步数据库信息 */
    else if(genealViewOrSpecificView == 5){
    
    	 out.print("<form action='./servlet/Synchronize' method='post'><table><tr><td><input name = 'operatorIdToSynShop' type='text' value='"+session.getAttribute("userId")+"' class = '' size = '5'/></td><td><input name = 'operatorIdtenToSynShop' type='text' value='"+session.getAttribute("userIdentity")+"' class = '' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='51' class = '' size = '5'/></td></tr><tr><tr><td><input type='submit' value='同步' class = 'btn'/></td><td><input type= 'button' value = '后退' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
     } 
    else if(genealViewOrSpecificView == 52){
    	 out.print("同步成功！"); 
    
    } 
    /* 显示查询未认证的所有店铺 */
    else if(genealViewOrSpecificView == 6){
    	List<ShopInfo> allInvalidshops = (List<ShopInfo>)request.getAttribute("invalidshops");
    	/* if(allInvalidshops != null){
    		for(ShopInfo shopInfo:allInvalidshops){
    			if(Integer.parseInt(shopInfo.getIsValidShop()) == 1){
    				allInvalidshops.remove(shopInfo);
    			}
    		}
    	} */
    	
    	out.print("<table>");
    	for(ShopInfo shopInfo : allInvalidshops){
    		 out.print("<tr><td>店铺id:</td><td>" + shopInfo.getShopId()+ "</td></tr><tr><td>isValidShop:</td><td>"+shopInfo.getIsValidShop()+"</td></tr><tr><td>认证状态：</td><td>未认证</td><tr><tr><td>----</td><td>----</td><tr>");
    	}
    	out.print("</table>");
    	 out.print("<form action='./servlet/AuthenticateShopCtrl' method='post'><table><tr><td><input name = 'operatorIdToAuthShop' type='text' value='"+session.getAttribute("userId")+"' class = '' size = '5'/></td><td><input name = 'operatorIdtenToAuthShop' type='text' value='"+session.getAttribute("userIdentity")+"' class = '' size = '5'/></td><td><input name = 'requestCode' type='text' value='61' class = '' size = '5'/></td></tr><tr><tr><td><input type='submit' value='一键全部认证店铺' class = 'btn'/></td><td><input type= 'button' value = '后退' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
    
    } 
   /*  //显示认证成功结果 */
    else if(genealViewOrSpecificView == 62){
    	out.print("认证成功！");
    } 
    /* 店铺全部已经认证 */
    else if(genealViewOrSpecificView == 63){
    	out.print("店铺全部已经认证！");
    } 
    
    
    /* 运营商查看会员信息（登录密码、支付密码、余额除外） */
    else if(genealViewOrSpecificView == 7){
    	/* out.print("店铺全部已经认证！"); */
    	 out.print("<div class='tab1'><form action='./servlet/OperatorQueryCustomerInfo' method='post'><table><tr><td><input name = 'operatorIdToQureryCustomer' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '5'/></td><td><input name = 'operatorIdenToQureryCustomer' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='71' class = 'hide' size = '5'/></td></tr><tr><tr><td><input type='submit' value='查看会员信息' class = 'btn'/></td><td><input type= 'button' value = '后退' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form><div>");
    } 
    else if(genealViewOrSpecificView == 72){
    	/* out.print("店铺全部已经认证！"); */
    	List<Customer> customersInfolList = (List<Customer>)request.getAttribute("customersInfolList");
    	if(customersInfolList != null){
    	%>
    	<div class='tab1'>
    	 <form action='' method='post'>
    		<table border="1">
    		<tr>
    			<td>会员id</td>
    			<td>会员名</td>
    			<td>联系电话</td>
    			<td>收货地址</td>
    			<td>是否通过验证（0：否;1：是）</td>
    		</tr>
    		<%
    		for(Customer customers:customersInfolList){
    		 %>
    	 		
    	 		<tr>
    	 			<td ><%=customers.getId()%></td>
    	 			<td ><%=customers.getName()%></td>
    	 			<td ><%=customers.getPhone()%></td>
    	 			<td><%=customers.getDeliveryAddress()%></td>
    	 			<td ><%=customers.getIsValidCustomer()%></td>
    	 			
    	 		</tr>
    	 	<%
    	 	} %>	
    	 	</table>
    	 </form>
    	</div>
    	 		
    	 	<%	
    		}
    	
    } 
    else if(genealViewOrSpecificView == 8){
    	out.print("<form action='./servlet/OperatorDeleteCustomer' method='post'><table><tr><td><input name = 'operatorIdToDelCus' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '5'/></td><td><input name = 'operatorIdtenToDelCus' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='81' class = 'hide' size = '5'/></td></tr><tr><td>会员id:</td><td colspan='2'><input name = 'cusid' type='text' class = '' size = '30'/></td></tr><tr><td>权限密码:</td><td colspan='2'><input name = 'authpsw' type='password' class = '' size = '30'/></td></tr><tr><td><input type='submit' value='删除' class = 'btn'/></td><td><input type= 'button' value = '后退' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
   
    }
    else if(genealViewOrSpecificView == 82){
    	out.print("<div class='tab1'>删除会员信息成功！</div>");
   
    }
     
       /* 运营商同步数据库信息-会员 */
    else if(genealViewOrSpecificView == 9){
    
    	 out.print("<div class='tab1'><form action='./servlet/Synchronize' method='post'><table><tr><td><input name = 'operatorIdToSynCus' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '5'/></td><td><input name = 'operatorIdtenToSynCus' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='91' class = 'hide' size = '5'/></td></tr><tr><tr><td><input type='submit' value='同步' class = 'btn'/></td><td><input type= 'button' value = '后退' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form></div>");
     } 
     /*运营商同步会员信息到运营商表-结果  */
    else if(genealViewOrSpecificView == 92){
    	 out.print("<div class='tab1'>同步成功！</div>"); 
    
    } 
    /* 运营商查询个人信息 */
    else if(genealViewOrSpecificView == 10){
    	out.print("<div class='tab1'><form action='./servlet/OperatorManSelf' method='post'><table><tr><td><input name = 'id' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '5'/></td><td><input name = 'iden' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '5'/></td><td><input name = 'reqcode' type='text' value='101' class = 'hide' size = '5'/></td></tr><tr><tr><td><input type='submit' value='查询' class = 'btn'/></td><td><input type= 'button' value = '后退' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
   
    }
    /*运营商查询个人信息-结果  */
    else if(genealViewOrSpecificView == 102){
    	
    	List<Operator> info = (List<Operator>)request.getAttribute("info");
    	Operator operator = null;
    	for(Operator op:info){
    		operator = op;
    	}
    	%>
    	<div class='tab1'>
    	<table border="1">
			<tr>
				<td>id：</td>
				<td><%=operator.getOperatorId()%></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><%=operator.getOperatorName()%></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><%=operator.getOperatorPsw()%></td>
			</tr>
			<tr>
				<td>权限密码：</td>
				<td><%=operator.getOperatingAuthorityPsw()%></td>
			</tr>
			<tr>
				<td>拥有的顾客id：</td>
				<td><%=operator.getCustomers()%></td>
			</tr>
			<tr>
				<td>营业额：</td>
				<td><%=operator.getTurnover()%></td>
			</tr>
		</table>
		</div>
    	<%
    }
    /* 运营商修改个人信息 */
    else if(genealViewOrSpecificView == 11){
    	out.print("<div class='tab1'><form action='./servlet/OperatorManSelf' method='post'><table><tr><td><input name = 'id' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '40'/></td><td><input name = 'iden' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '40'/></td><td><input name = 'reqcode' type='text' value='111' class = 'hide' size = '30'/></td></tr><tr><td>姓名：</td><td colspan='2'><input name = 'name' type='text' class = '' size = '30'/></td></tr><tr><td>密码：</td><td colspan='2'><input name = 'psw' type='password' class = '' size = '30'/></td></tr><tr><td>确认密码：</td><td colspan='2'><input name = 'confpsw' type='password' class = '' size = '30'/></td></tr><tr><td>权限密码：</td><td colspan='2'><input name = 'authpsw' type='password' class = '' size = '30'/></td></tr><tr><td>确认权限密码：</td><td colspan='2'><input name = 'confauthpsw' type='password' class = '' size = '30'/></td></tr><tr><td>会员id：</td><td colspan='2'><input name = 'cus' type='text' class = '' size = '30'/></td></tr><tr><td><input type='SUBMIT' value='确定' class = 'btn'/></td><td><input type= 'button' value = '取消' onclick='PersonalHomePageOperator.jsp' class = 'btn'></td></tr></table></form></div>");
    	
    }
    /*运营商修改个人信息-结果  */
    else if(genealViewOrSpecificView == 112){
    	out.print("<div class='tab1'>成功！</div>");
   
    }
    /*查询订单并修改订单状态  */
    else if(genealViewOrSpecificView == 121){
    	
    	OperatorManagementService operatorManagementService = new OperatorManagementService();
    	
    	List<Order> ordersList =  operatorManagementService.queryOrders();
    	%>
    	<table border="2">
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
  		Order currentOrder = null;
  		List<Order> currentOrders = null;
  		CartService cartService = new CartService();
  		
  		int idofgoods = -1;
  		for(Order order:ordersList){
    		currentOrder = order;
    		
  		 %>
  		<tr>
  			<td><%=currentOrder.getId() %></td>
  			<td><%=currentOrder.getCustomerID() %></td>
  			<td><%=currentOrder.getCustomerName() %></td>
  			<td><%=currentOrder.getCustomerAddress() %></td>
  			<td><%=currentOrder.getCustomerPhone() %></td>
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
  				<td><a>等待买家付款</a></td>
  			<% 
  			}
  			else if(currentOrder.getStatus().equals(new String("买家已付款，等待平台确认"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=2">发货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("卖家已发货"))){
  			%>
  			
  				<td><a>等待买家收货</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("买家已收货"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=4">交易成功，关闭交易</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("交易成功，关闭交易"))){
  			%>
  			
  				<td><a>交易成功，关闭交易</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("买家申请退货"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=5&caozuo=tuihuo">处理买家退、换货申请</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("买家申请换货"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=5&caozuo=huanhuo">处理买家退、换货申请</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("买家取消订单"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=">处理取消订单操作</a></td>
  			<%
  			}
			%>  			
  		</tr>
  		<%
  		}
  		%>
  		</table>
    	<%
   }
   }
     %>
     <!-- <table><tr><td colspan='2'></td></tr></table> -->
  </body>
</html>
