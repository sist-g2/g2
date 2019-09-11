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
.portfolio-filter {
    /* margin: 40px 0; */
    margin-top:0px;
    margin-bottom:80px;
    padding: 0;
}
.portfolio-filter2 {
     margin: 40px 0;
 /*    margin-top:40px;
    margin-bottom:80px; */
    padding: 0;
}
.container2 {
    width: 1170px;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div class="container2">
<div class="site_list_row" >
		<div id="sboardTitle">
			<h2 class="sbodtitle">FAQ</h2>
		</div>
		<div class="col-md-3 col-sm-5">
                    <div class="sidebar blog-sidebar">                           
                        <div class="sidebar-item categories" style="margin-top: 40px">
                            <h3>사이트 이용안내</h3>
                            <ul class="nav navbar-stacked">
                                <li class="active"><a href="../site/site_list.do">FAQ<span class="pull-right"></span></a></li>
                                <li><a href="../qnaboard/qna_board_list.do">Q&A<span class="pull-right"></span></a></li>
                            </ul>
                        </div>                                        
                    </div>
                </div>	
<!-- main(Q&A/FAQ)출력 -->
 <!-- <section id="portfolio">
                <ul class="portfolio-filter portfolio-filter2 text-center">
                    <li><a class="btn btn-default active" href="../site/site_list.do">FAQ</a></li>
                    <li><a class="btn btn-default" href="../qnaboard/qna_board_list.do">Q&A</a></li>
                    </ul>
		</section> -->
		 <section id="portfolio">
                <ul class="portfolio-filter text-center">
                    <li><a class="btn btn-default ${cate==0?'active':'' }" href="../site/site_list.do?cate=0" >회원정보</a></li>
                    <li><a class="btn btn-default ${cate==1?'active':'' }" href="../site/site_list.do?cate=1" >상품정보</a></li>
                    <li><a class="btn btn-default ${cate==2?'active':'' }" href="../site/site_list.do?cate=2" >병원이용</a></li>
                    <li><a class="btn btn-default ${cate==3?'active':'' }" href="../site/site_list.do?cate=3" >커뮤니티</a></li>
                    </ul>
		</section>
		
		<!-- FAQ -->
		<div class="container">
		<div class="col-md-9 col-sm-7">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<c:forEach var="vo" items="${list}" varStatus="s">
						<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapse${vo.no }">Q${s.index+1 }. ${vo.subject }</a>
									<!-- Q1~Q(No) -->
									<%-- <c:if test="${cate==0}">Q${vo.no-5}. ${vo.subject}</c:if>
									<c:if test="${cate==1}">Q${vo.no+7}. ${vo.subject}
									</c:if> --%>
								</h4>
						</div>
						<div id="collapse${vo.no }" class="panel-collapse collapse out">
							<div class="panel-body">A${s.index+1 }. ${vo.content}</div>
						</div>
					</c:forEach>
				</div>
			</div>
	 	</div>
	 	</div>
	 	</div>
	 	</div>
	</body>
</html>