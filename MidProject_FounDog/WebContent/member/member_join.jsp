<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<h1 class="title">Join</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /상단 제목 -->

<!-- main -->
<!-- 필수 정보 -->
<div class="row">
	<h3 class="text-center">필수 정보</h3>
	<table class="table table-borderless">
		<tr>
			<td class="text-right" width=40%>ID</td>
			<td class="text-left" width=60%>
				<input type=text name=id class="form-control2" size=15>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type=button class="btn btn-common2 uppercase" value="중복체크">
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>Password</td>
			<td class="text-left" width=60%>
				<input type=password name=pwd class="form-control2" size=15>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type=password name=pwd1 class="form-control2" size=15 placeholder="비밀번호 확인">
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>이름</td>
			<td class="text-left" width=60%>
				<input type=text name=name class="form-control2" size=15>
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>생년월일</td>
			<td class="text-left" width=60%>
				<select name=year class="form-control2">
					<option></option>
					<option>2019</option>
					<option>2018</option>
				</select>년&nbsp;
				<select name=month class="form-control2">
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
				</select>월&nbsp;
				<select name=day class="form-control2">
					<option></option>
					<option>1</option>
					<option>2</option>
				</select>일&nbsp;
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>성별</td>
			<td class="text-left" width=60%>
				<input type=radio value="남자" name=sex checked="checked">남자&nbsp;
				<input type=radio value="여자" name=sex>여자
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>전화번호</td>
			<td class="text-left" width=60%>
				<select name=tel1 class="form-control2">
					<option>010</option>
					<option>011</option>
					<option>017</option>
				</select>&nbsp;
				<input type=text name=tel2 class="form-control2" size=10>&nbsp;&nbsp;-&nbsp;
				<input type=text name=tel3 class="form-control2" size=10>
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>우편번호</td>
			<td class="text-left" width=60%>
				<input type=text name=post class="form-control2" size=10 readonly="readonly">&nbsp;&nbsp;
				<input type=button class="btn btn-common2 uppercase" value="우편번호 검색">
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>주소</td>
			<td class="text-left" width=60%>
				<input type=text name=addr1 class="form-control2" size=55>
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>상세주소</td>
			<td class="text-left" width=60%>
				<input type=text name=addr2 class="form-control2" size=55>
			</td>
		</tr>
	</table>
<!-- /필수 정보 -->
<!-- 선택 정보 -->
	<div class="row2"></div>
	<h3 class="text-center">선택 정보</h3>
	<table class="table table-borderless">
		<tr>
			<td class="text-right" width=40%>반려견 이름</td>
			<td class="text-left" width=60%>
				<input type=text name=dname class="form-control2" size=15>
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>견종</td>
			<td class="text-left" width=60%>
				<input type=text name=dtype class="form-control2" size=15>
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>반려견 생년월일</td>
			<td class="text-left" width=60%>
				<select name=dyear class="form-control2">
					<option></option>
					<option>2019</option>
					<option>2018</option>
				</select>년&nbsp;
				<select name=dmonth class="form-control2">
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
				</select>월&nbsp;
				<select name=dday class="form-control2">
					<option></option>
					<option>1</option>
					<option>2</option>
				</select>일&nbsp;
			</td>
		</tr>
		<tr>
			<td class="text-right" width=40%>반려견 성별</td>
			<td class="text-left" width=60%>
				<input type=radio value="수컷" name=dsex checked="checked">수컷&nbsp;
				<input type=radio value="암컷" name=dsex>암컷
			</td>
		</tr>
		<tr>
			<td colspan="2" class="text-center">
				<input type=button class="btn btn-common2 uppercase" value="반려견 추가">
			</td>
		</tr>
		<tr>
			<td colspan="2" class="text-center">
				<input type=submit value="가입" class="btn btn-submit2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type=submit value="취소" class="btn btn-submit2" onclick="javascript:history.back()">
			</td>
		</tr>
	</table>
</div>
<!-- /선택 정보 -->
<!-- /main -->

</body>
</html>