<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/member.css" rel="stylesheet">
<style type="text/css">
.rowrow{
	margin: 0px auto;
	width: 400px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#upPwdBtn').click(function(){
		var id = $('#id').val();
		var pwd = $('#pwd').val();
		
		if(id.trim()==""){
			alert("아이디를 입력해주세요.")
			$('#id').focus();
			return;
		}
		if(pwd.trim()==""){
			alert("비밀번호를 입력해주세요.")
			$('#pwd').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/member_update_pwd_ok.do',
			data:{id:id, pwd:pwd},
			success:function(response){
				var res = response.trim();
				if(res=="0"){
					alert("비밀번호가 틀립니다.");
					$('#pwd').val("");
					$('#pwd').focus();
				} else if(res=="1") {
					location.href="../member/member_update.do";
				}
			}
		});
	});
});
</script>
</head>
<body>

<!-- 상단 제목 -->
<section id="page-breadcrumb">
	<div class="vertical-center">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">MyPage</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /상단 제목 -->

<div class="row2"></div>

<!-- main -->
<section id="shortcodes">
	<div class="container">
		<div class="live-preview text-center">
			<div class="rowrow">
			<table class="table table-borderless">
				<tr>
					<td colspan="2">
						<input type=text id=id name=id class="form-control" placeholder="아이디" style="height: 50px;" value="${id }" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type=password name=pwd id=pwd class="form-control" placeholder="비밀번호" style="height: 50px;">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="회원 수정" id="upPwdBtn" class="btn btn-submit uppercase" style="height: 50px;">
					</td>
				</tr>
				<tr>
					<td>
						<a href="../member/member_mypage.do">취소</a>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
</section>
<!-- /main -->

</body>
</html>