<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css" >
<style type="text/css">
.row {
	margin: 0px auto;
	width: 900px;
}
.btn-sm{
	background-color:#FFF;
	color:#A5732A;
}
th{
	background-color:#FFF;
	color:#A5732A;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#qna_updBtn').click(function(){
		var subject=$('#sub').val();
		if(subject.trim()=="") {
			$('#sub').focus();
			return;
		}
		var content=$('#cont').val();
		if(content.trim()=="") {
			$('#cont').focus();
			return;
		}
		
		if(confirm("수정하시겠어요??")) {
			$('#qna_boardUpdForm').submit();
		} else {
			return;
		}
	});
});
</script>
</head>
<body>
<div class="container" >
	<h2 class="text-center" >수정하기</h2>
	<div class="row" >
		<form id="qna_boardUpdForm" method="post" action="qna_board_update_ok.do" >
			<table class="table" >
				<tr>
					<th class="text-right" width=20% >이름</th>
					<td width=80% class="text-left">
						<input type="text" name="id" size=15 value="${vo.id }" id="id" readonly="readonly" >
						<input type="hidden" name="no" value="${vo.no }" id="no">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >제목</th>
					<td width=80% class="text-left">
						<input type="text" name="subject" size=45 value="${vo.subject }" id="sub">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >내용</th>
					<td width=80% class="text-left">
						<textarea rows="10" cols="55" name="content" id="cont" >${vo.content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan=2 class="text-center" >
						<input type="button" value="수정" class="btn btn-sm" id="qna_updBtn" >
						<input type="button" value="취소" class="btn btn-sm" onclick="javascript:history.back()" >
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>