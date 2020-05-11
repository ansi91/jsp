<%@page import="jsp.ch05.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객체의 영역[SCOPE에 대해서]</title>
</head>
<body>
<jsp:useBean id="himCar" class="jsp.ch05.Sonata" scope="application"></jsp:useBean>
<%
	Sonata myCar = new Sonata();
	
	request.setAttribute("carColor", himCar.carColor);
	String imsi=(String)request.getAttribute("carColor");
	out.print("carColor"+imsi);
	out.print("<br>");
	out.print("wheelNum:"+request.getAttribute("wheelNum"));
%>
</body>
</html>