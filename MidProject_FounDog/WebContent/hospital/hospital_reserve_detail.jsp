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

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#detailbtn').click(function(){
		var dogname=$('#selectDog').val();
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();	
		
		 $.ajax({ // 검색 결과 리스트 ajax
			type:'post',
			url:'hospital_reserve_list.do',
			data:{dogname:dogname,startDate:startDate,endDate:endDate},
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
		<div id="hospitalTitle">
			<h2 class="hostitle">예약 내역</h2>
		</div>

			<div style="width: 100%; height: 300px; border: solid 1px;">
			<table class="board_write">
				<colgroup>
				<col width="214px">
				<col width="">
				</colgroup>	
				<tr>
					<th>강아지 조회</th>
					<td>
						<select id="selectDog" class="form-control2">
						<option value="">전체</option>
						<c:forEach var="doglist" items="${doglist }">
							<option>${doglist}</option>
						</c:forEach>
						</select>				
					</td>
				</tr>
				<tr>
					<th>조회 기간</th>
					<td>
					<input type="date" id="startDate">&nbsp;~&nbsp;<input type="date" id="endDate">			
					</td>
				</tr>		
			</table>
				<div style="width: 100%; height: 70px; border: solid 1px;">
					<input type="button" id="detailbtn" value="조회" style="position:relative; top:50%; left:50%;">
				</div>
				<div style="width: 100%; height: 80px; border: solid 1px;">
					ㅁㅁㅁ 고객님의 예약 내역입니다.
				</div>
			</div>
		
		<div id="reservelist" style="width: 100%; height: 400px; border: solid 1px;">
			<table>
				<tr>
					<th>예약 번호</th>
					<th>의뢰일</th>
					<th>보호자명</th>
					<th>동물명</th>
					<th>예약일시</th>
					<th>예약시간</th>
					<th>예약상태</th>
					<th>진료병원</th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>