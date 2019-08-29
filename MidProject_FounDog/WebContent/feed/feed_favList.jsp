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
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		$('#cookiePrnt').stop().animate({top:scrollTop+200+"px"}, 1);
	});
	
	$.ajax ({
		type: 'post', 
		url: 'feed_read_ck.do',
		success: function(response){
			$('#cookiePrnt').html(response);
		}
	});
	
});
</script>
</head>
<body>
<div class="container" >
	<div class="row" >
		<form id="#" method="post" action="#">
			<div class="feedList" >
				<h3 class="page-header text-center">내가 찜한 상품</h3>
				
				<div class="ListSort" >
					<span style="font-weight: 300; font-size: 14px; float: left;" >
						찜한 상품은 찜한 최신순으로 보여집니다.
						<c:forEach begin="1" end="15" >
							&nbsp;
						</c:forEach>
					</span>
					<span style="font-weight: 300; font-size: 14px; float: right;" >
						찜한 상품 : ${totalNum }개
						<c:forEach begin="1" end="15" >
							&nbsp;
						</c:forEach>
					</span>
					<div style="height: 30px;" ></div>
				</div>
					
				<div class="fdList" >
					<c:if test="${totalNum==0}" >
						<div id="listIsNull" class="text-center" style="height: 50px;" >
							<span class="text-center" style="font-weight: 300; font-size: 14px;">이런! 찜하신 상품이 없는 것 같아요~</span>
						</div>
					</c:if>
					<c:if test="${totalNum>0}" >
						<c:forEach var="vo" items="${favList }">
							<div class="fd_goods" >
								<div class="fd_img" >
									<a href="../feed/feed_add_ck.do?no=${vo.fnum }&urlFlag=1" class="fd_res" ><img src="${vo.fvo.feedImg }" width=235px height=235px ></a>
								</div>
								<div class="fd_info" >
									<div style="height: 55px;" >
										<a href="../feed/feed_add_ck.do?no=${vo.fnum }&urlFlag=1" class="fd_res" ><span class="fd_info_name" >${vo.fvo.name }</span></a>
									</div>
									<div style="height: 35px;" >
										<span class="fd_info_price" >최저가&nbsp;<fmt:formatNumber value="${vo.fnum_lowPrice }" pattern="#,###" />원</span>
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