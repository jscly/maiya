<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Down</title>
   
  </head>
  
  
    <frameset cols="300,*">
    	<frame src="Left.jsp" name="left">
    	<frame src="Right.jsp" name="right">
    
    </frameset>
 
</html>
