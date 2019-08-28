<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#overBtn').click(function(){
		var id = $('#id').val();
		
		if(id.trim()==""){
			alert("아이디를 입력해주세요.")
			$('#id').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/member_jungbok.do',
			data:{id:id},
			success:function(response){
				var count = response.trim();
				if(count==1){
					alert("이미 사용 중인 ID입니다. 다른 ID를 입력해주세요.");
					$('#id').val("");
					$('#id').focus();
				} else if(count==0) {
					alert("사용 가능한 ID입니다.");
				}
			}
		});
	});
});
</script>
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
<div class="rowrow optionList">
	<h3 class="text-center">필수 정보</h3>
	<form name="frm" method="post" action="../member/member_join_ok.do">
	<table class="table table-borderless">
		<tr>
			<td class="text-left">아이디</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=id class="form-control2" style="width:70%" placeholder="ID" id="id">&nbsp;
				<input type=button class="btn btn-common2" style="width:28%" value="중복체크" id="overBtn">
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
			<td >
				<input type=password name=pwd1 class="form-control" size=15 placeholder="Confirm Password">
			</td>
		</tr>
		<tr>
			<td class="text-left" >이름</td>
		</tr>
		<tr>
			<td >
				<input type=text name=name class="form-control" placeholder="Name">
			</td>
		</tr>
		<tr>
			<td class="text-left">생년월일</td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=year class="form-control2" style="width:27%">
					<option></option>
					<option>2019</option>
					<option>2018</option>
				</select>&nbsp;년&nbsp;&nbsp;&nbsp;
				<select name=month class="form-control2" style="width:27%">
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
				<select name=day class="form-control2" style="width:27%">
					<option></option>
					<option>1</option>
					<option>2</option>
				</select>&nbsp;일
			</td>
		</tr>
		<tr>
			<td class="text-left" >성별</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=radio value="남자" name=sex checked="checked" id="sex_male" style="display: none;">
				<label for="sex_male">&nbsp;&nbsp;남자&nbsp;&nbsp;</label>
				<input type=radio value="여자" name=sex id="sex_female" style="display: none;">
				<label for="sex_female">&nbsp;&nbsp;여자&nbsp;&nbsp;</label>
			</td>
		</tr>
		
		<tr>
			<td class="text-left" >전화번호</td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=tel1 class="form-control2" style="width:31%">
					<option>010</option>
					<option>011</option>
					<option>017</option>
				</select>&nbsp;&nbsp;&nbsp;
				<input type=text name=tel2 class="form-control2"  style="width:31%">&nbsp;&nbsp;-&nbsp;
				<input type=text name=tel3 class="form-control2"  style="width:31%">
			</td>
		</tr>
		<tr>
			<td class="text-left">이메일</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=email class="form-control" placeholder="E-mail">
			</td>
		</tr>
		<tr>
			<td class="text-left" >우편번호</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=post class="form-control2" style="width:58%">&nbsp;&nbsp;&nbsp;
				<input type=button class="btn btn-common2 uppercase" value="우편번호 검색" style="width:38%">
			</td>
		</tr>
		<tr>
			<td class="text-left" >주소</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr1 class="form-control" placeholder="Address">
			</td>
		</tr>
		<tr>
			<td class="text-left" >상세주소</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr2 class="form-control" placeholder="Detailed Address">
			</td>
		</tr>
	</table>
	
<!-- /필수 정보 -->
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
				<input type=radio value="수컷" name=dsex checked="checked" style="display: none;" id="dsex-male">
				<label for="dsex-male">&nbsp;&nbsp;&nbsp;수컷&nbsp;&nbsp;&nbsp;</label>
				<input type=radio value="암컷" name=dsex style="display: none;" id="dsex-female">
				<label for="dsex-female">&nbsp;&nbsp;&nbsp;암컷&nbsp;&nbsp;&nbsp;</label>
			</td>
		</tr>
		<tr>
			<td  class="text-center">
				<input type=button class="btn btn-common2 uppercase" value="반려견 추가">
			</td>
		</tr>
		<tr>
			<td  class="text-center">
				<input type=submit value="회원가입" class="btn btn-submit">
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