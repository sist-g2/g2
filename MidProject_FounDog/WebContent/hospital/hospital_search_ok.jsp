<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37a7d7363032a119ca4e0bf582fc0ef5&libraries=services"></script>
<script>
	
var map = new daum.maps.Map(mapContainer, mapOption); 
 
var geocoder = new daum.maps.services.Geocoder();
				
var data = JSON.parse('${jsonlist}'); // response로 보내진 json데이터 파싱							
var result = document.getElementById("search_result");
				
var listData = new Array();
var nameData = new Array();
	$.each(data,function(key,value) { // 파싱된 데이터 값추출
								
	  listData.push(value.loc); // 배열에 위치 정보를 저장함
	  nameData.push(value.name);				 				
	});
				
	listData.forEach(function(addr, index) { // 지도에 위치 정보를 넣는 부분
		geocoder.addressSearch(addr, function(result, status) {
		   if (status === daum.maps.services.Status.OK) {
				 var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				 var marker = new daum.maps.Marker({
				       map: map,
				       position: coords
				 });
		    var infowindow = new daum.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:6px 0;">' + nameData[index] + '</div>',
				disableAutoPan: true
				 });
				 infowindow.open(map, marker);
				 if(index<1){
				      map.setCenter(coords);
				 }
				        
		     }
				       
	     });
  });
</script>
</body>
</html>