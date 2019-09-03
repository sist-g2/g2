<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css">
<link rel="stylesheet" href="../main/css/main.css">
<style type="text/css">
.row {
	margin: 0px auto;
	width: 900px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<!-- 제목 -->
	<section id="page-breadcrumb">
	<div class="vertical-center">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">FAQ</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- main(Q&A/FAQ)출력 -->
 <section id="portfolio">
                <ul class="portfolio-filter text-center">
                    <li><a class="btn btn-default active" href="../site/site_list.do">FAQ</a></li>
                    <li><a class="btn btn-default" href="../qnaboard/qna_board_list.do">Q&A</a></li>
                    </ul>
		</section>
		 <section id="portfolio">
                <ul class="portfolio-filter text-center">
                    <li><a class="btn btn-default ${cate==0?'active':'' }" href="../site/site_list.do?cate=0" >회원정보</a></li>
                    <li><a class="btn btn-default ${cate==1?'active':'' }" href="../site/site_list.do?cate=1" >사료비교</a></li>
                    <li><a class="btn btn-default ${cate==2?'active':'' }" href="../site/site_list.do?cate=2" >병원이용</a></li>
                    <li><a class="btn btn-default ${cate==3?'active':'' }" href="../site/site_list.do?cate=3" >강아지와함께</a></li>
                    </ul>
		</section>
		
			<!-- FAQ -->
			<c:forEach var="item" items="${list}">
			       <div class="container">
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">${vo.subject}</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body">${vo.content}</div>
							</div>
						</div>
					</div>
					</div>
		</c:forEach>
</body>
</html>