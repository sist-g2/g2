<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
						<h1 class="title">Update</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /상단 제목 -->

<!-- main -->
<!-- 필수 정보 -->
<div class="rowrow optionList">
	<h3 class="text-center">필수 정보</h3>
	<form name="frm" method="post" action="../member/member_update_ok.do">
	<table class="table table-borderless">
		<tr>
			<td class="text-left">아이디</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=id class="form-control" placeholder="ID" value="${vo.id }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td class="text-left">비밀번호</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=password name=pwd class="form-control" size=15 placeholder="비밀번호를 입력해주세요.">
			</td>
		</tr>
		<tr>
			<td class="text-left" >이름</td>
		</tr>
		<tr>
			<td>
				<input type=text name=name class="form-control" value="${vo.name }" readonly="readonly">
			</td>
		</tr>
		<!-- <tr>
			<td class="text-left">생년월일<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=year class="form-control2" style="width:26%" id="year" readonly="readonly">
				&nbsp;년&nbsp;&nbsp;&nbsp;
				<input type=text name=month class="form-control2" style="width:26%" id="month" readonly="readonly">
				&nbsp;월&nbsp;&nbsp;&nbsp;
				<input type=text name=day class="form-control2" style="width:26%" id="day" readonly="readonly">
				&nbsp;일
			</td>
		</tr>
		<tr>
			<td class="text-left" >전화번호</td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=tel1 class="form-control2" style="width:31%" value="${tel1 }">
					<option>010</option>
					<option>011</option>
					<option>017</option>
				</select>&nbsp;&nbsp;&nbsp;
				<input type=text name=tel2 class="form-control2"  style="width:31%" value="${tel2 }">&nbsp;&nbsp;-&nbsp;
				<input type=text name=tel3 class="form-control2"  style="width:31%" value="${tel3 }">
			</td>
		</tr> -->
		<tr>
			<td class="text-left">이메일</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=email class="form-control" value="${vo.email }">
			</td>
		</tr>
		<tr>
			<td class="text-left" >우편번호</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=post class="form-control2" style="width:58%"  value="${vo.post }">&nbsp;&nbsp;&nbsp;
				<input type=button class="btn btn-common2 uppercase" value="우편번호 검색" style="width:38%">
			</td>
		</tr>
		<tr>
			<td class="text-left" >주소</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr1 class="form-control" value="${vo.addr1 }">
			</td>
		</tr>
		<tr>
			<td class="text-left" >상세주소</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr2 class="form-control" value="${vo.addr2 }">
			</td>
		</tr>
	</table>
	
<!-- 필수 정보 -->
<!-- 선택 정보 -->
	<div class="rowrow optionList"></div>
	<table class="table table-borderless">
		<tr>
			<td  class="text-center">
				<input type=submit value="정보수정" class="btn btn-submit">
			</td>
		</tr>
		<tr>
			<td  class="text-center">
				<a href="../main/main.do">취소</a>
			</td>
		</tr>
	</table>
	</form>
</div>

<!-- /선택 정보 -->
<!-- /main -->

</body>
</html>