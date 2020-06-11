<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/jEasyUICommon.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
	function go(){
	 	var i_text =$('#t').val();
		alert("i_text : " + i_text);
		location.href="a.mvc3?a="+i_text 
				
		/* $.ajax({
			url:"a.mvc3?a="+i_text
		   ,method:'get'
		   ,dataType:'json'
		   ,success:function(data){
			   data = data.trim();
			   alert(data);
			   console.log(data); */
			  /*  $('#tb_a').datagrid({
					data: [
						{f1:'text', f2:data}
					]
			}); 
			}
		});		*/
	}
</script>

</head>
<body>
<input type="text" id="t"/> 
<input type="button" onClick="go()"/>
<table id="tb_a" class="easyui-datagrid">
    <thead>
        <tr>
            <th data-options="field:'TEXT'">Code</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td></td>
        </tr>
    </tbody>
</table>
</body>
</html>