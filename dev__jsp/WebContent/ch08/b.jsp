<%@page import="jsp.sonata.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
b.jsp
<br>
<%
//	Sonata sonata = (Sonata)request.getAttribute("wheel");
	 out.print(  request.getAttribute("wheel" ));
	 out.print(  request.getAttribute("color"));
	
%>
</body>
</html>