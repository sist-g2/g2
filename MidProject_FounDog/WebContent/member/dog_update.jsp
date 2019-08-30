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
.optionList td input+label {
	display: inline-block;
	border-radius: 6px;
	background: #ffffff;
	margin-right: 3px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	color: #d29949;
}

.optionList td label {
	font-weight: 400;
}

.optionList td input[type=checkbox]:checked + label {
	background: #bd8942;
	color: #ffffff;
}

.optionList td input[type=radio]:checked + label {
	background: #bd8942;
	color: #ffffff;
}
tbody{
	width: 400px !important;
	display: table;
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
						<h1 class="title">MyPage</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /상단 제목 -->

<form id="dogInsert" name="frm" method="post" action="../member/dog_insert_ok.do">
<div class="rowrow optionList">
	<table class="table table-borderless rowrow" style="width:400px">
		<tr>
			<td class="text-center"><h3 class="text-center">반려견 정보</h3></td>
		</tr>
	</table>
	<table class="table table-borderless" style="width:400px">
		<tr>
			<td class="text-left" >반려견 이름</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=dname class="form-control" size=15 placeholder="Dog Name" value="${dvo.dname }">
			</td>
		</tr>
		<tr>
			<td class="text-left" >견종</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=dtype class="form-control" size=15 placeholder="Dog breeds" value="${dvo.dtype }">
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 생년월일</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=dyear class="form-control2" style="width:26%" value="${dvo.dbirth.substring(0,4) }">
					&nbsp;년&nbsp;&nbsp;&nbsp;
				<input type=text name=dmonth class="form-control2" style="width:26%" value="${dvo.dbirth.substring(5,7) }">
					&nbsp;월&nbsp;&nbsp;&nbsp;
				<input type=text name=dday class="form-control2" style="width:26%"  value="${dvo.dbirth.substring(8,10) }">
					&nbsp;일
			</td>
		</tr>
	</table>
	<table class="table table-borderless" style="width:400px;">
		<tr>
			<td  class="text-center">
				<input type=submit value="반려견 정보 변경" class="btn btn-submit" id="addDog">
			</td>
		</tr>
		<tr>
			<td  class="text-center">
				<a href="../member/member_mypage.do">취소</a>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>