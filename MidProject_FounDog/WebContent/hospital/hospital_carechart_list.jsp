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
.carechart_detail_row{	
	height: 750px;
}

#carechart_list_table th{
	border-top: 1px solid #444444;
	border-bottom: 1px solid #444444;
	padding: 5px;
}
#carechart_list_table .content td{
	border-bottom: 1px solid #444444;
	padding: 8px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
$('.detailbtn').click(function(){
	var no = $(this).attr("data-no");

	var wintype = "toolbar=no,width=800,height=600,top=150,left=150,directories=no,menubar=no,scrollbars=yes";
	var childWin = window.open("hospital_carechart_certificate.do?no="+no, "childWin", wintype);

	});
	$('.pageBtn').click(function(){
		var page = $(this).val();
		var dogname=$('#selectDog').val();
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();	
		
		 $.ajax({ // 검색 결과 리스트 ajax
			type:'post',
			url:'hospital_carechart_list.do',
			data:{dogname:dogname,startDate:startDate,endDate:endDate,page:page},
			success:function(response)
			{	
				$("#carechartlist").html(response);	
			
			}
		});
	});
});
</script>
</head>
<body>
	<table id="carechart_list_table" style="width: 100%;">
		<caption class="text-center" style="padding: 20px;">
			<h3> ${sessionScope.name }님의 진료 내역입니다.</h3>
		</caption>
		<tr height="50px">
			<th class="text-left" width="10%" ><font style="font-weight: 400; font-size: 16px;">진료 번호</font></th>
			<th class="text-left" width="15%" ><font style="font-weight: 400; font-size: 16px;">진료날짜</font></th>
			<th class="text-left" width="10%" ><font style="font-weight: 400; font-size: 16px;">의사명</font></th>
			<th class="text-left" width="10%" ><font style="font-weight: 400; font-size: 16px;">동물명</font></th>
			<th class="text-left" width="20%" ><font style="font-weight: 400; font-size: 16px;">진료병원</font></th>
			<th class="text-left" width="20%" ><font style="font-weight: 400; font-size: 16px;">상세보기</font></th>
		</tr>
		<c:if test="${empty list}">
			<tr class="content" height="50px">
				<td class="text-left" width="10%" colspan="6" style="text-align: center;" >조회된 내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list}" >
			<c:forEach var="vo" items="${list }">
				<tr class="content" height="50px">
					<td class="text-left" width="10%" >${vo.no }</td>
					<td class="text-left" width="12%" >${vo.caredate }</td>
					<td class="text-left" width="10%" >${vo.doctor }</td>
					<td class="text-left" width="10%" >${vo.dogname }</td>
					<td class="text-left" width="15%" >${vo.hospitalname }</td>
					<td class="text-left" width="10%" ><input type="button" value="상세보기" style="color: #ffffff; background: #bd8942; width: 70px; height: 25px; border-style: none; border-radius: 4px;" class="detailbtn"data-no="${vo.no }"></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan=8 class="text-center" >
					<div class="blog-pagination">
						<div style="height: 30px;" ></div>
						<ul class="pagination">
							<li><button type="button" class="pageBtn" name="page" value="1">&lt;&lt;</button></li>
							<li><button type="button" class="pageBtn" name="page" value="${curpage<=5?1:startPage-1}">&lt;</button></li>
							<c:forEach var="i" begin="${startPage }" end="${endPage }" >
								<li class="${i==curpage?'active':'' }" ><button type="button" class="pageBtn" name="page" value="${i }">${i }</button></li>
							</c:forEach>
							<li>
			                  <c:if test="${totalPage%BLOCK==0 }" >
			                  	<button type="button" class="pageBtn" name="page" value="${curpage<=(totalPage-BLOCK)?endPage+1:endPage}" >&gt;</button>
			                  </c:if>
			                  <c:if test="${totalPage%BLOCK!=0 }" >
			                  	<button type="button" class="pageBtn" name="page" value="${curpage>totalPage-(totalPage%BLOCK)?endPage:endPage+1}" >&gt;</button>
			                  </c:if>
			                </li>
							<li><button type="button" class="pageBtn" name="page" value="${totalPage }">&gt;&gt;</button></li>
						</ul>
					</div>
				</td>
			</tr>
		</c:if>
		
	</table>
</body>
</html>