<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a2.jsp</title>
</head>
<body>
<!--html영역 로컬pc의 브라우저가 처리  -->
<%

//스크립틀릿 - Tomcat이 처리 주체다 우선 순위 1 왜냐하면 서버이기 때문에
	String name = "김유신";
	out.print("이름 :" + name); //결정된 정보인 이순신만 보임
	request.setAttribute("name", name); //request저장소에 기록하기
	RequestDispatcher view = request.getRequestDispatcher("b2.jsp");
	view.forward(request,response);
%>

</body>
</html>