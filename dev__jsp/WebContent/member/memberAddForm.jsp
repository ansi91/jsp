<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/jEasyUICommon.jsp"%>
<script>
	function mem_Add(){
		$(opener.location).attr("href","javascript:fun()"); 
		$("#f_ins").attr("method","get");
		$("#f_ins").attr("action","./member.mvc2");
		$("#f_ins").submit();
		self.close();
	}
</script>
</head>
<body>
회원 가입 페이지 
<div id="dlg_ins" data-options="closed:false, title:'사원정보 등록',footer:'#d_ins', modal:'true'" class="easyui-dialog" style="width:100%;max-width:600px;padding:30px 60px">
		<form id="f_ins">
			<input type="hidden" name="crud" value="memberAdd">
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="mem_id" name="mem_id" label="회원아이디" data-options="prompt:'Enter a memberId'" style="width:150px">
			</div>
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="mem_name" name="mem_name" label="회원이름" data-options="prompt:'Enter a memberName'" style="width:150px">
			</div>
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="mem_pw" name="mem_pw" label="비밀번호" data-options="prompt:'Enter a password'" style="width:150px">
			</div>
					
			<div style="margin-bottom:10px">
				<input class="easyui-textbox" id="zipcode" name="zipcode" label="우편번호"  data-options="prompt:'Enter a ZIPCODE'" style="width:160px">
			<a id="btn_zipcode" href="#" class="easyui-linkbutton">우편번호찾기</a>
			</div>
					
			<div style="margin-bottom:10px">
			<input class="easyui-numberbox" id="mem_addr" name="mem_addr" label="집 주소"  data-options="prompt:'Enter a Address'" style="width:250px">
			</div>			
			<div style="margin-bottom:10px">
			</div>
						
		
			
		</form>
		<div id="d_ins" style="margin-bottom:10px">
			<a id="btn_save" href="javascript:mem_Add()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">저장</a> 
			<a id="btn_close" href="javascript:$('#dlg_ins').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">닫기</a> 
		</div>
	</div>
	
<br>

</body>
</html>