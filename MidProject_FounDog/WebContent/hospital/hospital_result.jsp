<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div id="totalresult">
			<c:choose>
				<c:when test="${list ne null && list.size() ne 0}">
					<h3>전체 ${totalResult}건의 검색 결과가 있습니다.</h3>
				</c:when>
				<c:when test="${list.size() eq 0}">
					<h3>검색 결과가 없습니다.</h3>
				</c:when>
			</c:choose>
		</div>
		<div id="search_result">
		
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.reservebtn').click(function(){
		var id='${id}';
		if(id.trim()==""){
			alert("로그인이 필요한 서비스입니다.");
			location.href='../member/member_login.do';
			return;
		}
		  if(confirm("예약 하시겠습니까?") == true){
		$('form').submit();		        
		    }
		    else{
		        return ;
		    }
	});
	
	$('.result_page').click(function(){
	 	var page=$(this).attr("data-page");
	 	var loc=$('#searchloc').val();
		var name=$('#searchname').val();

	 	$.ajax({
			type:'post',
			url:'hospital_result.do',
			data:{page:page,loc:loc,name:name},
			success:function(response)
			{								
				var searchResult = $(response).find('#search_result');
				$("#hospital_result").html(searchResult);	
				
			}
		}); 
	});
});
</script>	
			<div style="overflow: auto; height: 470px; width: 100%">
				<table class="table">
						<c:if test="${list.size() eq 0 }">
							<tr>
								<td class="text-center">검색 결과가 없습니다.</td>
							</tr>
						</c:if>					
					<c:forEach var="vo" items="${list }">
						<tr>
							<td class="text-left">${vo.name }<br> ${vo.loc }<br>${vo.tel }
						<form class="reserveForm" method="post" action="hospital_reserve.do">
								<input type="hidden" name="no" value="${vo.no }">
						</form>
								 <input type="button" class="btn btn-primary reservebtn" value="예약">
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-sm-4" style="height: 70px; width: 100%">
				<ul class="pagination pagination-lg">
					<c:if test="${curpage>BLOCK }">
			           <li><input type="button" class="result_page" data-page="1" value="&lt;&lt;"></li>
			           <li><input type="button" class="result_page" data-page="${startPage-1 }" value="&lt;"></li>
			         </c:if>
					 <c:forEach var="i" begin="${startPage }" end="${endPage }">
					   <li class=${curpage==i?"active":"" }><input type="button" class="result_page" data-page="${i}" value="${i}"></li>
					 </c:forEach> 
					 <c:if test="${endPage<allPage }">
					   <li><input type="button" class="result_page" data-page="${endPage+1 }" value="&gt;"></li>
					   <li><input type="button" class="result_page" data-page="${allPage }" value="&gt;&gt;"></li>
			         </c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>