<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/member.css" rel="stylesheet">
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					jQuery("#post").val(data.zonecode);
					jQuery("#addr1").val(data.address);
					/* jQuery("#address_etc").focus(); */
					console.log(data);
				}
			}).open();
		}
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

function dogCntDisplay(){
	var con = document.getElementById("CntTable");
	
	if(con.style.display=='none'){
		con.style.display = 'block';
	} else {
		con.style.display = 'none';
	}
}

function dogInfoDisplay(){
	var dcount = $('#dogCnt').val();
	var con2 = document.getElementById("dogInfo1");
	var con3 = document.getElementById("dogInfo2");
	var con4 = document.getElementById("dogInfo3");
	
	if(dcount=='1마리'){
        con2.style.display = 'block';
        con3.style.display = 'none';
        con4.style.display = 'none';
        $('#input').val("1");
        
    } else if(dcount=='2마리'){
    	con2.style.display = 'block';
    	con3.style.display = 'block';
    	con4.style.display = 'none';
    	$('#input').val("2");
    } else if(dcount=='3마리'){
    	con2.style.display = 'block';
    	con3.style.display = 'block';
    	con4.style.display = 'block';
    	$('#input').val("3");
    }
}

$(function(){
	
	var jungbok = 0;
	
	$('#overBtn').click(function(){
		var id = $('#id').val();
		
		if(id.trim()==""){
			alert("아이디를 입력해주세요.")
			$('#id').focus();
			return;
		} else {
			jungbok = 1;
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
	
	$('#joinBtn').click(function(){
		var id = $('#id').val();
		var pwd = $('#pwd').val();
		var pwd2 = $('#pwd2').val();
		var name = $('#name').val();
		var year = $('#year').val();
		var month = $('#month').val();
		var day = $('#day').val();
		var tel2 = $('#tel2').val();
		var tel3 = $('#tel3').val();
		var email = $('#email').val();
		var post = $('#post').val();
		var addr1 = $('#addr1').val();
		
		if(id.trim()==""){
			alert("아이디를 입력해주세요.")
			$('#id').focus();
			return;
		} else if(pwd.trim()==""){
			alert("비밀번호를 입력해주세요.")
			$('#pwd').focus();
			return;
		} else if(pwd2.trim()==""){
			alert("비밀번호 확인을 입력해주세요.")
			$('#pwd2').focus();
			return;
		} else if(name.trim()==""){
			alert("이름을 입력해주세요.")
			$('#name').focus();
			return;
		} else if(year=="" || month=="" || day==""){
			alert("생년월일을 입력해주세요.")
			return;
		} else if(tel2.trim()=="" || tel3.trim()==""){
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
		
		if(jungbok==0){
			alert("아이디 중복 확인을 해주세요.")
			return;
		}
		
		if(pwd!=pwd2){
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.")
			$('#pwd').val("");
			$('#pwd2').val("");
			return;
		}
		
		$('#join').submit();
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
tbody{
	width: 400px !important;
	display: table;
}
.form-control[readonly]{
	background-color: #fff;
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
	<h3 class="text-center">회원 정보</h3>
	<h5 class="text-center"><font color=red>* 표시된 항목은 필수 항목입니다.</font></h5>
	<form id="join" name="frm" method="post" action="../member/member_join_ok.do">
	<table class="table table-borderless">
		<tr>
			<td class="text-left">아이디<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=id class="form-control2" style="width:70%" placeholder="ID" id="id">&nbsp;
				<input type=button class="btn btn-common2" style="width:28%" value="중복체크" id="overBtn">
			</td>
		</tr>
		<tr>
			<td class="text-left">비밀번호<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=password name=pwd class="form-control" size=15 placeholder="Password" id="pwd">
			</td>
		</tr>
		<tr>
			<td >
				<input type=password name=pwd1 class="form-control" size=15 placeholder="Confirm Password" id="pwd2">
			</td>
		</tr>
		<tr>
			<td class="text-left" >이름<font color=red> * </font></td>
		</tr>
		<tr>
			<td >
				<input type=text name=name class="form-control" placeholder="Name" id="name">
			</td>
		</tr>
		<tr>
			<td class="text-left">생년월일<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=year class="form-control2" style="width:27%" id="year">
					<option></option>
					<c:set var="first" value="2019"/>
					<c:set var="end" value="1919"/>
					<c:forEach var="i" begin="0" end="${first-end}" step="1">
						<option>${first -i }</option>
					</c:forEach>
				</select>&nbsp;년&nbsp;&nbsp;&nbsp;
				<select name=month class="form-control2" style="width:27%" id="month">
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
				<input type=text name=day class="form-control2" style="width:27%" id="day">&nbsp;일
			</td>
		</tr>
		<tr>
			<td class="text-left" >성별<font color=red> * </font></td>
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
			<td class="text-left" >전화번호<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=tel1 class="form-control2" style="width:31%">
					<option>010</option>
					<option>011</option>
					<option>017</option>
				</select>&nbsp;&nbsp;&nbsp;
				<input type=text name=tel2 class="form-control2"  style="width:31%" id=tel2>&nbsp;&nbsp;-&nbsp;
				<input type=text name=tel3 class="form-control2"  style="width:31%" id=tel3>
			</td>
		</tr>
		<tr>
			<td class="text-left">이메일<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=email class="form-control" placeholder="E-mail" id=email>
			</td>
		</tr>
		<tr>
			<td class="text-left" >우편번호<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=post class="form-control2" style="width:58%" id=post readonly="readonly">&nbsp;&nbsp;&nbsp;
				<input type=button class="btn btn-common2 uppercase" value="우편번호 검색" style="width:38%" onClick="openDaumZipAddress();">
			</td>
		</tr>
		<tr>
			<td class="text-left" >주소<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr1 class="form-control" placeholder="Address" id=addr1 readonly="readonly">
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
		<tr>
			<td class="text-center" style="height:100px">
				<input type=button id="addBtn" class="btn btn-common2 uppercase" value="반려견 정보 입력하기"  onclick="javascript:dogCntDisplay();">
			</td>
		</tr>
	</table>
	
<!-- /필수 정보 -->
<!-- 선택 정보 -->
	<div class="rowrow optionList"></div>
	<table class="table table-borderless rowrow" style="width:400px;display:none" id="CntTable">
		<tr>
			<td class="text-center" colspan="2"><h3 class="text-center">반려견 정보</h3></td>
		</tr>
		<tr>
			<td class="text-left">반려견 마리 수 선택</td>
		</tr>
		<tr>
			<td>
				<select name="dogCnt" class="form-control2" style="width:31%" id="dogCnt">
					<option>1마리</option>
					<option>2마리</option>
					<option>3마리</option>
				</select>&nbsp;&nbsp;&nbsp;
				<input type=button  id="dogCntBtn" class="btn btn-common2 uppercase" value="확인" onclick="javascript:dogInfoDisplay();">
			</td>
		</tr>
		<tr>
			<td>
				<h5 class="text-center"><font color=red>4마리 이상은 마이페이지에서 등록해주세요.</font></h5>
			</td>
		</tr>
	</table>
	<table class="table table-borderless" id="dogInfo1"  style="width:400px;display:none">
		<tr>
			<td class="text-left" >반려견 이름</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=dname1 class="form-control" size=15 placeholder="Dog Name">
				<input type=hidden name=input id=input value=0>
			</td>
		</tr>
		<tr>
			<td class="text-left" >견종</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=dtype1 class="form-control" size=15 placeholder="Dog breeds">
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 생년월일</td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=dyear1 class="form-control2" style="width:27%">
					<option></option>
					<c:set var="first" value="2019"/>
					<c:set var="end" value="1989"/>
					<c:forEach var="i" begin="0" end="${first-end}" step="1">
						<option>${first -i }</option>
					</c:forEach>
				</select>&nbsp;년&nbsp;&nbsp;&nbsp;
				<select name=dmonth1 class="form-control2" style="width:27%">
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
				<input type=text name=dday1 class="form-control2" style="width:27%">&nbsp;일
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 성별</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=radio value="수컷" name=dsex1 checked="checked" style="display: none;" id="dsex1-male">
				<label for="dsex1-male">&nbsp;&nbsp;&nbsp;수컷&nbsp;&nbsp;&nbsp;</label>
				<input type=radio value="암컷" name=dsex1 style="display: none;" id="dsex1-female">
				<label for="dsex1-female">&nbsp;&nbsp;&nbsp;암컷&nbsp;&nbsp;&nbsp;</label>
			</td>
		</tr>
	</table>
	<table class="table table-borderless" id="dogInfo2"  style="width:400px;display:none">
		<tr>
			<td class="text-left" >반려견 이름</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=dname2 class="form-control" size=15 placeholder="Dog Name">
				<input type=hidden name=input2 id=input2 value=0>
			</td>
		</tr>
		<tr>
			<td class="text-left" >견종</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=dtype2 class="form-control" size=15 placeholder="Dog breeds">
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 생년월일</td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=dyear2 class="form-control2" style="width:27%">
					<option></option>
					<c:set var="first" value="2019"/>
					<c:set var="end" value="1989"/>
					<c:forEach var="i" begin="0" end="${first-end}" step="1">
						<option>${first -i }</option>
					</c:forEach>
				</select>&nbsp;년&nbsp;&nbsp;&nbsp;
				<select name=dmonth2 class="form-control2" style="width:27%">
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
				<input type=text name=dday2 class="form-control2" style="width:27%">&nbsp;일
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 성별</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=radio value="수컷" name=dsex2 checked="checked" style="display: none;" id="dsex2-male">
				<label for="dsex2-male">&nbsp;&nbsp;&nbsp;수컷&nbsp;&nbsp;&nbsp;</label>
				<input type=radio value="암컷" name=dsex2 style="display: none;" id="dsex2-female">
				<label for="dsex2-female">&nbsp;&nbsp;&nbsp;암컷&nbsp;&nbsp;&nbsp;</label>
			</td>
		</tr>
	</table>
	<table class="table table-borderless" id="dogInfo3"  style="width:400px;display:none"s>
		<tr>
			<td class="text-left" >반려견 이름</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=dname3 class="form-control" size=15 placeholder="Dog Name">
				<input type=hidden name=input3 id=input3 value=0>
			</td>
		</tr>
		<tr>
			<td class="text-left" >견종</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=dtype3 class="form-control" size=15 placeholder="Dog breeds">
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 생년월일</td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=dyear3 class="form-control2" style="width:27%">
					<option></option>
					<c:set var="first" value="2019"/>
					<c:set var="end" value="1989"/>
					<c:forEach var="i" begin="0" end="${first-end}" step="1">
						<option>${first -i }</option>
					</c:forEach>
				</select>&nbsp;년&nbsp;&nbsp;&nbsp;
				<select name=dmonth3 class="form-control2" style="width:27%">
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
				<input type=text name=dday3 class="form-control2" style="width:27%">&nbsp;일
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 성별</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=radio value="수컷" name=dsex3 checked="checked" style="display: none;" id="dsex3-male">
				<label for="dsex3-male">&nbsp;&nbsp;&nbsp;수컷&nbsp;&nbsp;&nbsp;</label>
				<input type=radio value="암컷" name=dsex3 style="display: none;" id="dsex3-female">
				<label for="dsex3-female">&nbsp;&nbsp;&nbsp;암컷&nbsp;&nbsp;&nbsp;</label>
			</td>
		</tr>
	</table>
	<table class="table table-borderless" style="width:400px;">
		<tr>
			<td  class="text-center">
				<input type=button value="회원가입" class="btn btn-submit" id="joinBtn">
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