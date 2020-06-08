<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/jEasyUICommon.jsp" %>

</head>
<body>
<!--   새 글과 댓글은 어떻게 구분하나요?         트랜잭션 -> commit, rollback 중요
	새 글은 글번호(bm_no)가 없고 
	댓글 달기는 글번호(bm_no)가 이미 있으므로 글번호로 구분한다
		if (bm_no > 0)      -->

<!--################새 글 일때[ list.jsp->글쓰기버튼을 누르면 ]##################   -->
<div id="f_write" data-options="title:'사원정보 등록',footer:'#d_ins', modal:'true'" class="easyui-dialog" style="width:100%;max-width:600px;padding:30px 60px">
		<input type="hidden" name="cud" value="INS">
		<form id="f_ins">
		
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="bm_title" name="bm_title" label="제목" data-options="prompt:'Enter a 제목'" style="width:250px">
			</div>
			
			
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="bm_writer" name="bm_writer" label="작성자" data-options="prompt:'Enter a 작성자'" style="width:250px">
			</div>
			
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="bm_email" name="bm_email" label="이메일" data-options="prompt:'Enter a 이메일'" style="width:250px">
			</div>
			
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="bm_content" name="bm_content" label="내용" data-options="prompt:'Enter a 내용',height:300,multiline:'true'" style="width:250px">
			</div>
		
		</form>
		<div id="d_ins" style="margin-bottom:10px">
			<a id="btn_save" href="javascript:board_ins()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">저장</a> 
			<a id="btn_close" href="javascript:$('#dlg_ins').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">닫기</a> 
		</div>
<!--################새 글 일때 끝##################   -->


<!--################댓글 일때 [ read.jsp ]##################   -->
<form id="f_reple">
	<input type="hidden" name="bm_no" value="<%=5 %> "/>
	<input type="hidden" name="bm_group" value="<%=2 %> "/>
	<input type="hidden" name="bm_pos" value="<%=0 %> "/>
	<input type="hidden" name="bm_step" value="<%=0 %> "/>
	
</form>
<!--################댓글 일때 끝##################   -->

</body>
</html>