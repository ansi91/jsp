<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--     	
			jsp - > servlet 관찰하기
			POJO FrameWork관련
			form action="./loginServelt.do"
			doGet메소드 하나로 여러가지의 업무를 처리하기 위해서 무엇을 어떡하지?
			첫째: url 이름을 변경하는 것은 새로운 서블릿을 계속 만들어야 하는 문제가 발생
			둘째 : 하나의 url 이름을 가지고 같은 업무 내용에서 입력,수정,삭제,조회 등 4가지로 분기함
			해결방법 : 쿼리스트링으로 해결한다..
			./loginServlet.do?mode=login -> 디플트로 처리 null일경우
			./loginServlet.do?mode=logout 
    -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="f_login" method="get" action="/ch09/LoginServlet.do">
	<input type  = "text" name = "mem_id"><br>
	<input type  = "text" name = "mem_pw"><br>
	<input type="submit" value="로그인">
</form>
</body>
</html>
