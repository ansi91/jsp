<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	Cookie[] cookies = request.getCookies();
	String h_no = null;
	if(cookies!= null && cookies.length > 0){
		for (int i = 0; i < cookies.length; i++){
			if ("c_hno".equals(cookies[i].getName())){
				h_no = cookies[i].getValue();
			}
		}
	}
	out.print("c_hno:"+h_no);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키활용처리 </title>
<script type="text/javascript">
function start(){
	location.href="test1.jsp";
}
</script>
</head>
<body>
<form method="get" action="test1.jsp">
	<input type="hidden" name="h_no" value="20200515001">
	<input type="hidden" name="h_name" value="이수신">
	<input type="submit" onclick="statrt()" value="시험시작">

</form>
</body>
</html>