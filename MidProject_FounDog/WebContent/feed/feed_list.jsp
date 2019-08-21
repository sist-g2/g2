<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/feed.css" rel="stylesheet">
</head>
<body>
<div class="container" >
	<section id="option">
		<div class="row" >
			<div class="col-md-3 col-sm-5">
				<div class="sidebar blog-sidebar">
					<div class="sidebar-item">
						<h3>사료 종류</h3>
						<label class="category" ><input type="checkbox" value="cate0" >&nbsp;<span class="forLabel">사료</span></label><br/>
						<label class="category" ><input type="checkbox" value="cate1" >&nbsp;<span class="forLabel">건식사료</span></label><br/>
						<label class="category" ><input type="checkbox" value="cate2" >&nbsp;<span class="forLabel">습식사료</span></label><br/>
						<label class="category" ><input type="checkbox" value="cate3" >&nbsp;<span class="forLabel">소프트사료</span></label><br/>
					</div>
					<div class="sidebar-item">
						<h3>브랜드</h3>
						<div class="brand" >
							<label class="brand" ><input type="checkbox" value="brand0">&nbsp;<span class="forLabel">전체</span></label><br/>
							<label class="brand" ><input type="checkbox" value="brand1">&nbsp;<span class="forLabel">ANF</span></label><br/>
						</div>
					</div>
					<div class="sidebar-item">
						<h3>급여대상</h3>
						<label class="brand" ><input type="checkbox" value="tgt1">&nbsp;<span class="forLabel">전연령</span></label><br/>
						<label class="brand" ><input type="checkbox" value="tgt2">&nbsp;<span class="forLabel">강아지(1~12개월)</span></label><br/>
						<label class="brand" ><input type="checkbox" value="tgt3">&nbsp;<span class="forLabel">성견(1~7세)</span></label><br/>
						<label class="brand" ><input type="checkbox" value="tgt4">&nbsp;<span class="forLabel">노령견(7세 이상)</span></label><br/>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="proList">
	
	</section>
</div>
</body>
</html>