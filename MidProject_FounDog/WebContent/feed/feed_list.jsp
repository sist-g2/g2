<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/feed.css" type="text/css" rel="stylesheet">
<style type="text/css">
.row {
	margin: 0px auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$.ajax ({
		type: 'post', 
		url: 'feed_read_ck.do',
		success: function(response){
			$('#cookiePrnt').html(response);
		}
	});
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		$('#cookiePrnt').stop().animate({top:scrollTop+200+"px"}, 1);
	});
	
	$('#opDel').click(function(){
		$('#cate-999').prop("checked", true);
		$('input[type=checkbox]').prop("checked", false);
		$('#feedKeyword').val(null);
	});
	
	var cateOp = ${category};
	if(cateOp==null || cateOp==999) {
		$('#cate-999').prop("checked", true);
	} else {
		$('#cate-'+cateOp).prop("checked", true);
	}
	
	var brand = new Array();
	<c:forEach var="brnd" items="${brandOp}">
		brand.push("${brnd}");
	</c:forEach>
	for(var i = 0; i < brand.length; i++) {
		$("#brnd-"+brand[i]).prop("checked", true);
	}
	
	var target = new Array();
	<c:forEach var="tg" items="${tgOp}">
		target.push("${tg}");
	</c:forEach>
	for(var i = 0; i < target.length; i++) {
		$("#tg-"+target[i]).prop("checked", true);
	}
	
	var material = new Array();
	<c:forEach var="mtr" items="${mtrOp}">
		material.push("${mtr}");
	</c:forEach>
	for(var i = 0; i < material.length; i++) {
		$("#mtr-"+material[i]).prop("checked", true);
	}
	
	var grain = new Array();
	<c:forEach var="grn" items="${grnOp}">
		grain.push("${grn}");
	</c:forEach>
	for(var i = 0; i < grain.length; i++) {
		$("#grn-"+grain[i]).prop("checked", true);
	}
	
	var keyword = "${keyword}";
	$('#feedKeyword').val(keyword);
	
	var sort = ${sortOp};
	if(sort==null || sort==0) {
		$('#sort_hit').prop("checked", true);
	} else if (sort==1) {
		$('#sort_lowP').prop("checked", true);
	} else if (sort==2) {
		$('#sort_highP').prop("checked", true);
	} else if (sort==3) {
		$('#sort_fav').prop("checked", true);
	} else if (sort==4) {
		$('#sort_rvw').prop("checked", true);
	} else if (sort==5) {
		$('#sort_star').prop("checked", true);
	}
	
	$('.list_sort_btn').click(function(){
		$('#optionListForm').submit();
	});
	
});
</script>
</head>
<body>
<div class="container" >
	<div class="row" >
		<form id="optionListForm" method="post" action="../feed/feed_list.do">
			<div class="feedList" >
				<h3 class="page-header text-center">사료 가격비교</h3>
					<div class="optionList" >
							<table class="table table-borderless" >
								<tr>
									<th width=10% class="text-left" ><h5>&nbsp;&nbsp;사료 종류</h5></th>
									<td width=90% >
										<input type="radio" id="cate-999" name="category" value="999" />
										<label for="cate-999">&nbsp;&nbsp;전체&nbsp;&nbsp;</label>&nbsp;&nbsp;
										<c:forEach var="cate" items="${cateList }">
											<input type="radio" id="cate-${cate.no }" name="category" value="${cate.no }">
											<label for="cate-${cate.no }">&nbsp;&nbsp;${cate.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th width=10% class="text-left" ><h5>&nbsp;&nbsp;브랜드</h5></th>
									<td width=90% >
										<c:forEach var="brnd" items="${brndList }">
											<input type="checkbox" id="brnd-${brnd.no }" name="brand" value="${brnd.no }" />
											<label for="brnd-${brnd.no }">&nbsp;&nbsp;${brnd.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th width=10% class="text-left" ><h5>&nbsp;&nbsp;연령</h5></th>
									<td width=90% >
										<c:forEach var="tg" items="${tgList }">
											<input type="checkbox" id="tg-${tg.no }" name="tg" value="${tg.no }" />
											<label for="tg-${tg.no }">&nbsp;&nbsp;${tg.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th width=10% class="text-left" ><h5>&nbsp;&nbsp;주원료</h5></th>
									<td width=90% >
										<c:forEach var="mtr" items="${mtrList }">
											<input type="checkbox" id="mtr-${mtr.no }" name="mtr" value="${mtr.no }" />
											<label for="mtr-${mtr.no }">&nbsp;&nbsp;${mtr.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th width=10% class="text-left" ><h5>&nbsp;&nbsp;알갱이 크기</h5></th>
									<td width=90% >
										<c:forEach var="grn" items="${grnList }">
											<input type="checkbox" id="grn-${grn.no }" name="grn" value="${grn.no }" />
											<label for="grn-${grn.no }">&nbsp;&nbsp;${grn.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th width=10% class="text-left" ><h5>&nbsp;&nbsp;사료명</h5></th>
									<td width=90% >
										<input type="text" id="feedKeyword" name="feedKeyword" size="30" >
									</td>
								</tr>
								<tr>
									<td colspan=2 class="text-center" >
										<button type="button" id="opDel" >조건 삭제</button>&nbsp;&nbsp;
										<button type="submit" >검색</button>
									</td>
								</tr>
							</table>
					</div>
				
					<div class="ListSort" >
						<div style="height: 30px;" ></div>
							<input type="radio" id="sort_hit" class="list_sort_btn" name="sort_btn" value="0" >
							<label for="sort_hit" >&nbsp;&nbsp;조회수 순&nbsp;&nbsp;</label>
							<input type="radio" id="sort_lowP" class="list_sort_btn" name="sort_btn" value="1" >
							<label for="sort_lowP" >&nbsp;&nbsp;낮은 가격 순&nbsp;&nbsp;</label>
							<input type="radio" id="sort_highP" class="list_sort_btn" name="sort_btn" value="2" >
							<label for="sort_highP" >&nbsp;&nbsp;높은 가격 순&nbsp;&nbsp;</label>
							<input type="radio" id="sort_fav" class="list_sort_btn" name="sort_btn" value="3" >
							<label for="sort_fav" >&nbsp;&nbsp;찜 많은 순&nbsp;&nbsp;</label>
							<input type="radio" id="sort_rvw" class="list_sort_btn" name="sort_btn" value="4" >
							<label for="sort_rvw" >&nbsp;&nbsp;리뷰 많은 순&nbsp;&nbsp;</label>
							<input type="radio" id="sort_star" class="list_sort_btn" name="sort_btn" value="5" >
							<label for="sort_star" >&nbsp;&nbsp;별점 높은 순&nbsp;&nbsp;</label>
							<span style="font-weight: 300; font-size: 14px; float: right;" >
								검색 결과 ${totalNum }개
								<c:forEach begin="1" end="15" >
									&nbsp;
								</c:forEach>
							</span>
						<div style="height: 30px;" ></div>
					</div>
					
				<div class="fdList" >
					<c:if test="${totalNum==0}" >
						<div id="listIsNull" class="text-center" style="height: 50px;" >
							<span style="font-weight: 300; font-size: 14px;">검색된 결과가 없습니다</span>
						</div>
					</c:if>
					<c:if test="${totalNum>0}" >
						<c:forEach var="vo" items="${fdList }">
							<div class="fd_goods" >
								<div class="fd_img" >
									<a href="../feed/feed_detail.do?no=${vo.no }&urlFlag=0" class="fd_res" ><img src="${vo.feedImg }" width=235px height=235px ></a>
								</div>
								<div class="fd_info" >
									<div style="height: 55px;" >
										<a href="../feed/feed_detail?no=${vo.no }&urlFlag=0" class="fd_res" ><span class="fd_info_name" >${vo.name }</span></a>
									</div>
									<div style="height: 35px;" >
										<span style="font-size: 14px; color: #808080;" >
											찜 ${vo.favNum } 건 &nbsp;&nbsp;
											구매후기 ${vo.rvwNum } 건 (<fmt:formatNumber value="${vo.starAvg}" pattern="0.0" />)
										</span>
										<br/>
										<span class="fd_info_price" >최저가&nbsp;<fmt:formatNumber value="${vo.lowPrice }" pattern="#,###" />원</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				<div class="blog-pagination">
					<div style="height: 30px;" ></div>
					<ul class="pagination">
						<c:if test="${curpage>3 }" >
							<li><button type="submit" id="firstPage" name="page" value="1"></button></li>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" >
							<li class="${i==curpage?'active':'' }" ><button type="submit" name="page" value="${i }">${i }</button></li>
						</c:forEach>
						<c:if test="${curpage<totalPage-2 }" >
							<li><button type="submit" id="lastPage" name="page" value="${totalPage }"></button></li>
						</c:if>
					</ul>
				</div>
				
			</div>
		</form>
	</div>
	<div id="cookiePrnt" >
	</div>
</div>
</body>
</html>