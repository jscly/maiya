<%@ page language="java" import="java.util.*,cn.edu.zhku.control.*,java.sql.ResultSet" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>销售排名</title>
    
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<!--Custom Theme files-->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Luxury Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>	
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
						
						
						<div class="clearfix"></div>
					</div>
				</div>
				
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--start-logo-->
	<div class="logo">
		<a href="index.jsp"><img alt="" src="images/logo.png" class="" height="50px">
		</a>
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	<!--banner-starts-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="PersonalHomePageOperator.jsp" target="_self">个人主页</a></li>
					<li class="active">销售排名</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
    <table border="1" width="1000" align="center">
    <caption><font size="5" color="black">销量排名</font></caption>
   	<tr align="center">
   	<td>排名</td>
   	<td>商品编号</td>
   	<td>名称</td>
   	<td>价格</td>
   	<td>进货量</td>
   	<td>销量</td>
   	<td>库存</td>
   	</tr>
   	
<%
	goodsControl allSelect=new goodsControl();
	ResultSet rs = allSelect.getAll();
	
	rs.last(); 
	int length = rs.getRow();
	rs.beforeFirst();


/* while(rs.next()){
System.out.println(rs.getString("goodsName"));
}
 while(rs.next()){
System.out.println(rs.getString("idgoods"));
}  */
int[] reLength=new int[length];
for(int i=0; rs.next(); i++){
	reLength[i]=rs.getInt("salesvolume");
}
Arrays.sort(reLength);
int[] swap=new int[reLength.length];

for(int i=0; i<reLength.length-1; i++){
	swap[i]=reLength[reLength.length-1-i];
}
reLength=swap;
 for(int s: reLength){
System.out.println(s);
} 
   	
   	goodsControl less = new goodsControl();
   
   	for(int i=0; i<10; i++) { 
 %>
   	<tr>
   		<%ResultSet re = less.selectBySell(reLength[i]);
   		re.beforeFirst();
   		while(re.next()){ %>
   		
     <td><%=i+1 %></td>
     <td><%=re.getString("id") %></td>
     <td><%=re.getString("name") %></td>
     <td><%=re.getInt("price") %></td>
     <td><%=re.getInt("totalvolume") %></td>
     <td><%=re.getInt("salesvolume") %></td>
     <td><%=re.getInt("kucun") %></td>
      
    <% }%>
    </tr>
     <% }%>
  </body>
</html>
