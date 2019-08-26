<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>
<link href="../css/hospital.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#searchbtn').click(function(){
		var loc=$('#searchloc').val();
		var name=$('#searchname').val();
		$.ajax({
			type:'post',
			url:'../main/hospital_search_ok.do',
			data:{loc:loc,name:name},
			success:function(response) {
				var data = response;				
				alert(data);
				alert(data[0].name);
				var data2 = [{"no":270,"loc":"서울특별시 성동구 금호로 173, 상가동 1층 24호 (금호동2가, 신금호파크자이)","name":"동물병원소풍","tel":"02-2237-1975"},{"no":270,"loc":"서울특별시 성동구 금호로 173, 상가동 1층 24호 (금호동2가, 신금호파크자이)","name":"동물병원소풍","tel":"02-2237-1975"},{"no":270,"loc":"서울특별시 성동구 금호로 173, 상가동 1층 24호 (금호동2가, 신금호파크자이)","name":"동물병원소풍","tel":"02-2237-1975"}];
				alert(data2[0].name);
				
				$(data2).each(function(index, people){ console.log(index + " ::: " , people.NAME); });

		
				
			}
		});
	});
});
</script>
</head>
<body>
  <div class="container">
	<div id="hospitalTitle">
	<h2 class="hostitle">동물 병원</h2>	
    </div>	
	  <div class="hostab">		
	  <a href="#" style="border-right: 0px;" class="btn">병원 찾기</a>
	  <a href="#" class="btn">주변 병원 찾기</a>		
	  </div>
		  <div style="height: 150px;" class="form-control2">
		  
			  <input type="text" value="서울특별시" readonly="readonly" class="form-control2">
			  <select name="searchloc" id="searchloc" style="height: 27px" class="form-control2">
				<option></option>
				<c:forEach var="loc" items="${loc }">
				<option>${loc }</option>
				</c:forEach>
				</select> 
				<input type="text" name="searchname" id="searchname" size="10" class="form-control2">
			    <input type="button" class="btn btn-primary" value="검색" name="searchbtn" id="searchbtn">
			
		   </div>
			 <div style="margin-top: 30px; margin-bottom: 30px;" class="map-best-info v1">
			 <c:choose>
			 <c:when test="${list ne null && list.size() ne 0}">
			   <h3>전체 ${totalResult}건의 검색 결과가 있습니다.</h3>
			   </c:when>
			   <c:when test="${list.size() eq 0}">
			   <h3>검색 결과가 없습니다.</h3>
			   </c:when>			
			   </c:choose>  
				<ul>
				<li>본 화면의 정보는 입력시점과  검색시점의 차이로 현재 정보와 다를 수 있습니다.  &nbsp;<span>방문 전 반드시 유선으로 확인 하시기 바랍니다.</span></li>
				<li>병(의)원 기본정보 (명칭, 주소, 연락처 등)는 건강보험심사평가원에 신고된 자료로 변경정보를 매일 연계하고 있습니다.</li>
				<li>의료이용 편익정보(진료/점심/접수시간, 휴진, 주차정보 등)는 해당 병(의)원이 직접 입력한 정보입니다.</li>
				</ul>
				<p>※ 해당 검진기관에서 입력한 정보가 잘못된 경우, 검색되지 않을 수 있으니 이점 양해하여 주시기 바랍니다.</p>
				</div>
<div id="map" style="width: 680px; height: 540px; border: 10px solid #f2f2f2;" class="col-sm-5"></div>
<script type="text/javascript"
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37a7d7363032a119ca4e0bf582fc0ef5&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map');
var mapOption = {
    center: new daum.maps.LatLng(37.450701, 126.570667),
    level: 7
};  

var map = new daum.maps.Map(mapContainer, mapOption); 

var geocoder = new daum.maps.services.Geocoder();

var listData = new Array();
<c:forEach items="${list}" var ="list">
listData.push("'${list.loc}'");
</c:forEach>

listData.forEach(function(addr, index) {
    geocoder.addressSearch(addr, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

            var marker = new daum.maps.Marker({
                map: map,
                position: coords
            });
            var infowindow = new daum.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>',
                disableAutoPan: true
            });
            infowindow.open(map, marker);
            
            map.setCenter(coords);
        } 
    });
});
</script>
  <div class ="col-sm-4" style=" border-top:1px solid; height: 470px;width: 460px; overflow: auto;" >
 
    <table class="table">
    <c:choose>
    <c:when test="${list eq null}">
	<td class="text-center">검색을 해주세요</td>
	</c:when>
    <c:when test="${list.size() eq 0 }">
    <td class="text-center">검색 결과가 없습니다.</td>
    </c:when>
    </c:choose>
	  <c:forEach var="rvo" items="${list }">
	  <tr>
	    <td class="text-left" width="80%">
		${rvo.name } <br>
		${rvo.loc } <br>
		${rvo.tel }
		</td>
		<td  width="20%">
		 <a href="#" class="btn btn-primary">예약</a>
		</td>
	   </tr>
	   </c:forEach>	   	     	    	   
	 </table>
	</div>		 
	
	 <div class="col-sm-4" style="border-bottom: 1px solid;height: 70px; width: 460px">
       <ul class="pagination pagination-lg">
         <c:if test="${curpage>BLOCK }">
           <li><a href="hospital_search.do?page=1">&lt;&lt;</a></li>
           <li><a href="hospital_search.do?page=${startPage-1 }">&lt;</a></li>
         </c:if>
		 <c:forEach var="i" begin="${startPage }" end="${endPage }">
		   <li class=${curpage==i?"active":"" }><a href="hospital_search.do?page=${i }">${i}</a></li>
		 </c:forEach> 
		 <c:if test="${endPage<allPage }">
		   <li><a href="hospital_search.do?page=${endPage+1 }">&gt;</a></li>
		   <li><a href="hospital_search.do?page=${allPage }">&gt;&gt;</a></li>
         </c:if>
		</ul>
     </div>
		</div>
</body>
</html>