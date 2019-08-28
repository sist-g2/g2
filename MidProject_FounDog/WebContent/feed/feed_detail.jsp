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
		var referrer =  document.location.href;
		console.log(referrer);
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
	
	$('#reviewSubmit').click(function(){
		if($('[name="subject"]').val()=="") {
			alert('제목을 입력해주세요!');
			$('[name="subject"]').focus();
			return;
		}
		if($('[name="dtype"]').val()=="") {
			alert('견종을 입력해주세요!');
			$('[name="dtype"]').focus();
			return;
		}
		if($('[name="content"]').val()=="") {
			alert('내용을 입력해주세요!');
			$('[name="content"]').focus();
			return;
		}
		$('#reviewInsFrm').submit();
	});
	
    $('[name="subject"]').keyup(function(){
        if ($(this).val().length > $(this).attr('maxlength')) {
            alert('100자까지만 입력 가능합니다!');
            $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
        }
    });
    
    $('[name="dtype"]').keyup(function(){
        if ($(this).val().length > $(this).attr('maxlength')) {
            alert('60자까지만 입력 가능합니다!');
            $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
        }
    });
    
    $('.rvwUpd').click(function(){
    	var valueSplit = $(this).attr("value").split(',');
    	no = valueSplit[0];
    	$('.rvwUp').hide();
    	
    	if(i==0) {
			$('#Up'+no).show();
			bfNo = no;
			i = 1;
		} else {
			if (bfNo != no) {
				$('#Up'+bfNo).hide();
				$('#Up'+no).show();
				bfNo = no;
				i = 1;
			} else {
				$('#Up'+no).hide();
				i = 0;
			}
		}
    	
    	$('#Up'+no).find('.upStar'+valueSplit[1]).prop("selected", true);
    	
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
					<c:if test="${urlPlag==0 }" >
						<input type="button" class="backList" value="목록으로" onclick="javascript:history.back();" >
					</c:if>
					<c:if test="${urlPlag==1 }" >
						<input type="button" class="backList" value="목록으로" onclick="javascript:location.href='../feed/feed_fav_list.do';" >
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
					<tr height=30px;></tr>
					<tr>
						<td>
							<table class="table reviewList" >
								<tr>
									<td class="text-right" width=8% >작성자</td>
									<td class="text-left" width=10% >&nbsp;${rvw.mvo.name }</td>
									<td class="text-right" width=8% >작성일</td>
									<td class="text-left" width=14% >&nbsp;${rvw.rdateS }</td>
									<td class="text-right" width=8% >별점</td>
									<td class="text-left" width=14% >
										&nbsp;<font style="color: #FFBB00;" ><c:forEach begin="1" end="${rvw.star }">★</c:forEach></font>
										<font style="color:#808080;" ><c:forEach begin="1" end="${5-rvw.star }">☆</c:forEach></font> (${rvw.star }.0)
									</td>
									<td class="text-right" width=8% >견종</td>
									<td class="text-left" width=12% >&nbsp;${rvw.dtype }</td>
									<td class="text-right" width=18% >
										<c:if test="${sessionScope.id!=null && rvw.id==sessionScope.id }" >
											<button type="button" class="rvwUpd" value="${rvw.no },${rvw.star}" >수정</button>&nbsp;
											<a href="feed_review_del.do?no=${rvw.no }&bno=${vo.no }" class="rvwDel" onclick="return confirm('리뷰를 삭제하시겠습니까?');" >&nbsp;&nbsp;삭제&nbsp;&nbsp;</a>
										</c:if>
									</td>
								</tr>
								<tr>
									<td width=8% class="text-right" >제목</td>
									<td colspan=8 >&nbsp;${rvw.subject }</td>
								</tr>
								<tr>
									<td width=8% class="text-right" >내용</td>
									<td colspan=8 >&nbsp;${rvw.content }</td>
								</tr>
							</table>
							<div id="Up${rvw.no }" class="rvwUp" style="border: 1px solid #c3c3c3; border-radius: 10px; padding: 5px; display: none;">
								<form id="UpFrm${rvw.no }" method="post" action="feed_review_upd.do" >
									<div >
										<input type="hidden" name="no" value="${rvw.no }" >
										<input class="input-sm" type="text" name="subject" placeholder="제목 (최대 100자)" size="50" maxlength=100 value="${rvw.subject }">&nbsp;&nbsp;&nbsp;
										<input class="input-sm" type="text" name="dtype" placeholder="견종 (최대 60자)" size="20" maxlength=60 value="${rvw.dtype }">&nbsp;&nbsp;&nbsp;
										<select name="star" class="input-sm" >
											<option value="1" class="upStar1"  >★☆☆☆☆</option>
											<option value="2" class="upStar2"  >★★☆☆☆</option>
											<option value="3" class="upStar3"  >★★★☆☆</option>
											<option value="4" class="upStar4"  >★★★★☆</option>
											<option value="5" class="upStar5"  >★★★★★</option>
										</select>
										<input type="hidden" name="fnum" value="${vo.no }" >
										<table class="table-borderless" style="margin: 5px 0px 0px 0px;">
											<tr>
												<td width=85% style="padding: 0;" >
													<textarea rows="3" cols="120" name="content" placeholder="내용" class="input-sm">${rvw.content }</textarea>
												</td>
												<td width=15% style="padding: 0;" >
													<input type="submit" class="reviewUpSub" onclick="return confirm('리뷰를 수정하시겠습니까?');" value="수정" >
												</td>
											</tr>
										</table>
									</div>
								</form>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${sessionScope.id!=null }" >
				<tr>
					<td>
						<form id="reviewInsFrm" method="post" action="feed_review_ins.do" >
							<div id="reviewInput" style="border: 1px solid #c3c3c3; border-radius: 10px; padding: 5px;">
								<div >
									<input class="input-sm" type="text" name="subject" placeholder="제목 (최대 100자)" size="50" maxlength=100 >&nbsp;&nbsp;&nbsp;
									<input class="input-sm" type="text" name="dtype" placeholder="견종 (최대 60자)" size="20" maxlength=60 >&nbsp;&nbsp;&nbsp;
									<select name="star" class="input-sm" >
										<option value="1" >★☆☆☆☆</option>
										<option value="2" >★★☆☆☆</option>
										<option value="3" selected="selected">★★★☆☆</option>
										<option value="4" >★★★★☆</option>
										<option value="5" >★★★★★</option>
									</select>
									<input type="hidden" name="fnum" value="${vo.no }" >
									<table class="table-borderless" style="margin: 5px 0px 0px 0px;">
										<tr>
											<td width=85% style="padding: 0;" >
												<textarea rows="3" cols="120" name="content" placeholder="내용" class="input-sm"></textarea>
											</td>
											<td width=15% style="padding: 0;" >
												<input type="button" id="reviewSubmit" value="작성" >
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