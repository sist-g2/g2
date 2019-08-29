<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$('#PgUp').click(function(){
	$("html").animate({scrollTop : 0}, 500);
});

$('#PgDwn').click(function(){
	$("html").animate({scrollTop : ($(document).height())}, 500);
});
</script>
</head>
<body>
<div style="margin: 0px auto; text-align: center; margin-bottom: 10px;" >
	<button id="PgUp" >▲</button>
</div>
<div style="margin: 0px auto; text-align: center; margin-bottom: 5px;" >
	<span class="simpleInfo" >최근 본 상품</span>
</div>
<c:forEach var="ck" items="${clist }">
	<div style="border: 1px solid #c3c3c3; height: 52px; width: 52px; margin: 0px auto; margin-bottom: 5px;" >
		<a href="../feed/feed_detail.do?no=${ck.no }" ><img src="${ck.feedImg }" height="50px" width="50px"></a>
	</div>
</c:forEach>
<div style="margin: 0px auto; text-align: center; margin-top: 10px;" >
	<button id="PgDwn" >▼</button>
</div>
</body>
</html>