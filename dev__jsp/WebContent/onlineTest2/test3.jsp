<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
		String htest2 = request.getParameter("htest2");
		Cookie chtest2 = new Cookie ("htest2",htest2);
		chtest2.setMaxAge(60*60);
		response.addCookie(chtest2);
	%>
    
<!DOCTYPE html>
<html>
<head>
<!--MIME타입을 보고 html인것을 알아야한다  -->
<meta charset="UTF-8">
<title>문제3</title>
<%@include file="../common/jEasyUICommon.jsp" %>
	<script type="text/javascript">
		function test(dap){ //수험자가 선택한 답안을 
//			alert("당신이 선택한 답은" +dap +"입니다.")
		for(var i=0;i<document.getElementById("f_test3").cb.length;i++){
			if(dap==i){
				document.getElementById("f_test3").cb[i].checked=1;
			}	else{
				document.getElementById("f_test3").checked=0;
			}
		 }
		}
		//이전문제로 이동하기
		function prev(){
			//redirect의 특징 유지안됨, d
			location.href="test2.jsp"
		}
		function next(){ //다음 문제로 갈 때 
			//수험자가 입력한 답안 저장하기
			var temp=1;
			for(var i=0;i<document.getElementById("f_test3").cb.length;i++){
				if(document.getElementById("f_test3").cb[i].checked==1){
					document.getElementById("f_test3").htest3.value = temp;
					
				}
				else{
					temp= temp+1;
				}
			}
	//		alert("temp:" + temp);
			document.getElementById('f_test3').submit();
			//$("#f_test1")
		}
	</script>
	<style>
		#f_test3{ font-size:22px;}
	</style>

</head>
<body>
<form id="f_test3" method="get" action="test4.jsp">
<input type="hidden" name="htest3">

	문제3<br>
	자바를 이용하여 오라클과 같은 db서버에 접속하여 조회, 입력,수정, 삭제와 같은 업무처리를<br>
	하고 싶다. 이때 오라클에서 제공하는 드라이버 클래스를 가지고 있는 ojdbc6.jar를 참조해야<br>
	하는데 이 파일의 배포 위치로 맞는 것을 고르시오.<br>
	<input type="radio" name="cb" onChange="test(0)"> 
	① WEB-INF\classes<br>
	<input type="radio" name="cb" onChange="test(1)"> 
	② WEB-INF\lib<br>
	<input type="radio" name="cb" onChange="test(2)"> 
	③ WEB-INF\jspBean<br>
	<input type="radio" name="cb" onChange="test(3)"> 
	④ WEB-INF\jsp<br>
</form>
<br>
<button onclick="prev()">이전 문제</button>
<button onclick="next()">다음 문제</button>
</body>
</html>