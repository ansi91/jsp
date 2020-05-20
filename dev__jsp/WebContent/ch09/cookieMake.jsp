<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie c_notebook = new Cookie("c_notebook","gram2020");
	response.addCookie(c_notebook); //ch09 -읽을 수 있음 /ch09-1에서는 읽기 불가
	
	Cookie c_cellphone = new Cookie("c_cellphone","iPhoneSE2");
	response.addCookie(c_cellphone);
	c_cellphone.setPath("/ch09"); //읽을 수 있음 /ch09-1에서는 읽기 불가
	c_cellphone.setMaxAge(10);
	
	Cookie c_coffee 	  = new Cookie("c_coffee","이디야커피");
	response.addCookie(c_coffee);
	c_coffee.setPath("/"); //읽기 가능 /ch09-1에서는 읽기 가능
	c_coffee.setMaxAge(15);
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch09에서 만듦</title>
</head>
<body>
1234
</body>
</html>