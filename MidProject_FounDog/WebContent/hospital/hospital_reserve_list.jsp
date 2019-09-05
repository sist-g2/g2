<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	$('.pageBtn').click(function(){
		var page = $(this).val();
		var dogname=$('#selectDog').val();
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();	
		
		 $.ajax({ // 검색 결과 리스트 ajax
			type:'post',
			url:'hospital_reserve_list.do',
			data:{dogname:dogname,startDate:startDate,endDate:endDate,page:page},
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
	<table style="width: 100%; height: 100%;">
		<caption class="text-center" style="padding: 20px;">
			<h3> ${sessionScope.name }님의 예약 내역입니다.</h3>
		</caption>
		<tr height="50px">
			<th class="text-left" width="10%" ><font style="font-weight: 400; font-size: 16px;">예약 번호</font></th>
			<th class="text-left" width="15%" ><font style="font-weight: 400; font-size: 16px;">의뢰일</font></th>
			<th class="text-left" width="10%" ><font style="font-weight: 400; font-size: 16px;">보호자명</font></th>
			<th class="text-left" width="10%" ><font style="font-weight: 400; font-size: 16px;">동물명</font></th>
			<th class="text-left" width="15%" ><font style="font-weight: 400; font-size: 16px;">예약일시</font></th>
			<th class="text-left" width="10%" ><font style="font-weight: 400; font-size: 16px;">예약시간</font></th>
			<th class="text-left" width="10%" ><font style="font-weight: 400; font-size: 16px;">예약상태</font></th>
			<th class="text-left" width="20%" ><font style="font-weight: 400; font-size: 16px;">진료병원</font></th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
					<td class="text-left" width="10%" >${vo.no }</td>
					<td class="text-left" width="12%" >${vo.reception_date }</td>
					<td class="text-left" width="10%" >${vo.name }</td>
					<td class="text-left" width="10%" >${vo.dname }</td>
					<td class="text-left" width="12%" >${vo.reserve_date }</td>
					<td class="text-left" width="10%" >${vo.reserve_time }</td>
					<td class="text-left" width="10%" >
						<c:if test="${vo.state=='예약중' }">
							<font color="orange" >${vo.state }</font>
						</c:if>
						<c:if test="${vo.state=='진료완료' }">
							<font color="green" >${vo.state }</font>
						</c:if>
						<c:if test="${vo.state=='예약취소' }">
							<font color="red" >${vo.state }</font>
						</c:if>
					</td>
					<td class="text-left" width="26%" >${vo.hosname }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan=8 class="text-center" >
				<div class="blog-pagination">
					<div style="height: 30px;" ></div>
					<ul class="pagination">
						<c:if test="${curpage>3 }" >
							<li><button type="button" class="pageBtn" id="firstPage" name="page" value="1"></button></li>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" >
							<li class="${i==curpage?'active':'' }" ><button type="button" class="pageBtn" name="page" value="${i }">${i }</button></li>
						</c:forEach>
						<c:if test="${curpage<totalPage-2 }" >
							<li><button type="button" class="pageBtn" id="lastPage" name="page" value="${totalPage }"></button></li>
						</c:if>
					</ul>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>