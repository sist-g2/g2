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
				<td width="150px"></td>
			</tr>
			<tr>
				<td class="text-left" colspan=5 >
					<font class="feed_detail feed_title" >&nbsp;&nbsp;${vo.name }</font>
				</td>
				<td class="text-right" colspan=1 >
					<input type="button" id="backList" onclick="javascript:history.back();" value="목록으로" >
				</td>
			</tr>
			<tr>
				<td colspan=6 class="text-left">
					<font class="feed_detail simpleInfo">
						<br>
						&nbsp;&nbsp;&nbsp;사료종류 | ${vo.cateVO.name }&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;제조사 | ${vo.brndVO.name }&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;★★★★★ (${vo.starAvg })&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;구매후기 ${vo.rvwNum } 건&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;총 ${vo.favNum }명의 고객님이 이 상품을 찜하셨습니다.&nbsp;&nbsp;&nbsp;
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
			<tr>
				<td>
					${vo.info }
				</td>
			</tr>
			<tr>
				<td>
					<%--<img src="${vo.infoImg }" > --%>
				</td>
			</tr>
		</table>
		<div style="height: 30px;" ></div>
		<table id="reviewTable" class="table table-borderless" >
			<caption><font class="feed_detail feed_title" >&nbsp;&nbsp;고객 리뷰</font></caption>
			<c:if test="" >
			</c:if>
			
		</table>
	</div>
</div>
</body>
</html>