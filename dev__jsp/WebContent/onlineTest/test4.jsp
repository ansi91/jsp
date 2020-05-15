<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String htest1 = request.getParameter("htest1");
    	String htest2 = request.getParameter("htest2");
    	String htest3 = request.getParameter("htest3");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<!--MIME타입을 보고 html인것을 알아야한다  -->
<meta charset="UTF-8">
<title>문제4</title>
<%@include file="../common/jEasyUICommon.jsp" %>
	<script type="text/javascript">
		function test(dap){ //수험자가 선택한 답안을 
//			alert("당신이 선택한 답은" +dap +"입니다.")
		for(var i=0;i<document.getElementById("f_test4").cb.length;i++){
			if(dap==i){
				document.getElementById("f_test4").cb[i].checked=1;
			}	else{
				document.getElementById("f_test4").checked=0;
			}
		 }
		}
		function prev(){
			//redirect의 특징 유지안됨, d
			location.href="test3.jsp"
		}
		function next(){ //다음 문제로 갈 때 
			//수험자가 입력한 답안 저장하기
			var temp=1;
			for(var i=0;i<document.getElementById("f_test4").cb.length;i++){
				if(document.getElementById("f_test4").cb[i].checked==1){
					document.getElementById("f_test4").htest4.value = temp;
					
				}
				else{
					temp= temp+1;
				}
			}
			alert("temp:" + temp);
			document.getElementById('f_test4').submit();
			//$("#f_test1")
		}
	</script>
	<style>
		#f_test4{ font-size:22px;}
	</style>

</head>
<body>
<form id="f_test4" method="get" action="send.jsp">
<input type="hidden" name="htest1"  value="<%=htest1 %>">
<input type="hidden" name="htest2"  value="<%=htest2 %>">
<input type="hidden" name="htest3"  value="<%=htest3 %>">
<input type="hidden" name="htest4"  >

	문제4<br>
	서블릿 메소드의 호출 순서로 맞는 것은?<br>
	<input type="checkbox" name="cb" onChange="test(0)"> 
	① page: 기본값이며 그 페이지 내에서만 접근할 수 있다.<br>
	<input type="checkbox" name="cb" onChange="test(1)"> 
	② request: forward, include에서 사용가능하다.<br>
	<input type="checkbox" name="cb" onChange="test(2)"> 
	③ session: 사용자가 로그인 하면 시간에 제약없이 무한히 유지된다.<br>
	<input type="checkbox" name="cb" onChange="test(3)"> 
	④ application: 서버를 재기동하기 전까지는  시간에 제약없이 무한히 유지된다.<br>
</form>
<br>
<button onclick="prev()">이전 문제</button>
<button onclick="next()">다음 문제</button>
</body>
</html>