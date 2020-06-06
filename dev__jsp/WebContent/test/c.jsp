<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String result = null;
    
    if(request.getAttribute("text")!=null){
    	result = (String)request.getAttribute("text");
    }
 	out.print(result);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>