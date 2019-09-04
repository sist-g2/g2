<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<title>Insert title here</title>
<link href="../css/feed.css" type="text/css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style type="text/css">
.row {
	width: 900px;
	margin: 0px auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var i = 0;
var bfNo = 0;
var no = 0;
$(function(){
	
	$.ajax ({
		type: 'post', 
		url: 'feed_read_ck.do',
		success: function(response){
			$('#cookiePrnt').html(response);
		}
	});
	
	var bno = ${vo.no};
	$.ajax ({
		type: 'post', 
		data: {bno:bno},
		url: 'feed_detail_review.do',
		success: function(response){
			$('#reviewDiv').html(response);
		}
	});
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		$('#cookiePrnt').stop().animate({top:scrollTop+200+"px"}, 1);
	});
	
	$('#favIntB').click(function(){
		if(confirm("찜 목록에 추가하시겠어요?")) {
			$('#fav_ins').submit();
		} else {
			return;
		}
	});
	
	$('#favDelB').click(function(){
		var referrer =  document.referrer;
		if(confirm("찜 목록에서 삭제하시겠어요?")) {
			$('#ref').val(referrer);
			$('#fav_del').submit();
		} else {
			return;
		}
	});
	
	$('#PgUp').click(function(){
		$("html").animate({scrollTop : 0}, 500);
	});
	
	$('#PgDwn').click(function(){
		$("html").animate({scrollTop : ($(document).height())}, 500);
	});
	
	var star = Math.floor("${vo.starAvg}");
	var stPrnt = "";
	for(var i = 0; i < star; i++) {
		stPrnt = stPrnt + "★";
	}
	$('#yellowStar').text(stPrnt);
	stPrnt = "";
	for(var i = 0; i < 5-star; i++) {
		stPrnt = stPrnt + "☆";
	}
	$('#greyStar').text(stPrnt);
	
});
</script>
</head>
<body>
<div class="container" >
	<div class="row" >
		<table id="feedDetailInfo" class="table table-borderless" >
			<tr>
				<td width="150px"></td>
				<td width="150px"></td>
				<td width="150px"></td>
				<td width="150px"></td>
				<td width="150px"></td>
				<td width="150px">
					<c:if test="${flag==0 }" > <%-- 검색조건 유지, 사료 목록으로(뒤로가기 1회) --%>
						<input type="button" class="backList" value="목록으로" onclick="javascript:history.back();" >
					</c:if>
					<c:if test="${flag==1 }" > <%-- 찜 목록으로 --%>
						<input type="button" class="backList" value="목록으로" onclick="javascript:location.href='../feed/feed_fav_list.do';" >
					</c:if>
					<c:if test="${flag==2 }" > <%-- 찜 삭제 후 feed_list(뒤로가기 2회) --%>
						<input type="button" class="backList" value="목록으로" onclick="javascript:history.go(-2);" >
					</c:if>
					<c:if test="${flag==3 }" > <%-- 기타 - feed_list --%>
						<input type="button" class="backList" value="목록으로" onclick="javascript:location.href='../feed/feed_list.do';" >
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="text-left" colspan=6 >
					<font class="feed_detail feed_title" >&nbsp;&nbsp;${vo.name }</font>
				</td>
			</tr>
			<tr>
				<td colspan=6 class="text-left">
					<font class="feed_detail simpleInfo">
						<br>
						&nbsp;&nbsp;&nbsp;사료종류 | ${vo.cateVO.name }&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;제조사 | ${vo.brndVO.name }&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;<span id="yellowStar"></span><span id="greyStar"></span> (<fmt:formatNumber value="${vo.starAvg}" pattern="0.0" />)&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;구매후기 ${vo.rvwNum } 건&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;${vo.favNum }명이 찜한 상품입니다!&nbsp;&nbsp;&nbsp;
						<c:if test="${favnum!=-2 }" >
							<c:if test="${favnum==-1 }" >
								<form id="fav_ins" method="post" action="feed_fav_insert.do" style="display: inline;" >
									<input type="button" id="favIntB" value="찜하기" >
									<input type="hidden" name="no" value="${vo.no }" >
								</form>
							</c:if>
							<c:if test="${favnum>0 }" >
								<form id="fav_del" method="post" action="feed_fav_delete.do" style="display: inline;" >
									<input type="button" id="favDelB" value="찜삭제" >
									<input type="hidden" name="ref" id="ref">
									<input type="hidden" name="no" value="${favnum }" >
									<input type="hidden" name="bno" value="${vo.no }" >
								</form>
							</c:if>
						</c:if>
					</font>
				</td>
			</tr>
			<tr>
				<td colspan=2 class="text-center" >
					<img src="${vo.feedImg }" >
				</td>
				<td colspan=4 >
					<table id="lowPriceInfo" class="table table-borderless" >
						<tr>
							<td>
								<span class="feed_detail feed_title" style="color:#FF0000; ">
									<br/>&nbsp;최저가 <fmt:formatNumber value="${lowPrice }" pattern="#,###" />원
								</span>
							</td>
							<td>
								<span class="feed_detail simpleInfo">
									<br/><br/><a href="${slist[0].link }" >바로가기 ▶</a>
								</span>
							</td>
						</tr>
						<tr >
							<th width=60% class="feed_detail simpleInfo" ><br/>&nbsp;&nbsp;판매처</th>
							<th width=40% class="feed_detail simpleInfo" ><br/>판매가</th>
						</tr>
						<c:forEach var="svo" items="${slist }" varStatus="s" >
							<tr>
								<td width=60% class="feed_detail simpleInfo" >
									<a href="${svo.link }" >&nbsp;&nbsp;${svo.stName }</a>
								</td>
								<td width=40% class="feed_detail simpleInfo" >
									<c:if test="${s.index==0 }">
										<font style="color: #FF0000;" ><fmt:formatNumber value="${svo.price }" pattern="#,###" /> 원</font>
									</c:if>
									<c:if test="${s.index!=0 }">
										<fmt:formatNumber value="${svo.price }" pattern="#,###" /> 원
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
		<table id="infoTable" class="table table-borderless" >
			<caption><font class="feed_detail feed_title" >&nbsp;&nbsp;상품 설명</font></caption>
			<%-- <tr>
				<td>
					${vo.info }
				</td>
			</tr> --%>
			<tr style="height: 30px;" ></tr>
			<tr>
				<td class="text-center">
					<img src="${vo.infoImg }" >
				</td>
			</tr>
		</table>
		<div style="height: 50px;" ></div>
		<div id="reviewDiv" >
		</div>
		
		<div style="height: 30px;" ></div>
		
		<div id="cookiePrnt" >
		</div>
	</div>
</div>
</body>
</html>