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
.paddingtable{
	padding-left: 15px;
	padding-right:15px;
	display: table;
}
.optionList td a {
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-right: 3px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
}
.optionList td button {
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-right: 3px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-style: none;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.dogDel').click(function(){
		var dno = $(this).val();
		if(confirm("반려견을 삭제하시겠습니까?")) {
			location.href="../member/dog_delete_ok.do?dno="+dno;
		} else {
			return;
		}
	});
});
</script>
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

<section id="shortcodes">
	<div class="container">
	<div id="feature-container">
		<div class="row">
			<div class="col-md-12">
				<h4 class="page-header text-left">${name }님, 안녕하세요!</h4>
				<a href="../member/member_update_pwd.do" class="btn btn-common2 uppercase">회원 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../member/member_delete.do" class="btn btn-common2 uppercase">회원 탈퇴</a>
			</div>
		</div>
	</div>
	
	<div id="feature-container">
		<div class="row optionList">
			<div class="col-md-12">
				<h4 class="page-header text-left">${name }님의 반려견</h4>
			</div>
			<div class="paddingtable">
				<a href="../member/dog_insert.do"><input type=button class="btn btn-common2 uppercase" value="반려견 추가하기"></a>
				<div style="height:20px;"></div>
				<table class="table table-borderless" style="width:300px;">
					<c:forEach var="dvo" items="${list}">
						<tr>
							<td><font color="#bd8942">${dvo.dname }</font></td>
							<td>${dvo.dtype }</td>
							<td><a href="../member/dog_update.do?dno=${dvo.dno }">&nbsp;&nbsp;수정&nbsp;&nbsp;</a></td>
							<td><button type="button" value="${dvo.dno }" class="dogDel">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	
        
		<div id="feature-container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="page-header">바로가기</h2>
				</div>
				<div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
					<div class="feature-inner">
						<!-- <div class="icon-wrapper"> -->
							<a href="../hospital/hospital_reserve_detail.do"><img src="../member/list.png"></a>
						<!-- </div> -->
						<h3>진료 예약 내역</h3>
					</div>
				</div>
				<div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="600ms">
					<div class="feature-inner">
						<!-- <div class="icon-wrapper"> -->
							<a href="../hospital/hospital_carechart_detail.do"><img src="../member/hospital.png"></a>
						<!-- </div> -->
						<h3>진료 내역</h3>
					</div>
				</div>
				<div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="900ms">
					<div class="feature-inner">
						<!-- <div class="icon-wrapper"> -->
							<a href="#"><img src="../member/vacc.png"></a>
						<!-- </div> -->
						<h3>예방접종 내역</h3>
					</div>
				</div>
				<div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="1200ms">
					<div class="feature-inner">
						<!-- <div class="icon-wrapper"> -->
							<a href="../feed/feed_fav_list.do"><img src="../member/jjim.png"></a>
						<!-- </div> -->
						<h3>찜 목록</h3>
					</div>
				</div>                        
			</div>
		</div><!-- feature-container -->
		
	</div>
</section>  
</body>
</html>