<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/member.css" rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            }
        }).open();
    });
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
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
    } else if(dcount=='2마리'){
    	con2.style.display = 'block';
    	con3.style.display = 'block';
    	con4.style.display = 'none';
    } else if(dcount=='3마리'){
    	con2.style.display = 'block';
    	con3.style.display = 'block';
    	con4.style.display = 'block';
    }
}

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
					<option>2019</option>
					<option>2018</option>
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
				<select name=day class="form-control2" style="width:27%" id="day">
					<option></option>
					<option>1</option>
					<option>2</option>
				</select>&nbsp;일
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
				<input type=text name=post class="form-control2" style="width:58%" id=post>&nbsp;&nbsp;&nbsp;
				<input type=button class="btn btn-common2 uppercase" value="우편번호 검색" style="width:38%" onclick="sample6_execDaumPostcode()">
			</td>
		</tr>
		<tr>
			<td class="text-left" >주소<font color=red> * </font></td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=addr1 class="form-control" placeholder="Address" id=addr1>
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
				<h5 class="text-center"><font color=red>3마리 이상은 마이페이지에서 등록해주세요.</font></h5>
			</td>
		</tr>
	</table>
	<table class="table table-borderless" id="dogInfo1"  style="width:400px;display:none">
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
	</table>
	<table class="table table-borderless" id="dogInfo2"  style="width:400px;display:none">
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
				<input type=radio value="수컷" name=dsex2 checked="checked" style="display: none;" id="dsex-male">
				<label for="dsex-male">&nbsp;&nbsp;&nbsp;수컷&nbsp;&nbsp;&nbsp;</label>
				<input type=radio value="암컷" name=dsex2 style="display: none;" id="dsex-female">
				<label for="dsex-female">&nbsp;&nbsp;&nbsp;암컷&nbsp;&nbsp;&nbsp;</label>
			</td>
		</tr>
	</table>
	<table class="table table-borderless" id="dogInfo3"  style="width:400px;display:none"s>
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
				<input type=radio value="수컷" name=dsex3 checked="checked" style="display: none;" id="dsex-male">
				<label for="dsex-male">&nbsp;&nbsp;&nbsp;수컷&nbsp;&nbsp;&nbsp;</label>
				<input type=radio value="암컷" name=dsex3 style="display: none;" id="dsex-female">
				<label for="dsex-female">&nbsp;&nbsp;&nbsp;암컷&nbsp;&nbsp;&nbsp;</label>
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