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
<jsp:useBean id="mycar" class="jsp.ch05.Sonata" scope="application"></jsp:useBean>
<%
	Sonata myCar = new Sonata();
	out.print(myCar.carColor);
	request.setAttribute("carColor", mycar.carColor);
	request.setAttribute("wheelNum", 4);
	RequestDispatcher view = request.getRequestDispatcher("p132_1.jsp");
	view.forward(request, response);
%>
</body>
</html>