<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/member.css" rel="stylesheet">
<link rel="stylesheet" href="../main/css/bootstrap.min.css">
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
	<div class="row">
		<table class="table">

			<tr>
				<td class="text-left">
				<c:if test="${sessionScope.id!=null }">
						<a href="dogboard_insert.do" class="btn btn-sm">새글</a>
					</c:if>
					</td>
				<td class="text-right">${curpage } page / ${totalpage } pages</td>
			</tr>
		</table>
		<table class="table">
			<c:set var="count" value="${count }" />
			<c:forEach var="vo" items="${list }" varStatus="s">
<%-- 				<tr class="${s.index%2==0?'':'warning' }">
					<td width=7% class="text-center">${count }</td>
					<td width=43% class="text-left">
					<a href="board_detail.do?no=${vo.no }">${vo.subject }&nbsp;${vo.count==0?'':[vo.count] }</a> 
					<c:if test="${today==vo.dbday }">
					<sup><font color=red>new</font></sup>
					</c:if>
					</td>
					<td width=15% class="text-center">${vo.id }</td>
					<td width=20% class="text-center">${vo.dbday }</td>
					<td width=10% class="text-center">${vo.hit }</td>
				</tr> --%>
				<div class="col-xs-6 col-sm-4 col-md-3 portfolio-item branded logos">
                        <div class="portfolio-wrapper">
                            <div class="portfolio-single">
                                <div class="portfolio-thumb">                                	
                                    <a href="dogboard_detail.do?no=${vo.no }"><img src="upload/${vo.filename }" class="img-responsive" alt=""></a>                                     
                                </div>
                            </div>
                            <div class="portfolio-info ">
                                <h5>${vo.dname }</h5>
                                <h5>${vo.dage }</h5>
                                <h5>${vo.area }</h5>
                                <h5>${vo.dbday }</h5>
                            </div>
                        </div>
                    </div>
				<c:set var="count" value="${count-1 }" />
 			</c:forEach>

		</table>
		<table class="table">
			<tr>
				<td class="text-left">
					<form method="post" action="board_find.do" id="frm">
						Search: 
						<select name="fs" class="input-md form-control2">
							<option value="id">이름</option>
							<option value="subject">제목</option>
						</select> 
						<input type=text name=ss size=15 class="input-sm form-control2" id="ss">
						<input type=button value="검색" class="btn btn-sm" id="findBtn">
					</form>
				</td>
				<!-- 5p씩 나누기 -->
				<td class="text-center">
					<ul class="pagination">
						<li><a href="board_list.do?page=1">&lt;&lt;</a></li>
						<li><a href="board_list.do?page=${startPage-1}">&lt;</a></li>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<li class="${i==curpage?'active':''}">
							<a href="board_list.do?page=${i }">${i }</a>
						</c:forEach>
						<li><a href="board_list.do?page=${endPage+1}">&gt;</a></li>
						<li><a href="board_list.do?page=${allPage }">&gt;&gt;</a></li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>