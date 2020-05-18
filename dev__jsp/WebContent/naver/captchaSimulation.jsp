<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jEasyUICommon.jsp" %>
<script type="text/javascript">
	var g_key; //키 값을 담을 전역변수
	function getCaptchaKey(){
		$.ajax({
			method:'get'
			,url:'getCaptchaImage.jsp'
			,success:function(result){
//				alert(result);
				var imsi = result.split("?");
				var key = imsi[1];
				g_key = key.substring(4,20);
				$('#captchaIMG').attr("src",result);
				
			}
		});
	}
	//getCaptchaKey 함수에서 결정된 키가 여기서 필요함 그렇다면 전역인가, 지역인가
	function captchaAccount(){
		var user = $("#user").val();
		$.ajax({
			method:"get"
			,url:"captchaAccount.jsp?user="+user+"&key="+g_key
			,success:function(data){
				var isOK= JSON.parse(data).result;
				if(isOK==true){
					alert("일치");
				}else{
					alert("불일치");
				}
			}
		});
	}
</script>
</head>
<body onLoad="getCaptchaKey()">
<img id="captchaIMG"  width="200px" height="90px"/>
<button onclick="getCaptchaKey()">새로 고침</button>
<hr>
<input type="text" name="user" id="user">
<button onclick="captchaAccount()">판정</button>
</body>
</html>