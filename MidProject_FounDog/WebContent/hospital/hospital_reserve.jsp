<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/hospital.css" rel="stylesheet">
<style type="text/css">

.board_write { width: 100%; border-collapse: collapse; border-top: 3px solid #d99c4e; margin-top:20px }
.board_write th, .board_write td {padding: 10px 0; background: #fff }
.board_write th { background: #fff4e5; font-weight: bold; text-align: left; font-size: 13px;border: 1px solid #cdcdcd;border-left:0;border-right:0;vertical-align:top;padding-top:12px }
.board_write td { padding-left: 30px }
.board_write .spacer {border:0}
.board_write .label {font-weight:bold; display:inline-block; width:105px}

.board_write th{text-align:left;padding-left:30px;}
.board_write .bdt{border-top:1px solid #cdcdcd;}
.board_write .bdb{border-bottom:1px solid #cdcdcd;}
.board_write td,.board_write th{border:0;}
.board_write > tbody > tr > td.ml_28{padding-left:0;margin-left:28px;display:block;}

.board_write .end {border-bottom:3px solid #d99c4e;border-left:0;border-right:0}

#layerPopup{
  padding:20px; 
  border:4px solid #ddd; 
  position:absolute; 
  left:700px; 
  top:400px; 
  background:#fff;
}

#layerPopup2{
  padding:20px; 
  border:4px solid #ddd; 
  position:absolute; 
  left:700px; 
  top:400px; 
  background:#fff;
}

#layerPopup button{
  cursor:pointer;
}

#layerPopup2 button{
  cursor:pointer;
}

.form-control2 {
  border: 1px solid #d99c4e;
  font-weight: 300;
  outline: none;
  box-shadow: none;
  height: 40px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border-radius: 4px;
}
</style>
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function reservedate(){
	var reserveday = $('#reserve_day').val();
	var dname = $('#dname').val();
	var check = $('#check').prop("checked");
	
	if(reserveday.trim()==""){
		alert("날짜를 선택해주세요");
		$("#reserve_day").focus();
		return false;
	}
	
	if(dname.trim()==""){
		alert("강아지를 선택해주세요");
		$("#dname").focus();
		return false;
	}
	
	if(check==false){
		alert("개인정보취급의 동의 해주세요");
		
		return false;
	}
	
	  if(confirm("예약 하시겠습니까?") == true){
		 alert("예약이 완료되었습니다.");
		 $('#reserveokForm').submit();
		return true;        
	    }
	    else{
	        return false;
	    }
}

function cancel(){
	
	  if(confirm("취소 하시겠습니까?") == true){
		 history.back();
		return true;        
	    }
	    else{
	        return false;
	    }
}

$(document).ready(function(){
	  $("#layerPopup").hide();
	  $("#layerPopup2").hide();
	  $("#contents > a").click(function(){
		  var no=$('#hosNo').val();
  	    
		    $.ajax({ 
				type:'post',
				url:'hospital_diary.do',
				data:{no:no},
				success:function(response)
				{	
					$("#PopupDiary").html(response);					
				}
			});
		    
	    $("#contents > a").blur();
	    $("#layerPopup").show();
	    $("#layerPopup a").focus();
	   
	    
	    return false;
	  });
	  
	  $("#contents2 > a").click(function(){
  	    
		    $.ajax({ 
				type:'post',
				url:'hospital_dog.do',
				success:function(response)
				{	
					$("#PopupDog").html(response);					
				}
			});
		    
	    $("#contents2 > a").blur();
	    $("#layerPopup2").show();
	    $("#layerPopup2 a").focus();
	   
	    
	    return false;
	  });
	  
	  $("#layerPopup a").keydown(function(e){
	    if(e.shiftKey && e.keyCode == 9){ // Shift + Tab 키를 의미합니다.
	      $("#contents > a").focus();
	      $("#layerPopup").hide();
	      return false;
	    }
	  });
	  
	  $("#layerPopup2 a").keydown(function(e){
		    if(e.shiftKey && e.keyCode == 9){ // Shift + Tab 키를 의미합니다.
		      $("#contents2 > a").focus();
		      $("#layerPopup2").hide();
		      return false;
		    }
		  });
	  
	  $("#layerPopup button").click(function(){
		    $("#contents > a").focus();
		    $("#layerPopup").hide();	 					  	
	  });
	  
	  $("#layerPopup2 button").click(function(){
		    $("#contents2 > a").focus();
		    $("#layerPopup2").hide();	 					  	
	  });
	});
</script>
</head>
<body>
	<div class="container">
		<div id="hospitalTitle">
			<h2 class="hostitle">진료 예약</h2>
		</div>
		<div id="a1" style="text-align: left;">
		<h3>개인정보취급 동의</h3>
		</div>
		<div id="a2" style="height: 200px;">
			<div id="a3" style="height: 150px; border: 1px solid #d99c4e; overflow: auto; padding:8px">
				파운독은 귀하의 개인정보보호를 매우 중요시하며, 개인정보보호방침을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
개인정보 수집에 대한 동의
파운독은 귀하께 회원가입시 개인정보보호방침 또는 이용약관의 내용을 공지하며 회원가입버튼을 클릭하면 개인정보 수집에 대해 동의하신 것으로 봅니다.
개인정보의 수집목적 및 이용목적
파운독은 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다 .
- 파운독 및 제휴사이트 서비스를 위한 회원 가입 및 이용아이디 발급
- 서비스의 이행(경품 등 우편물 배송 및 예약에 관한 사항)
- 장애처리 및 개별 회원에 대한 개인 맞춤서비스
- 서비스 이용에 대한 통계수집
- 기타, 새로운 서비스 및 정보 안내
단, 이용자의 기본적 인권침해의 우려가 있는 민감한 개인정보는 수집하지 않습니다.
파운독은 상기 범위 내에서 보다 풍부한 서비스를 제공하기 위해 이용자의 자의에 의한 추가정보를 수집합니다.
수집하는 개인정보 항목
파운독은 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
-수집항목: 이름, 생년월일, 성별, 로그인 ID, 비밀번호, 자택 전화번호, 자택 주소, 휴대전화번호, 이메일, 주민등록번호, 서비스이용기록, 접속로그, 쿠키, 접속 IP 정보 , 결제기록
-개인정보 수집방법: 홈페이지(회원가입, 게시판, 온라인상담, 온라인예약 등)
쿠키에 의한 개인정보 수집
파운독은 귀하에 대한 정보를 저장하고 수시로 찾아내는 '쿠키 (cookie)' 를 사용합니다. 쿠키는 웹사이트가 귀하의 컴퓨터 브라우저(넷스케이프, 인터넷 익스플로러 등)로 전송하는 소량의 정보입니다. 귀하가 웹사이트에 접속을 하면 파운독 웹서버는 귀하의 브라우저에 있는 쿠키의 내용을 읽고, 귀하의 추가정보를 귀하의 컴퓨터에서 찾아 접속에 따른 아이디 등의 추가 입력없이 서비스를 제공할 수 있습니다. 쿠키는 귀하의 컴퓨터는 식별하지만 귀하를 개인적으로 식별하지는 않습니다.
또한 귀하는 쿠키에 대한 선택권이 있습니다. 웹브라우저의 옵션을 조정함으로써 모든 쿠키를 다 받아들이거나, 쿠키가 설치될 때 통지를 보내도록 하거나 아니면 모든 쿠키를 거부할 수 있는 선택권을 가질 수 있습니다.
개인정보의 제3자에 대한 제공
파운독은 귀하의 개인정보를 <개인정보의 수집목적 및 이용목적>에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여 이용하거나 타인 또는 타기업/기관에 제공하지 않습니다. 그러나 보다 나은 서비스 제공을 위하여 귀하의 개인정보를 제휴사에게 제공하거나 또는 제휴사와 공유할 수 있습니다. 단, 개인정보를 제공하거나 공유할 경우에는 사전에 귀하께 고지하여 드립니다.
개인정보의 열람/정정
귀하는 언제든지 등록되어 있는 귀하의 개인정보를 열람하거나 정정하실 수 있습니다. 개인정보 열람 및 정정을 하고자 할 경우에는 <회원정보수정>을 클릭하여 직접 열람 또는 정정하거나 개인정보관리책임자에게 E-mail로 연락하시면 조치하여 드립니다.
귀하가 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 당해 개인정보를 이용하지 않습니다.
개인정보 수집, 이용, 제공에 대한 동의철회
회원가입 등을 통해 개인정보의 수집, 이용, 제공에 대해 귀하께서 동의하신 내용을 귀하는 언제든지 철회할 수 있습니다. 동의철회는 웹사이트 및 개인정보관리책임자에게 E-mail 등으로 연락하시면 즉시 개인정보의 삭제 등 필요한 조치를 하겠습니다.
개인정보의 보유기간 및 이용기간
귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.
-회원 가입정보의 경우, 회원 가입을 탈퇴하거나 회원에서 제명된 때
-예약의 경우, 예약에 따른 처리 및 진료가 완료된 때
위 보유기간에도 불구하고 계속 보유하여야 할 필요가 있을 경우에는 귀하의 동의를 받습니다.
개인정보보호를 위한 기술적 대책
파운독은 귀하의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.
귀하의 개인정보는 비밀번호에 의해 보호되며, 파일 및 전송 데이터를 암호화하거나 파일 잠금기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.
파운독은 회원인증과 관련 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 인증 및 보안장치를 채택하고 있으며, 시스템상 사정에 의해 미시행시 도우미에 의한 의사 확인을 시행하고 있습니다.
해킹 등에 의해 귀하의 개인정보가 유출되는 것을 방지하기 위해 외부로부터의 침입을 차단하는 장치를 이용하고 있으며, 각 서버마다 침입탐지시스템을 설치하여 24시간 침입을 감시하고 있습니다.
의견수렴 및 불만처리
파운독은 개인정보보호와 관련하여 귀하가 의견과 불만을 제기할 수 있는 창구를 개설하고 있습니다. 개인정보와 관련한 불만이 있으신 분은 파운독의 개인정보 관리책임자에게 의견을 주시면 접수 즉시 조치하여 처리결과를 통보해 드립니다.
14세 미만 어린이들에 대한 보호정책
파운독은 14세 미만 어린이들에 대한 회원 미가입 정책과 함께 개인정보를 부모의 동의 없이 제3자와 공유하지 않으며 사용자에 관한 정보를 매매하거나 대여하지 않습니다.
개인정보 관리책임자
파운독은 개인정보에 대한 의견수렴 및 불만처리의 정책을 담당하는 개인정보정책 담당 관리책임자를 지정하고 있습니다. 본 정책에 대한 불만사항이 있으시다면 아래 연락처로 문의 하시면 친절히 처리하여 드리겠습니다.
개인정보정책 책임자
성 명 :
ㅁㅁㅁ
소 속 :
ㅁㅁㅁㅁ
연락처 :
ㅁㅁㅁㅁ
이메일 :
ㅁㅁㅁㅁ
시행일
본 개인정보보호정책은 2019년 9월 01일부터 시행합니다.
				
			</div>
			<div id="a4" style="height: 50px;" class="text-right">
				<input type="checkbox" id="check">개인정보 취급방침에 동의합니다.
			</div>
		</div>		
		<form class="reserveokForm" method="post" id="reserveokForm" action="hospital_reserve_ok.do">
		<table class="board_write">
<colgroup>
<col width="214px">
<col width="">
</colgroup>
<tbody><tr class="first bdt bdb">
	<th>01. 진료병원</th>
	<td>
	<input type="hidden" name="hosNo" id="hosNo" value="${no }">
		${hosName }
	</td>
</tr>
<tr>
	<th rowspan="3">02. 예약희망날짜</th>
	<td style="padding:20px 0 30px 0" class="ml_28">
		<div id="contents">
		  <a href="#layerPopup">예약 날짜 선택</a>
		  <div id="layerPopup">
				<div id="PopupDiary">
				
				</div>
		    <button type="button">닫기</button>
		  </div>
		</div>
		
	</td>
</tr>
<tr>
	<td class="ml_28">
		예약희망일 : <input type="text" class="form-control2" id="reserve_day" name="reserve_day" value="" readonly="readonly">
	</td>
</tr>
<tr class="bdb">
	<td>
		예약희망시간 
		<select name="wr_5" class="form-control2" id="wr_5">
		<option value="">예약일자를 먼저 선택해주세요.</option>				
		</select>
		<span style="color:#f00; font-size:0.9em; margin-left:10px;"> *예약희망시간은 확정이 아니며 담당 센터에서 일정 확인 후 연락(전화 또는 메시지)을 드립니다.</span>		
	</td>
</tr>
<tr class="bdt">
	<th class="end bdb" rowspan="7">03. 기타정보입력</th>
	<td class="ml_28">
		보호자 명 : <input type="text" class="form-control2" readonly="readonly" value="${name }">
	</td>
</tr>
<tr>
	<td class="ml_28">
		진료받는 강아지 : <input type="text" class="form-control2" readonly="readonly" id="dname">&nbsp;
		<input type="hidden" name="dogNo" id="dogNo" value=""> 
		<div id="contents2">
		  <a href="#layerPopup2">강아지 선택</a>
		  <div id="layerPopup2">
				<div id="PopupDog">
				
				</div>
		    <button type="button">닫기</button>
		  </div>
		</div>
		
	</td>
</tr>
<tr>
	<td class="end">
		증상<br>
		<textarea style="width: 600px" cols="30" rows="5" name="symptom"></textarea>
	</td>
</tr>
</tbody>
</table>
		<input type="button" onclick="javascript:reservedate();" class="btn btn-primary" value="확인">
		<input type="button" class="btn btn-primary" value="취소" onclick="javascript:cancel();">
</form>
	</div>		  
</body>
</html>