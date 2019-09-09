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
<link rel="stylesheet" href="../main/css/main.css">
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
.portfolio-filter {
    /* margin: 40px 0; */
    margin-top:40px;
    margin-bottom:40px;
    padding: 0;
}
.portfolio-filter2 {
     margin: 40px 0;
 /*    margin-top:40px;
    margin-bottom:80px; */
    padding: 0;
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
	<section id="portfolio">
	  <ul class="portfolio-filter protfolio-filter2 text-center">
	                 <li><a class="btn btn-default active" href="../dogboard/dogboard_list.do">유기견제보게시판</a></li>
                    <li><a class="btn btn-default" href="../board/board_list.do">자유게시판</a></li>
           </ul>
     </section>
     <section id="portfolio">
                <ul class="portfolio-filter text-center">
                    <li><a class="btn btn-default active" href="../dogboard/dogboard_list.do">모두보기</a></li>
                    <li><a class="btn btn-default" href="../dogboard/dogboard_report.do">찾습니다</a></li>
                    <li><a class="btn btn-default" href="../dogboard/dogboard_look.do">발견 또는 보호중</a></li>                   
                   </ul>
 	</section>
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
				<div class="col-xs-6 col-sm-4 col-md-3 portfolio-item branded logos" style="width: 225px; height: 370px;">
						<c:choose>
							<c:when test="${vo.category == 0 }">
							<h5 style="text-align: center">찾습니다</h5></c:when>
							<c:when test="${vo.category == 1 }">
							<h5 style="text-align: center">발견했습니다</h5></c:when>							
						</c:choose>
                        <div class="portfolio-wrapper" style="border: 1px solid gray; width: 200px; height: 330px;">
                            <div class="portfolio-single">
                                <div class="portfolio-thumb">                                	
                                    <a href="dogboard_detail.do?no=${vo.no }"><img src="upload/${vo.filename }" class="img" style="width: 198px; height: 198px;" ></a>                                     
                                </div>
                            </div>
                            <div class="portfolio-info">
                                <h5>이름 : ${vo.dname }</h5>
                                <h5>견종 : ${vo.dtype }</h5>
                                <h5>실종위치 : ${vo.area }</h5>
                             <c:choose>
                                <c:when test="${vo.category == 0 }">
                                <h5>실종날짜 : ${vo.DLFDATE }</h5></c:when>
                                <c:when test="${vo.category == 1 }">
                            	<h5>제보날짜 : ${vo.DLFDATE }</h5></c:when>
                             </c:choose>
                            </div>
                        </div>
                    </div>
				<c:set var="count" value="${count-1 }" />
 			</c:forEach>

		</table>
		<table class="table">
			<tr>
				<td class="text-left">
					<form method="post" action="dogboard_find.do" id="frm">						 
						<select name="fs" class="input-md form-control2">
							<option value="dname">이름</option>
							<option value="dtype">견종</option>
							<option value="area">지역</option>
						</select> 
						<input type=text name=ss size=15 class="input-sm form-control2" id="ss">
						<input type=button value="검색" class="btn btn-sm" id="findBtn">
					</form>
				</td>
				<!-- 5p씩 나누기 -->
				<td class="text-center">
					<ul class="pagination">
						<li><a href="dogboard_list.do?page=1">&lt;&lt;</a></li>
						<c:if test="${curpage != startPage }">
						<li><a href="dogboard_list.do?page=${curpage-1}">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<li class="${i==curpage?'active':''}">
							<a href="dogboard_list.do?page=${i }">${i }</a>
						</c:forEach>
						<c:if test="${curpage != endPage }">
						<li><a href="dogboard_list.do?page=${curpage+1}">&gt;</a></li>
						</c:if>
						<li><a href="dogboard_list.do?page=${allPage }">&gt;&gt;</a></li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>