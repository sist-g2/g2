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
$(function(){
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		$('#cookiePrnt').stop().animate({top:scrollTop+200+"px"}, 1);
	});
	
	$('#myFav').click(function(){
		if(confirm("찜 목록에 추가하시겠어요?")) {
			$('#fav_form').submit();
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
					<form id="to_list_form" method="post" action="feed_list.do" style="display: inline;" >
						<input type="button" id="backList" onclick="javascript:history.back();" value="목록으로" >
						<input type="hidden" >
					</form>
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
						&nbsp;&nbsp;&nbsp;<span id="yellowStar"></span><span id="greyStar"></span> (${vo.starAvg })&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;구매후기 ${vo.rvwNum } 건&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;총 ${vo.favNum }명의 고객님이 이 상품을 찜하셨습니다.&nbsp;&nbsp;&nbsp;
						<c:if test="${sessionScope.id!=null }" >
							<form id="fav_form" method="post" action="feed_fav_insert.do" style="display: inline;" >
								<input type="button" id="myFav" value="찜하기" >
								<input type="hidden" name="no" value="${vo.no }" >
							</form>
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
		<table id="reviewTable" class="table table-borderless" >
			<caption><font class="feed_detail feed_title" >&nbsp;&nbsp;고객 리뷰</font></caption>
			<c:if test="${vo.rvwNum==0 }" >
				<tr height=30px;>
				</tr>
				<tr height=50px;>
					<td class="text-center">
						이런, 아직 작성된 후기가 없네요ㅠㅠ 첫 후기를 작성해주세요!
					</td>
				</tr>
			</c:if>
			<c:if test="${vo.rvwNum>0 }" >
				<c:forEach var="rvw" items="${rlist }">
					<tr>
						<td>
							<table class="table reviewList" >
								<tr>
									<td>
										${rvw.subject }
									</td>
								</tr>
								<tr>
									<td>
										작성자 ${rvw.mvo.name } | 작성일 ${rvw.rdateS } | 별점 ★★★★★ ${rvw.star } | 견종 ${rvw.dtype }
									</td>
								</tr>
								<tr>
									<td>
										${rvw.content }
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${sessionScope.id!=null }" >
				<tr>
					<td>
						<form method="post" action="" >
							<div id="reviewInput" style="border: 1px solid #c3c3c3; border-radius: 10px; padding: 5px;">
								<div >
									<input class="input-sm" type="text" name="subject" placeholder="제목" size="50" >&nbsp;&nbsp;&nbsp;
									<input class="input-sm" type="text" name="dtype" placeholder="견종" size="20" >&nbsp;&nbsp;&nbsp;
									<select name="star" class="input-sm" >
										<option value="1" >★☆☆☆☆</option>
										<option value="2" >★★☆☆☆</option>
										<option value="3" selected="selected">★★★☆☆</option>
										<option value="4" >★★★★☆</option>
										<option value="5" >★★★★★</option>
									</select>
									<table class="table-borderless" style="margin: 5px 0px 0px 0px;">
										<tr>
											<td width=85% style="padding: 0;" >
												<textarea rows="3" cols="120" name="content" placeholder="내용" class="input-sm"></textarea>
											</td>
											<td width=15% style="padding: 0;" >
												<input type="submit" id="reviewSubmit" value="작성" >
											</td>
										</tr>
									</table>
								</div>
							</div>
						</form>
					</td>
				</tr>
			</c:if>
			
		</table>
		<div style="height: 30px;" ></div>
		
		<div id="cookiePrnt" >
			<div style="margin: 0px auto; text-align: center; margin-bottom: 10px;" >
				<button id="PgUp" >▲</button>
			</div>
			<div style="margin: 0px auto; text-align: center; margin-bottom: 5px;" >
				<span class="simpleInfo" >최근 본 상품</span>
			</div>
			<c:forEach var="ck" items="${clist }">
				<div style="border: 1px solid #c3c3c3; height: 52px; width: 52px; margin: 0px auto; margin-bottom: 5px;" >
					<a href="../feed/feed_detail.do?no=${ck.no }" ><img src="${ck.feedImg }" height="50px" width="50px"></a>
				</div>
			</c:forEach>
			<div style="margin: 0px auto; text-align: center; margin-top: 10px;" >
				<button id="PgDwn" >▼</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>