<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/feed.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div class="container" >
	<section id="option">
		<div class="row" >
			<div class="col-md-3 col-sm-5">
				<div class="sidebar blog-sidebar">
					<form action="" method="post" name="frm" >
						<div class="sidebar-item">
							<h3>사료 종류</h3>
							<c:forEach var="cate" items="${cateList }">
								<label class="category" ><input type="checkbox" value="${cate.no }" >&nbsp;<span class="forLabel">${cate.name }</span></label><br/>
							</c:forEach>
						</div>
						<div class="sidebar-item">
							<h3>브랜드</h3>
							<div class="scrl" >
								<c:forEach var="brnd" items="${brndList }">
									<label class="brand" ><input type="checkbox" value="${brnd.no }" >&nbsp;<span class="forLabel">${brnd.name }</span></label><br/>
								</c:forEach>
							</div>
						</div>
						<div class="sidebar-item">
							<h3>급여대상</h3>
							<c:forEach var="tg" items="${tgList }">
								<label class="target" ><input type="checkbox" value="${tg.no }" >&nbsp;<span class="forLabel">${tg.name }</span></label><br/>
							</c:forEach>
						</div>
						<div class="sidebar-item">
							<h3>주재료</h3>
							<div class="scrl" >
								<c:forEach var="mtr" items="${mtrList }">
									<label class="material" ><input type="checkbox" value="${mtr.no }" >&nbsp;<span class="forLabel">${mtr.name }</span></label><br/>
								</c:forEach>
							</div>
						</div>
						<div class="sidebar-item">
							<h3>알갱이크기</h3>
							<c:forEach var="grn" items="${grnList }">
								<label class="grain" ><input type="checkbox" value="${grn.no }" >&nbsp;<span class="forLabel">${grn.name }</span></label><br/>
							</c:forEach>
						</div>
						<div class="sidebar-item tag-cloud">
							<ul class="nav nav-pills">
								<li><a href="#">옵션 삭제</a></li>
								<li><a href="#">적용</a></li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<section id="proList">
	
	</section>
</div>
</body>
</html>