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
</head>
<body>
<!-- 제목 -->
	<section id="page-breadcrumb">
	<div class="vertical-center sun">
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
                    <li><a class="btn btn-default" href="../board/board_list.do" data-filter=".Q&A">Q&A</a></li>
                    <li><a class="btn btn-default active" href="../site/site_list.do" data-filter=".FAQ">FAQ</a></li>
                    </ul>
		</section>
		 <section id="portfolio">
                <ul class="portfolio-filter text-center">
                    <li><a class="btn btn-default active" href="../board/board_list.do" data-filter=".회원정보">회원정보</a></li>
                    <li><a class="btn btn-default" href="../site/site_list.do" data-filter=".사료비교">사료비교</a></li>
                    <li><a class="btn btn-default" href="../site/site_list.do" data-filter=".병원이용">병원이용</a></li>
                    <li><a class="btn btn-default" href="../site/site_list.do" data-filter=".강아지와함께">강아지와함께</a></li>
                    </ul>
		</section>
			<!-- FAQ 10개 -->
			       <div class="container">
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> FAQ1 </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body">사이트이용하는법</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"> {vo.subject} </a>
								</h4>
							</div>	
					</div>
</body>
</html>