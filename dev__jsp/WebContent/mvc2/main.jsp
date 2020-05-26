	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	Cookie[] cookies = request.getCookies();
	String c_name = null;
	if(cookies!= null && cookies.length > 0){
		for (int i = 0; i < cookies.length; i++){
			if ("c_name".equals(cookies[i].getName())){
				c_name = cookies[i].getValue();
			}
		}
	}
	out.print("쿠키에서 읽어온 값 ===>" + c_name);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키값 읽기</title>
<script type="text/javascript">
	function logout(){
		location.href="./LoginServlet.do?menu=logout";
	}
	
	function login(){
		location.href="./LoginServlet.do";	
		
	}
</script>
</head>
<body>
<%
	if (c_name == null){
%>
		<input type="button" value="로그인" onclick="login()">
<% 
	}else if(c_name !=null && c_name.length() > 0){
%>
		<input type="button" value="로그아웃" onclick="logout()">
<% 		
	}
%>
</body>
</html>