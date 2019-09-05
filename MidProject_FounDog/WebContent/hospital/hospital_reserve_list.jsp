<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<c:forEach var="vo" items="${list }">
		<tr>
				<td>${vo.no }</td>
				<td>${vo.reception_date }</td>
				<td>${vo.name }</td>
				<td>${vo.dname }</td>
				<td>${vo.reserve_date }</td>
				<td>${vo.reserve_time }</td>
				<td>${vo.state }</td>
				<td>${vo.hosname }</td>
		</tr>
			</c:forEach>
		<tr>
			<td>
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