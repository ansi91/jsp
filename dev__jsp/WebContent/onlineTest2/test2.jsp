<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String htest1 = request.getParameter("htest1");
    	Cookie chtest1 = new Cookie ("chtest1",htest1);
    	chtest1.setMaxAge(60*60);
    	response.addCookie(chtest1);
    %>
    
<!DOCTYPE html>
<html>
<head>
<!--MIME타입을 보고 html인것을 알아야한다  -->
<meta charset="UTF-8">
<title>문제2</title>
<%@include file="../common/jEasyUICommon.jsp" %>
	<script type="text/javascript">
		function test(dap){ //수험자가 선택한 답안을 
//			alert("당신이 선택한 답은" +dap +"입니다.")
		for(var i=0;i<document.getElementById("f_test2").cb.length;i++){
			if(dap==i){
				document.getElementById("f_test2").cb[i].checked=1;
			}	else{
				document.getElementById("f_test2").checked=0;
			}
		 }
		}
		//이전문제로 이동하기
		function prev(){
			//redirect의 특징 유지안됨, d
			location.href="test1.jsp"
		}
		function next(){ //다음 문제로 갈 때 
			//수험자가 입력한 답안 저장하기
			var temp=1;
			for(var i=0;i<document.getElementById("f_test2").cb.length;i++){
				if(document.getElementById("f_test2").cb[i].checked==1){
					document.getElementById("f_test2").htest2.value = temp;
					
				}
				else{
					temp= temp+1;
				}
			}
	//		alert("temp:" + temp);
			document.getElementById('f_test2').submit();
			//$("#f_test1")
		}
	</script>
	<style>
		#f_test2{ font-size:22px;}
	</style>

</head>
<body>
<form id="f_test2" method="get" action="test3.jsp">
<input type="hidden" name="htest2">
	문제2<br>
	조회한 결과를 DB서버에서 가져온 후 결과를 List에 담았다. 이것을 화면단에 출력하고자 할 때 사용할 메소드 이름은 무엇인지 고르시오.<br>
	<input type="radio" name="cb" onChange="test(0)"> 
	① forward(request, response)<br>
	<input type="radio" name="cb" onChange="test(1)"> 
	② sendRedirect("페이지 이름“)<br>
	<input type="radio" name="cb" onChange="test(2)"> 
	③ toString()<br>
	<input type="radio" name="cb" onChange="test(3)"> 
	④ print()<br>
</form>
<br>
<button onclick="prev()">이전 문제</button>
<button onclick="next()">다음 문제</button>
</body>
</html>