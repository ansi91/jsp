<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
	function go(){
	 	var i_text =$('#t').val();
		alert("i_text : " + i_text);
		location.href="a.mvc3?a="+i_text
		
	}
</script>

</head>
<body>



<input type="text" id="t"/> 
<input type="button" onClick="go()"/>

</body>
</html>