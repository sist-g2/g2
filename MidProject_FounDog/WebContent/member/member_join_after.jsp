<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		location.href="../member/member_login.do";
	});
	$('#mainBtn').click(function(){
		location.href="../main/main.do";
	});
});
</script>
<style type="text/css">
.rowrow{
	margin: 0px auto;
	width: 800px;
}
</style>
</head>
<body>
<div class="container">
	<div class="rowrow">
		<table>
			<tr>
				<td colspan="2" class="text-center">
					<img src="join_after.png">
				</td>
			</tr>
			<tr>
				<td class="text-center">
					<input type="button" class="btn-submit2" value="로그인 하기" id="loginBtn" style="width:250px;">
				</td>
				<td class="text-center">
					<input type="button" class="btn-submit2" value="메인으로 돌아가기" id="mainBtn" style="width:250px;">
				</td>
			</tr>
		</table>
		
	</div>
</div>
</body>
</html>