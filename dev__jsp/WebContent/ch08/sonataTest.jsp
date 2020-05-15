<%@page import="jsp.sonata.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Sonata sonata = new Sonata();
    	request.setAttribute("Sonata",sonata);
    	request.setAttribute("wheel", sonata.wheelNum);
    	request.setAttribute("color", sonata.color);
		
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function moveB(){
		$('#moveB').click({
			<%
				RequestDispatcher view = request.getRequestDispatcher("b.jsp");
				view.forward(request, response);
			%> 
		})
		
			
	}
</script>
</head>
<body>
<%
    out.print(sonata.color+" ," + sonata.wheelNum);
%>
<br>

<a href="#"  id="moveB">aasdasd</a>
</body>
</html>