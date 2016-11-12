<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>shopTop</title>

  </head>
  
  
  <form name="formOfTop">
  <frameset rows="70,*">
   <frame src="toptop.jsp" name="topOfTop">
  <frame src="topDown.jsp" name="topOfDown">
  </frameset>
  </form>
  
</html>
