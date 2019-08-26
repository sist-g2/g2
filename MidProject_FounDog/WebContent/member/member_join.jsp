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
	/* border: 5px;
	border-color: gray; */
}
.modal1{
  margin:25px ;
}

.inline{
  display: inline-block;
}
.inline + .inline{
  margin-left:10px;
}
.radio{
  color:#d99c4e;
  font-size:15px;
  position:relative;
}
.radio span{
  position:relative;
   padding-left:20px;
}
.radio span:after{
  content:'';
  width:15px;
  height:15px;
  border:3px solid;
  position:absolute;
  left:0;
  top:1px;
  border-radius:100%;
  -ms-border-radius:100%;
  -moz-border-radius:100%;
  -webkit-border-radius:100%;
  box-sizing:border-box;
  -ms-box-sizing:border-box;
  -moz-box-sizing:border-box;
  -webkit-box-sizing:border-box;
}
.radio input[type="radio"]{
   cursor: pointer; 
  position:absolute;
  width:100%;
  height:100%;
  z-index: 1;
  opacity: 0;
  filter: alpha(opacity=0);
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)"
}
.radio input[type="radio"]:checked + span{
  color:#d99c4e;  
}
.radio input[type="radio"]:checked + span:before{
  content:'';
  width:5px;
  height:5px;
  position:absolute;
  background:#d99c4e;
  left:5px;
  top:6px;
  border-radius:100%;
  -ms-border-radius:100%;
  -moz-border-radius:100%;
  -webkit-border-radius:100%;
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
<div class="rowrow">
	<h3 class="text-center">필수 정보</h3>
	<form name="frm" method="post" action="../member/member_join_ok.do">
	
	<table class="table table-borderless">
		<tr>
			<td class="text-left">아이디</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text name=id class="form-control2" style="width:70%" placeholder="ID">&nbsp;
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
			<td class="text-left" >성별</td>
		</tr>
		<tr>
			<td class="text-left" >
				<label class="radio inline">
					<input type=radio value="남자" name=sex checked="checked"><span>남자</span>
				</label>
				<label class="radio inline">
					<input type=radio value="여자" name=sex><span>여자</span>
				</label>
			</td>
		</tr>
		<tr>
			<td class="text-left" >전화번호</td>
		</tr>
		<tr>
			<td class="text-left" >
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
				<input type=text name=post class="form-control2" size=10>&nbsp;&nbsp;
				<input type=button class="btn btn-common2 uppercase" value="우편번호 검색">
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
				<input type=text name=addr2 class="form-control">
			</td>
		</tr>
	</table>
	
<!-- /필수 정보 -->
<!-- 선택 정보 -->
	<div class="rowrow"></div>
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
			<td class="text-left" >반려견 성별</td>
		</tr>
		<tr>
			<td class="text-left" >
				<label class="radio inline">
					<input type=radio value="수컷" name=dsex checked="checked"><span>수컷</span>
				</label>
				<label class="radio inline">
					<input type=radio value="암컷" name=dsex><span>암컷</span>
				</label>
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