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
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h2 class="text-center">검색결과</h2>
			<table class="table">
				<tr>
					<td class="text-left">
					<a href="dogboard_list.do" class="btn btn-sm">목록</a>
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
			<c:forEach var="vo" items="${list }" varStatus="s">
				<div class="col-xs-6 col-sm-4 col-md-3 portfolio-item branded logos">
                        <div class="portfolio-wrapper" style="border: 1px solid gray">
                            <div class="portfolio-single">
                                <div class="portfolio-thumb">                                	
                                    <a href="dogboard_detail.do?no=${vo.no }"><img src="upload/${vo.filename }" class="img-responsive" alt=""></a>                                     
                                </div>
                            </div>
                            <div class="portfolio-info">
                                <h5>이름 : ${vo.dname }</h5>
                                <h5>견종 : ${vo.dtype }</h5>
                                <h5>실종위치 : ${vo.area }</h5>
                                <h5>실종날짜 : ${vo.dbday }</h5>
                            </div>
                        </div>
                    </div>
				<c:set var="count" value="${count-1 }" />
 			</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
	</body>
</html>
