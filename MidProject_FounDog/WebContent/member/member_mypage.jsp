<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/member.css" rel="stylesheet">
<style type="text/css">
.row{
	margin: 0px auto;
	width: 1200px;
}
</style>
</head>
<body>
<!-- 상단 제목 -->
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">MyPage</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /상단 제목 -->

<section id="shortcodes">
	<div class="container">
		<h4 class="page-header text-center">ㅇㅇㅇ님, 안녕하세요!</h4>
		<div class="live-preview text-center">
			<a href="../member/member_update.do" class="btn btn-common uppercase">회원 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../member/member_delete.do" class="btn btn-common uppercase">회원 탈퇴</a>
		</div>
        
		<div id="feature-container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="page-header">바로가기</h2>
				</div>
				<div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
					<div class="feature-inner">
						<div class="icon-wrapper">
							<a href="#"><i class="fa fa-2x fa-envelope-o"></i></a>
						</div>
						<h2>진료 내역</h2>
					</div>
				</div>
				<div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="600ms">
					<div class="feature-inner">
						<div class="icon-wrapper">
							<a href="#"><i class="fa fa-2x fa-heart-o"></i></a>
						</div>
						<h2>진료 예약 내역</h2>
					</div>
				</div>
				<div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="900ms">
					<div class="feature-inner">
						<div class="icon-wrapper">
							<a href="#"><i class="fa fa-2x fa-star-o"></i></a>
						</div>
						<h2>예방접종 내역</h2>
					</div>
				</div>
				<div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="1200ms">
					<div class="feature-inner">
						<div class="icon-wrapper">
							<a href="../feed/feed_fav_List.do"><i class="fa fa-2x fa-comments-o"></i></a>
						</div>
						<h2>찜 목록</h2>
					</div>
				</div>                        
			</div>
		</div><!-- feature-container -->
		
	</div>
</section>  
</body>
</html>