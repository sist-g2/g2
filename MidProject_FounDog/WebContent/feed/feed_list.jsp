<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/feed.css" type="text/css" rel="stylesheet">
<style type="text/css">
.row {
	margin: 0px auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div class="container" >
	<div class="row" >
		<div class="feedList" >
			<h3 class="page-header text-center">사료 가격비교</h3>
			<div class="optionList" >
				<form method="post" action="feed_list_find.do">
					<table class="table table-borderless" >
						<tr>
							<th width=10% class="text-left" ><h5>&nbsp;&nbsp;사료 종류</h5></th>
							<td width=90% >
								<input type="radio" id="cate-999" name="category" value="cate-999" />
								<label for="cate-999">&nbsp;&nbsp;전체&nbsp;&nbsp;</label>&nbsp;&nbsp;
								<c:forEach var="cate" items="${cateList }">
									<input type="radio" id="cate-${cate.no }" name="category" value="cate-${cate.no }" />
									<label for="cate-${cate.no }">&nbsp;&nbsp;${cate.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th width=10% class="text-left" ><h5>&nbsp;&nbsp;브랜드</h5></th>
							<td width=90% >
								<c:forEach var="brnd" items="${brndList }">
									<input type="checkbox" id="brnd-${brnd.no }" name="brand" value="brnd-${brnd.no }" />
									<label for="brnd-${brnd.no }">&nbsp;&nbsp;${brnd.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th width=10% class="text-left" ><h5>&nbsp;&nbsp;연령</h5></th>
							<td width=90% >
								<c:forEach var="tg" items="${tgList }">
									<input type="checkbox" id="tg-${tg.no }" name="tg" value="tg-${tg.no }" />
									<label for="tg-${tg.no }">&nbsp;&nbsp;${tg.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th width=10% class="text-left" ><h5>&nbsp;&nbsp;주원료</h5></th>
							<td width=90% >
								<c:forEach var="mtr" items="${mtrList }">
									<input type="checkbox" id="mtr-${mtr.no }" name="mtr" value="mtr-${mtr.no }" />
									<label for="mtr-${mtr.no }">&nbsp;&nbsp;${mtr.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th width=10% class="text-left" ><h5>&nbsp;&nbsp;알갱이 크기</h5></th>
							<td width=90% >
								<c:forEach var="grn" items="${grnList }">
									<input type="checkbox" id="grn-${grn.no }" name="grn" value="grn-${grn.no }" />
									<label for="grn-${grn.no }">&nbsp;&nbsp;${grn.name }&nbsp;&nbsp;</label>&nbsp;&nbsp;
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td colspan=2 class="text-center" >
								<button type="button" id="opDel" >조건 삭제</button>&nbsp;&nbsp;
								<button type="submit" >검색</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="ListSort" >
				<div style="height: 30px;" ></div>
				<form method="post" action="feed_list_sort.do" >
					<button type="submit" class="list_sort_btn" value="" >조회수 순</button>
					<button type="submit" class="list_sort_btn" value="" >낮은 가격 순</button>
					<button type="submit" class="list_sort_btn" value="" >높은 가격 순</button>
					<button type="submit" class="list_sort_btn" value="" >찜 많은 순</button>
					<button type="submit" class="list_sort_btn" value="" >리뷰 많은 순</button>
				</form>
				<div style="height: 30px;" ></div>
			</div>
			
			<div class="fdList" >
				<c:forEach var="vo" items="${fdList }">
					<div class="fd_goods" >
						<div class="fd_img" >
							<img src="${vo.feedImg }" width=235px height=235px >
						</div>
						<div class="fd_info" >
							<div style="height: 55px;" ><span class="fd_info_name" >${vo.name }</span></div>
							<div style="height: 35px;" ><span class="fd_info_price" >￦16,000</span></div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="blog-pagination">
				<ul class="pagination">
					<li><a href="#">left</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li class="active"><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
					<li><a href="#">9</a></li>
					<li><a href="#">right</a></li>
				</ul>
			</div>
		
		</div>
	</div>
</div>
</body>
</html>