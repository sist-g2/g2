<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

#dogInsert{
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-right: 3px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
}

.dogSel{
display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-right: 3px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$('.dogSel').click(function(){
	var dname=$(this).attr("data-dname");
	var dno=$(this).attr("data-dno");

	$('#dname').val(dname);
	$('#dogNo').val(dno);
	$("#contents2 > a").focus();
    $("#layerPopup2").hide();
	
});

$("#dogInsert").click(function(){
	    
    $.ajax({ 
		type:'post',
		url:'hospital_dog_insert.do',
		success:function(response)
		{	
			$("#PopupDog").html(response);
		}
	});
    
$("#contents2 > a").blur();
$("#layerPopup2").show();
$("#layerPopup2 a").focus();


return false;
});
</script>
</head>
<body>
	<div id="container">
		<span style="font-size: 20px">등록된 강아지</span>
			<input type="button" value="추가하기" id="dogInsert">
	
		<div id="dogdiv" style="height: 400px; width: 510px; overflow: auto;">
			<table style="height: 100px; width: 500px">
				<tr>
					<th>강아지 이름</th>
					<th>품종</th>
					<th>생년월일</th>
					<th>성별</th>
					<th></th>
				</tr>
			<c:forEach var="vo" items="${list }">
				<tr style="border: solid 1px #D5D5D5;">
					<td class="dogname">${vo.dname}</td>
					
					<td>${vo.dtype}</td>	
					<td>${vo.dbirth}</td>	
					<td>${vo.dsex}</td>	
				<td><input type="hidden" class="dno" value="${vo.dno }">
				<input type="button" value="선택" data-dno="${vo.dno}" data-dname="${vo.dname}" class="dogSel"></td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>