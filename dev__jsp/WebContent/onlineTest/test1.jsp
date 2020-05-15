<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--MIME타입을 보고 html인것을 알아야한다  -->
<meta charset="UTF-8">
<title>문제1</title>
<%@include file="../common/jEasyUICommon.jsp" %>
	<script type="text/javascript">
		function test(dap){ //수험자가 선택한 답안을 
//			alert("당신이 선택한 답은" +dap +"입니다.")
		for(var i=0;i<document.getElementById("f_test1").cb.length;i++){
			if(dap==i){
				document.getElementById("f_test1").cb[i].checked=1;
			}	else{
				document.getElementById("f_test1").checked=0;
			}
		 }
		}
		
		function next(){ //다음 문제로 갈 때 
			//수험자가 입력한 답안 저장하기
			var temp=1;
			for(var i=0;i<document.getElementById("f_test1").cb.length;i++){
				if(document.getElementById("f_test1").cb[i].checked==1){
					document.getElementById("f_test1").htest1.value = temp;
					
				}
				else{
					temp= temp+1;
				}
			}
			alert("temp:" + temp);
			document.getElementById('f_test1').submit();
			//$("#f_test1")
		}
	</script>
	<style>
		#f_test1{ font-size:22px;}
	</style>

</head>
<body>
<form id="f_test1" method="get" action="test2.jsp">
<input type="hidden" name="htest1"> 


	문제1<br>
	서블릿 메소드의 호출 순서로 맞는 것은?<br>
	<input type="checkbox" name="cb" onChange="test(0)"> 
	① init() - service() - destroy()<br>
	<input type="checkbox" name="cb" onChange="test(1)"> 
	② service() - destroy() - init()<br>
	<input type="checkbox" name="cb" onChange="test(2)"> 
	③ destroy() - init() - service()<br>
	<input type="checkbox" name="cb" onChange="test(3)"> 
	④ doGet() - destroy() - init() - service()<br>
</form>
<br>

<button onclick="next()">다음 문제</button>
</body>
</html>