<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/member.css" rel="stylesheet">
<style type="text/css">
.row{
	margin: 0px auto;
	width: 1200px;
}
</style>
</head>
<body>
<!-- 상단 제목 -->
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">회원 탈퇴</h1>
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
			<table class="table table-borderless">
				<tr>
					<th class="text-right" width=40%>ID</th>
					<td class="text-left" width=60%>
						<input type=text name=id class="form-control2" size=25>&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<th class="text-right" width=40%>Password</th>
					<td class="text-left" width=60%>
						<input type=password name=pwd class="form-control2" size=25>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="#" class="btn btn-common uppercase">회원 탈퇴</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#" class="btn btn-common uppercase">취소</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</section>
<!-- /main -->

</body>
</html>