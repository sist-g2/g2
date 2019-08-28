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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.btn-primary').click(function(){
		var name=$('#name').val();
		if(name.trim()==""){
			$('#name').focus();
			return;
		}
		var subject=$('#sub').val();
		if(subject.trim()==""){
			$('#sub').focus();
			return;
		}
		var content=$('#cont').val();
		if(content.trim()==""){
			$('#cont').focus();
			return;
		}
		var pwd=$('#pwd').val();
		if(pwd.trim()==""){
			$('#pwd').focus();
			return;
		}
		var no=$('#no').val();
		
		// 전송
		$.ajax({
			type:'POST',
			url:'../board/board_update_ok.do',
			data:{no:no,name:name,subject:subject,content:content,pwd:pwd},
			success:function(response){
				var i=response.trim();
				if(i==0){
					alert("비밀번호가 틀립니다!!!");
					$('#pwd').val("");
					$('#pwd').focus();
				}else{
					location.href="../board/board_detail.do?no="+i;
				}
			}
		});
	});
});
</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">수정하기</h2>
		<div class="row">
			<form method="post" action="board_update_ok.do">
				<table class="table">
					<tr>
						<th class="text-right info" width=20%>이름</th>
						<td width=80% class="text-left">
						<input type=text name=name size=15 class="input-sm" value="${vo.name }" id=name> 
						<input type=hidden name=no value="${vo.no }" id="no"></td>
					</tr>
					<tr>
						<th class="text-right info" width=20%>제목</th>
						<td width=80% class="text-left">
						<input type=text name=subject size=45 class="input-sm" value="${vo.subject }" id="sub"></td>
					</tr>
					<tr>
						<th class="text-right info" width=20%>내용</th>
						<td width=80% class="text-left">
						<textarea rows="10" cols="55" name=content id="cont">${vo.content }</textarea>
						</td>
					</tr>
					<tr>
						<th class="text-right info" width=20%>비밀번호</th>
						<td width=80% class="text-left">
						<input type="password" name=pwd size=10 class="input-sm" id="pwd"></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
						<input type="button" value="수정" class="btn btn-sm btn-primary"> 
						<input type="button" value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>