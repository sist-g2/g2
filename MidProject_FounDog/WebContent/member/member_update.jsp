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
				<input type=text name=id class="form-control2" style="width:70%" placeholder="ID" value="${id }">&nbsp;
				<input type=button class="btn btn-common2" style="width:28%" value="중복체크">
			</td>
		</tr>
		<tr>
			<td class="text-left">비밀번호</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=password name=pwd class="form-control" size=15 placeholder="Password">
			</td>
		</tr>
		<tr>
			<td class="text-left" >이름</td>
		</tr>
		<tr>
			<td >
				<input type=text name=name class="form-control" placeholder="Name" value="${name }">
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
		</tr>
		<tr>
			<td class="text-left">이메일</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=email class="form-control" placeholder="E-mail" value="${email }">
			</td>
		</tr>
		<tr>
			<td class="text-left" >우편번호</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=post class="form-control2" style="width:58%"  value="${post }">&nbsp;&nbsp;&nbsp;
				<input type=button class="btn btn-common2 uppercase" value="우편번호 검색" style="width:38%">
			</td>
		</tr>
		<tr>
			<td class="text-left" >주소</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr1 class="form-control" placeholder="Address" value="${addr1 }">
			</td>
		</tr>
		<tr>
			<td class="text-left" >상세주소</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr2 class="form-control" placeholder="Detailed Address" value="${addr2 }">
			</td>
		</tr>
	</table>
	
<!-- 필수 정보 -->
<!-- 선택 정보 -->
	<div class="rowrow optionList"></div>
	<h3 class="text-center">선택 정보</h3>
	<table class="table table-borderless">
		<tr>
			<td class="text-left" >반려견 이름</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=dname class="form-control" size=15 placeholder="Dog Name">
			</td>
		</tr>
		<tr>
			<td class="text-left" >견종</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=dtype class="form-control" size=15 placeholder="Dog breeds">
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 생년월일</td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=dyear class="form-control2" style="width:27%">
					<option></option>
					<option>2019</option>
					<option>2018</option>
				</select>&nbsp;년&nbsp;&nbsp;&nbsp;
				<select name=dmonth class="form-control2" style="width:27%">
					<option></option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option>11</option>
					<option>12</option>
				</select>&nbsp;월&nbsp;&nbsp;&nbsp;
				<select name=dday class="form-control2" style="width:27%">
					<option></option>
					<option>1</option>
					<option>2</option>
				</select>&nbsp;일
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 성별</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=radio value="수컷" name=dsex checked="checked" style="display: none;">
				<label for="dsex">&nbsp;&nbsp;수컷&nbsp;&nbsp;</label>
				<input type=radio value="암컷" name=dsex style="display: none;">
				<label for="dsex">&nbsp;&nbsp;암컷&nbsp;&nbsp;</label>
			</td>
		</tr>
		<tr>
			<td  class="text-center">
				<input type=button class="btn btn-common2 uppercase" value="반려견 추가">
			</td>
		</tr>
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