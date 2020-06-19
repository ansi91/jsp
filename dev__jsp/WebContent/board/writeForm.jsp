<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  공통코드 영역 (화면공통코드, 인증처리) -->
<!-- $가 undefine 정의가 안되었다. -->
<%@include file="../common/jEasyUICommon.jsp" %>
<script type="text/javascript">
//easyui에서 모달창을 띄우는 페이지가 list.jsp가 아닌 writeForm.jsp페이지를
//독립적으로 구현했다 하더라도 저장버튼에 대한 이벤트 처리 함수는 
//list.jsp에서 선언 및 구현 할것.
/* 	function board_ins(){
		alert("저장호출 성공");
		$("#f_write").attr("method","get");
		$("#f_write").attr("action","./boardINS.mvc3");
		$("#f_write").submit();
	} */
</script>
</head>
<body>
<!-- 새글 일때[list.jsp->글쓰기버튼을 누르면] 
새글과 댓글은 어떻게 구분하나요?
-->
<form id="f_write" method="post" enctype="multipart/form-data">
<input type="hidden" name="cud" value="INS">

    <table align="center" id="p" class="easyui-panel" title="글상세보기" data-options="footer:'#tb_read'"
        style="width:670px;height:380px;padding:10px;background:#fafafa;">
	    	<tr>
	    	<td>제목</td>
	    	<td><input id="bm_title"  name="bm_title" data-options="width:'450px'" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    	<td>작성자</td>
	    	<td><input id="bm_writer"  name="bm_writer" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    	<td>이메일</td>
	    	<td><input id="bm_email"  name="bm_email" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    	<td>내용</td>
	    	<td><input id="bm_content"  name="bm_content" data-options="multiline:'true', width:'570px', height:'90px'" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    	<td>비밀번호</td>
	    	<td><input id="bm_pw"  name="bm_pw" class="easyui-passwordbox"></td>
	    	</tr>	    	
	   </table>		
		<div id="d_ins" style="margin-bottom:10px">
			<a id="btn_save" href="javascript:board_ins()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">저장</a> 
			<a id="btn_close" href="javascript:$('#dlg_ins').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">닫기</a> 
		</div>
</form>


<!-- 댓글 일때[read.jsp] -->
<form id="f_reple">
	<input type="hidden" name="bm_no" value="<%=5%>"/>
	<input type="hidden" name="bm_group" value="<%=2%>"/>
	<input type="hidden" name="bm_pos" value="<%=0%>"/>
	<input type="hidden" name="bm_step" value="<%=0%>"/>
</form>
</body>
</html>