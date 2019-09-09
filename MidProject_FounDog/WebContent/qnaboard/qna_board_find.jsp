<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
.row {
	margin: 0px auto;
	width: 900px;
}
th{
	background-color:#FFF;
	color:#A5732A;
}
.btnCss {
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
</head>
<body>
	<div class="container">
		<div class="row">
			<h2 class="text-center">검색결과</h2>
			<table class="table">
				<tr>
					<td class="text-left">
					<a href="qna_board_list.do" class="btnCss">&nbsp;&nbsp;목록&nbsp;&nbsp;</a>
				</tr>
			</table>
			<c:if test="${count==0 }">
				<table class="table">
					<tr>
						<td class="text-center">검색한 결과가 없습니다.</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${count>0 }">
			<table class="table">
				<tr>
					<th width=10% class="text-center">번호</th>
					<th width=45% class="text-center">제목</th>
					<th width=15% class="text-center">이름</th>
					<th width=20% class="text-center">작성일</th>
					<th width=10% class="text-center">조회수</th>
				</tr>
				<c:forEach var="vo" items="${list }" varStatus="s">
					<tr class="${s.index%2==0?'':'warning' }">
						<td width=10% class="text-center">${vo.no }</td>
						<td width=45% class="text-left"><a
							href="qna_board_detail.do?no=${vo.no }"><font color="black">${vo.subject }</font></a></td>
						<td width=15% class="text-center">${vo.id }</td>
						<td width=20% class="text-center">
						<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /></td>
						<td width=10% class="text-center">${vo.hit }</td>
					</tr>
				</c:forEach>
					<td colspan=5 class="text-center">
	               <ul class="pagination">
	                  <li><a href="qna_board_find.do?fs=${fs}&ss=${ss}&page=1">&lt;&lt;</a></li>
	                  <li><a href="qna_board_find.do?fs=${fs}&ss=${ss}&page=${curpage<=5?1:startPage-1}">&lt;</a></li>
	                  <c:forEach var="i" begin="${startPage }" end="${endPage }">
	                     <li class="${i==curpage?'active':''}">
	                     <a href="qna_board_find.do?fs=${fs}&ss=${ss}&page=${i }">${i }</a>
	                  </c:forEach>
	                  <li>
		                <c:if test="${allPage%BLOCK==0 }" >
	                  		<a href="qna_board_find.do?fs=${fs}&ss=${ss}&page=${curpage<=(allPage-BLOCK)?endPage+1:endPage}">&gt;</a>
	                  	</c:if>
	                  	<c:if test="${allPage%BLOCK!=0 }" >
	                  		<a href="qna_board_find.do?fs=${fs}&ss=${ss}&page=${curpage>allPage-(allPage%BLOCK)?endPage:endPage+1}">&gt;</a>
	                  	</c:if>
	                  </li>
	                  <li><a href="qna_board_find.do?fs=${fs}&ss=${ss}&page=${allPage }">&gt;&gt;</a></li>
	               </ul>
	            </td>
			</table>
			</c:if>
			</div>
			</div>
			</body>
</html>