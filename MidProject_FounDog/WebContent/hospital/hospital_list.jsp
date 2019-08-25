<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>
<link href="../css/hospital.css" rel="stylesheet">
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
		    <form name="frm" method="post" action="../main/sample_search.do">
			  <input type="text" value="서울특별시" readonly="readonly" class="form-control2">
			  <select name="loc" id="loc" style="height: 27px" class="form-control2">
				<option></option>
				<c:forEach var="loc" items="${loc }">
				<option>${loc }</option>
				</c:forEach>
				</select> 
				<input type="text" name="name" id="name" size="10" class="form-control2">
			    <input type="submit" class="btn btn-submit2" value="검색">
			 </form>
		   </div>
			 <div style="margin-top: 30px; margin-bottom: 30px;" class="map-best-info v1">
			   <h3>전체 ${list.size()}건의 검색 결과가 있습니다.</h3>			  
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
  <div class ="col-sm-3" >
    <table class="table">
	  <c:forEach var="rvo" items="${list }">
	  <tr>
	    <td class="text-left"  width="80%">
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
		</div>
</body>
</html>