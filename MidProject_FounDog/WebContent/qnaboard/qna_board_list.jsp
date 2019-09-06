<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css">
<link href="../css/member.css" rel="stylesheet">
<style type="text/css">
.row {
	margin: 0px auto;
	width: 900px;
}
.btn-sm{
	background-color:#FFF;
	color:#A5732A;
}
th{
	background-color:#FFF;
	color:#A5732A;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#findBtn').click(function() {
			var ss = $('#ss').val();
			if (ss.trim() == "") {
				$('#ss').focus();
				return;
			}
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	<!-- main(Q&A/FAQ)출력 -->
	  <section id="portfolio">
                <ul class="portfolio-filter text-center">
                    <li><a class="btn btn-default" href="../site/site_list.do">FAQ</a></li>
                    <li><a class="btn btn-default active" href="../qnaboard/qna_board_list.do">Q&A</a></li>
                    </ul>
 </section>
	<div class="row">
		<table class="table">

			<tr>
				<td class="text-left">
				<c:if test="${sessionScope.id!=null }">
						<a href="qna_board_insert.do" class="btn btn-sm">새글</a>
					</c:if>
					</td>
				<td class="text-right">${curpage } page / ${totalpage } pages</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<th width=7% class="text-center">번호</th>
				<th width=43% class="text-center">제목</th>
				<th width=15% class="text-center">이름</th>
				<th width=20% class="text-center">작성일</th>
				<th width=10% class="text-center">조회수</th>
			</tr>
			<c:set var="count" value="${count }" />
			<c:forEach var="vo" items="${list }" varStatus="s">
				<tr class="${s.index%2==0?'':'warning' }">
					<td width=7% class="text-center">${count }</td>
					<td width=43% class="text-left">
					<c:if test="${vo.group_tab > 0}">
						<c:forEach begin="1" end="${vo.group_tab}">
						&nbsp;&nbsp;
						</c:forEach>
						<img src="qna_rereply.gif">
					</c:if>
					<c:if test="${vo.id=='delete' }">
					<font color="red">탈퇴한 회원의 게시글입니다.</font>
					<%-- <c:if test="${today==vo.dbday }">
					<sup><font color=red>new</font></sup>
					</c:if> --%>
					</td>
					<td width=15% class="text-center"></td>
					<td width=20% class="text-center"></td>
					<td width=10% class="text-center"></td>
					</c:if>
					<c:if test="${vo.id!='delete' }">
					<a href="qna_board_detail.do?no=${vo.no }"><font color="black">${vo.subject }</font>&nbsp;${vo.count==0?'':[vo.count] }</a> 
					<c:if test="${today==vo.dbday }">
					<sup><font color=red>new</font></sup>
					</c:if>
					</td>
					<td width=15% class="text-center">${vo.id }</td>
					<td width=20% class="text-center">${vo.dbday }</td>
					<td width=10% class="text-center">${vo.hit }</td>
					</c:if>
				</tr>
				<c:set var="count" value="${count-1 }" />
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td class="text-left">
					<form method="post" action="qna_board_find.do" id="frm">
						<select name="fs" class="input-md form-control2" >
							<option value="id">이름</option>
							<option value="subject">제목</option>
						</select> 
						<input type=text name=ss size=15 class="input-sm form-control2" id="ss">
						<input type=button value="검색" class="btn btn-sm" id="findBtn">
					</form>
				</td>
				<td class="text-center">
					<ul class="pagination">
						<li><a href="qna_board_list.do?page=1">&lt;&lt;</a></li>
						<li><a href="qna_board_list.do?page=${startPage}">&lt;</a></li>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<li class="${i==curpage?'active':''}">
							<a href="qna_board_list.do?page=${i }">${i }</a>
						</c:forEach>
						<li><a href="qna_board_list.do?page=${endPage}">&gt;</a></li>
						<li><a href="qna_board_list.do?page=${allPage }">&gt;&gt;</a></li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>