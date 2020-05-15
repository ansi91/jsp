<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:useBean id="test" scope="request" class="chap08.MemberInfo"></jsp:useBean>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
   		var cb;
   		var a=0;
   		document.addEventListener("DOMContentLoaded", function(){
   			db = document.getElementsByName("cb");
   			
   		});
   		function select(e){
   			if(e.target.checked = true){
   				a = e.target.value;
   			}else{
   				a=0;
   			}
   			for(var i=0; i<cb.length; i++){
   				if(cb[i].value!=a){
   					cb[i].checked = false;
   				}else{
   					ch[i].checked = true;
   				}
   			}
   		}
   		function next(){
   			if(a!=0){
   				location.href="cookieTest2.jsp?cookieTest1=" +a;
   			}else{
   				alert("답을 선택해주세요")
   			}
   		}
    </script>
    <style>
    	#d_sel{font-size:20px;}
    </style>
    
</head>
<body>



	<div id="d_sel">
	<span style="font-weight:bold; font-size:20px">문제1 서블릿 메소드의 호출 순서로 맞는 것은?</span><br>
	<input type="checkbox" name="cb" value=1 onchange="select(event)">① init() - service() - destroy() <br>
	<input type="checkbox" name="cb" value=1 onchange="select(event)">② service() - destroy() - init() <br>
	<input type="checkbox" name="cb" value=1 onchange="select(event)">③ destroy() - init() - service() <br>
	<input type="checkbox" name="cb" value=1 onchange="select(event)">④ doGet() - destroy() - init() - service() <br><br>
	<button onclick="next()" class="easyui-linkbutton">다음 문제</button>
	</div>
</body>
</html>