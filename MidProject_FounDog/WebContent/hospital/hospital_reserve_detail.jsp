<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/hospital.css" rel="stylesheet">
<style type="text/css">
.reserve_detail_row{
	margin: 0px auto;
	width: 900px;
}
#detailbtn {
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-left: 5px;
	width: 85px;
	height: 85px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#detailbtn').click(function(){
		var dno=$('#selectDog option:selected').attr("data-no");
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();	
		
		 $.ajax({ // 검색 결과 리스트 ajax
			type:'post',
			url:'hospital_reserve_list.do',
			data:{dno:dno,startDate:startDate,endDate:endDate},
			success:function(response)
			{	
				$("#reservelist").html(response);	
			
			}
		});
	});
});
</script>
</head>
<body>
<div class="container">
	<div class="reserve_detail_row" >
	
		<div id="hospitalTitle">
			<h2 class="hostitle">예약 내역</h2>
		</div>
		
		<table class="" style="width: 100%;" >
			<tr>
				<th width="15%" >
					<h4>강아지 조회</h4>
				</th>
				<td width="55%" style="padding: 5px;" >
					<select id="selectDog" class="form-control2">
						<option data-no="">전체</option>
						<c:forEach var="vo" items="${doglist }">
							<option data-no="${vo.dno }">${vo.dname}</option>
						</c:forEach>
					</select>				
				</td>
				<td rowspan=2 width="30%" style="text-align: right;">
					&nbsp;&nbsp;<input type="button" id="detailbtn" value="조회" >&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th width="15%" >
					<h4>조회 기간</h4>
				</th>
				<td width="55%" style="padding: 5px;" >
					<input type="date" id="startDate">&nbsp;~&nbsp;<input type="date" id="endDate">			
				</td>
			</tr>
		</table>
	
		<div id="reservelist" style="width: 100%; height: 400px; border: solid 0px; text-align: center;">
			<br><h4>예약 내역을 조회해보세요.</h4>
		</div>
		
	</div>
</div>
</body>
</html>