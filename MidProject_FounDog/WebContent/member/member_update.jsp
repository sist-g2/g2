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
	$('#upBtn').click(function(){
		/* var pwd = $('#pwd').val(); */
		var tel2 = $('#tel2').val();
		var tel3 = $('#tel3').val();
		var email = $('#email').val();
		var post = $('#post').val();
		var addr1 = $('#addr1').val();
		
		/* if(pwd.trim()==""){
			alert("비밀번호를 입력해주세요.")
			$('#pwd').focus();
			return;
		} else */ if(tel2.trim()=="" || tel3.trim()==""){
			alert("전화번호를 입력해주세요.")
			return;
		} else if(email.trim()==""){
			alert("이메일을 입력해주세요.")
			$('#email').focus();
			return;
		} else if(post=="" || addr1==""){
			alert("주소를 입력해주세요.")
			return;
		}
		
		$('#update').submit();
		
	});
});
</script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					jQuery("#post").val(data.zonecode);
					jQuery("#addr1").val(data.address);
					console.log(data);
				}
			}).open();
		}
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
.form-control2[readonly]{
	background-color: #eee;
}
</style>
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

<!-- main -->
<!-- 필수 정보 -->
<div class="rowrow optionList">
	<h3 class="text-center">필수 정보</h3>
	<form id=update name="frm" method="post" action="../member/member_update_ok.do">
	<table class="table table-borderless">
		<tr>
			<td class="text-left">아이디</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=id class="form-control" placeholder="ID" value="${vo.id }" readonly="readonly" id=id>
			</td>
		</tr>
		<tr>
			<td class="text-left">비밀번호 변경</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=password name=pwd class="form-control" size=15 placeholder="변경할 비밀번호를 입력해주세요." id=pwd><br>
				<font color="red">비밀번호 변경을 원치 않으시다면 비워주세요.</font>
			</td>
		</tr>
		<tr>
			<td class="text-left" >이름</td>
		</tr>
		<tr>
			<td>
				<input type=text name=name class="form-control" value="${vo.name }" readonly="readonly" id=name>
			</td>
		</tr>
		<tr>
			<td class="text-left">생년월일<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=year class="form-control2" style="width:26%" id="year" readonly="readonly" value="${vo.birthday.substring(0,4) }">
				&nbsp;년&nbsp;&nbsp;&nbsp;
				<input type=text name=month class="form-control2" style="width:26%" id="month" readonly="readonly" value="${vo.birthday.substring(5,7) }">
				&nbsp;월&nbsp;&nbsp;&nbsp;
				<input type=text name=day class="form-control2" style="width:26%" id="day" readonly="readonly" value="${vo.birthday.substring(8,10) }">
				&nbsp;일
			</td>
		</tr>
		<tr>
			<td class="text-left" >전화번호</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=tel1 class="form-control2" style="width:30%" value="${vo.tel.substring(0,3) }" id=tel1>
				&nbsp;&nbsp;-&nbsp;
				<input type=text name=tel2 class="form-control2"  style="width:30%" value="${vo.tel.substring(4,8) }" id=tel2>&nbsp;&nbsp;-&nbsp;
				<input type=text name=tel3 class="form-control2"  style="width:30%" value="${vo.tel.substring(9,13) }" id=tel3>
			</td>
		</tr>
		<tr>
			<td class="text-left">이메일</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=email class="form-control" value="${vo.email }" id=email>
			</td>
		</tr>
		<tr>
			<td class="text-left" >우편번호</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text id=post name=post class="form-control2" style="width:58%"  value="${vo.post }" readonly="readonly">&nbsp;&nbsp;&nbsp;
				<input type=button class="btn btn-common2 uppercase" value="우편번호 검색" style="width:38%" onClick="openDaumZipAddress();">
			</td>
		</tr>
		<tr>
			<td class="text-left" >주소</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr1 class="form-control" value="${vo.addr1 }" readonly="readonly" id=addr1>
			</td>
		</tr>
		<tr>
			<td class="text-left" >상세주소</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr2 class="form-control" value="${vo.addr2 }" id=addr2>
			</td>
		</tr>
	</table>
	
<!-- 필수 정보 -->
<!-- 선택 정보 -->
	<div class="rowrow optionList"></div>
	<table class="table table-borderless">
		<tr>
			<td  class="text-center">
				<input type=button value="정보수정" class="btn btn-submit" id=upBtn>
			</td>
		</tr>
		<tr>
			<td  class="text-center">
				<a href="../member/member_mypage.do">취소</a>
			</td>
		</tr>
	</table>
	</form>
</div>

<!-- /선택 정보 -->
<!-- /main -->

</body>
</html>