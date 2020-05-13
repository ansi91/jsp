<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style>

#main {display:inline; width:1000px; height:450px; margin:0px; padding:0px; overflow:hidden;}
</style>
</head>
<body>
<div>
<%@include file="top.jsp" %>
</div>
<div id="main">

<div id="menu">
<%@include file="menu.jsp" %>
</div>

<div id="body">
<%@include file="body.jsp" %>
</div>
</div>
</body>
</html>