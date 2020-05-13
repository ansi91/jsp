<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a1.jsp[include 다이렉티브]</title>
</head>
<body>
include도 요청을 계속 유지하고 있는것으로 판단함.<br>

첫째<br>
둘째<br>
<%String id="test"; %>
<%@ include file="b1.jsp"  %>
넷째<br>
다섯째<br>

</body>
</html>