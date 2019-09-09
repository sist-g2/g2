<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rowbody {
	margin: 0px auto;
	width: 400px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#yearSel').change(function(){
		  var year = this.options[this.selectedIndex].text;
		  var no=$('#hosNo').val();
		  $.ajax({ 
				type:'post',
				url:'hospital_diary.do',
				data:{year:year,no:no},
				success:function(response)
				{	
					$("#PopupDiary").html(response);					
				}
			});
	
	});
	$('#monthSel').change(function(){		
		var month = this.options[this.selectedIndex].text;
		var no=$('#hosNo').val();
		  $.ajax({ 
				type:'post',
				url:'hospital_diary.do',
				data:{month:month,no:no},
				success:function(response)
				{	
					$("#PopupDiary").html(response);					
				}
			});
	});
	
	$('.dates').click(function(){
		var date = new Date();
		var year=$(this).attr("data-year");
		var month=$(this).attr("data-month");
		var day=$(this).text();
		
		var data=year+"-"+month+"-"+day;
		$('#reserve_day').val(data);
		$.ajax({
			type:'post',
			url:'hospital_time.do',
			data:{day:day},
			success:function(response){
				$("#contents > a").focus();
			    $("#layerPopup").hide();
				$('#wr_5_div').html(response);
			}
		})
	});
	
});
</script>
</head>
<body>
	<h3 class="text-center">${year }년${month }월</h3>
	<div class="rowbody">
		<table class="table table-hover">
			<tr>
				<td><select name="year" class="input-sm" id="yearSel">
						<c:forEach var="i" begin="2019" end="2025">
							<option ${i==year?"selected":"" }>${i}</option>
						</c:forEach>
				</select>년도&nbsp;&nbsp; <select name="month" class="input-sm" id="monthSel">
						<c:forEach var="i" begin="1" end="12">
							<option ${i==month?"selected":"" }>${i}</option>
						</c:forEach>
				</select>월</td>
			</tr>
		</table>
		<table class="table">
			<tr class="success">
				<c:set var="color" value="black" />
				<c:forEach var="sw" items="${strWeek }" varStatus="s">
					<c:choose>
						<c:when test="${s.index==0 }">
							<c:set var="color" value="red" />
						</c:when>
						<c:when test="${s.index==6 }">
							<c:set var="color" value="blue" />
						</c:when>
						<c:otherwise>
							<c:set var="color" value="black" />
						</c:otherwise>
					</c:choose>
					<td class="text-center"><b style="color:${color}">${sw }</b></td>
				</c:forEach>
			</tr>
			<c:set var="week" value="${week }" />
			<c:forEach var="i" begin="1" end="${lastday }">
				<c:if test="${i==1 }">
					<tr>
						<c:forEach var="j" begin="1" end="${week }">
							<td width="50" height="50">&nbsp;</td>
						</c:forEach>
				</c:if>
				
					 <c:if test="${i==day }">
	           <td width=40 height=40 class="text-center danger"><div id="circle" style="color:${color};padding-top:15px">${i }</div></td>
	          </c:if>
	          <c:if test="${i!=day && i==rList[i-1]}">
	           <td width=40 height=40 class="text-center"><div id="circle" style="color:${color};padding-top:15px;"
	            class="dates" data-year="${year }" data-month="${month }">${i }<img src="../hospital/icon_reserve.gif"></div></td>
	          </c:if>
	          <c:if test="${i!=day && i!=rList[i-1]}">
	           <td width=40 height=40 class="text-center"><div id="circle" style="color:${color};padding-top:15px">${i }</span></td>
	          </c:if>
				
				<c:set var="week" value="${week+1 }" />
				<c:if test="${week>6 }">
					<c:set var="week" value="0" />
					</tr>
					<tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>

</body>
</html>










