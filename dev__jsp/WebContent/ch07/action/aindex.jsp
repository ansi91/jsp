<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="1000px" height="500px">
<!--Top.jsp  -->
<tr>
	<td width="1000px" height="50px">
		<jsp:include page="atop.jsp" flush="true"></jsp:include>
	</td>
</tr>
	<!--Top 끝  -->
	<!--Main  -->
	<tr>
		<td>
		<table border="1" borderColor="green">
		<tr>
			<td width="250px" height="450px">제목</td>
			<td width="750px" height="450px">내용</td>
		</tr>
		 </table>
		  </td>
		</tr>
	</table>	
</body>
</html>