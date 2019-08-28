<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div id="totalresult">
			<c:choose>
				<c:when test="${list ne null && list.size() ne 0}">
					<h3>전체 ${totalResult}건의 검색 결과가 있습니다.</h3>
				</c:when>
				<c:when test="${list.size() eq 0}">
					<h3>검색 결과가 없습니다.</h3>
				</c:when>
			</c:choose>
		</div>
		<div id="search_result">
			<div style="overflow: auto; height: 470px; width: 100%">
				<table class="table">
					<c:choose>
						<c:when test="${list eq null}">
							<tr>
								<td class="text-center">검색을 해주세요</td>
							</tr>
						</c:when>
						<c:when test="${list.size() eq 0 }">
							<tr>
								<td class="text-center">검색 결과가 없습니다.</td>
							</tr>
						</c:when>
					</c:choose>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td class="text-left">${vo.name }<br> ${vo.loc }<br>
								${vo.tel } <a href="#" class="btn btn-primary">예약</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-sm-4"
				style="height: 70px; width: 100%">
				<ul class="pagination pagination-lg">
					<c:if test="${curpage>BLOCK }">
						<li><a href="hospital_list.do?page=1">&lt;&lt;</a></li>
						<li><a href="hospital_list.do?page=${startPage-1 }">&lt;</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<li class=${curpage==i?"active":"" }><a
							href="hospital_list.do?page=${i }">${i}</a></li>
					</c:forEach>
					<c:if test="${endPage<allPage }">
						<li><a href="hospital_list.do?page=${endPage+1 }">&gt;</a></li>
						<li><a href="hospital_list.do?page=${allPage }">&gt;&gt;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>