<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css">
<style type="text/css">
.row {
	margin: 0px auto;
	width: 900px;
}
.btn-sm{
	background-color:#FFF;
	color:#A5732A;
}
</style>
<!-- 
     Javascript AND XML  => AJAX
 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#delBtn').click(function(){

		var no=$('#no').val();
		$.ajax({
			type:'post',
			url:'qna_board_delete_ok.do',
			data:{no:no},
			success:function(response)
			{
				location.href="../qnaboard/qna_board_list.do";
			}
		}); 
		});
	});
</script>
</head>
<body>
	<%-- 삭제하기  --%>
	<div class="container">
		<h2 class="text-center">삭제하기</h2>
		<div class="row">
			<form id="boardDelForm" method="post" action="qna_board_delete_ok.do">
				<table class="table">
					<tr>
						<input type=hidden name=no value="${no }" id="no"></td>
					</tr>
					<tr>
						<td class="text-center" >
						<input type=button value="삭제" class="btn btn-sm" id="delBtn">
						<input type=button value="취소" class="btn btn-sm" onclick="javascript:history.back()">
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>