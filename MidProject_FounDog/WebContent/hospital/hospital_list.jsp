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
</head>
<body>
	<div class="container">
		<div id="hospitalTitle">
			<h2 class="hostitle">동물 병원</h2>
		</div>
		<div class="hostab">
			<a href="#" style="border-right: 0px;" class="btn">병원 찾기</a> <a
				href="#" class="btn">주변 병원 찾기</a>
		</div>
		<div style="height: 150px;" class="form-control2">

			<input type="text" value="서울특별시" readonly="readonly"
				class="form-control2"> <select name="searchloc"
				id="searchloc" class="form-control2">
				<option value="">전체</option>
				<c:forEach var="loc" items="${loc }">
					<option>${loc }</option>
				</c:forEach>
			</select> <input type="text" name="searchname" id="searchname"
				class="form-control2" placeholder="병원이름 검색"> <input type="button"
				class="btn btn-primary" value="검색" name="searchbtn" id="searchbtn">

		</div>
		<div style="margin-top: 30px; margin-bottom: 30px;" class="map-best-info v1">
			<div id="searchtotal"></div>		
			본 화면의 정보는 입력시점과 검색시점의 차이로 현재 정보와 다를 수 있습니다. &nbsp;<span>방문전 반드시 유선으로 확인 하시기 바랍니다.</span><br>
			병(의)원 기본정보 (명칭, 주소, 연락처 등)는 건강보험심사평가원에 신고된 자료로 변경정보를 매일 연계하고 있습니다.<br>
			의료이용 편익정보(진료/점심/접수시간, 휴진, 주차정보 등)는 해당 병(의)원이 직접 입력한 정보입니다.		
			<p>※ 해당 검진기관에서 입력한 정보가 잘못된 경우, 검색되지 않을 수 있으니 이점 양해하여 주시기 바랍니다.</p>
			</div>
		<div id="map"
			style="width: 680px; height: 540px; border: 10px solid #f2f2f2;"
			class="col-sm-5"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37a7d7363032a119ca4e0bf582fc0ef5&libraries=services"></script>
		<script>
var mapContainer = document.getElementById('map');
var mapOption = {
    center: new daum.maps.LatLng(37.556538, 126.919516),
    level: 7
};  

var map = new daum.maps.Map(mapContainer, mapOption); 

$(function(){
	$('#searchbtn').click(function(){
		var loc=$('#searchloc').val();
		var name=$('#searchname').val();
		
		 $.ajax({ // 검색 결과 리스트 ajax
			type:'post',
			url:'hospital_result.do',
			data:{loc:loc,name:name},
			success:function(response)
			{	
				var searchResult = $(response).find('#search_result');
				$("#hospital_result").html(searchResult);	
				
				var totalResult = $(response).find('#totalresult');
				$("#searchtotal").html(totalResult);
				
			}
		});	 						
	 $(function(){
		$.ajax({ //json 파싱 ajax
			type:'post',
			url:'hospital_search_ok.do',
			data:{loc:loc,name:name},
			success:function(response) {
				
				var mapContainer = document.getElementById('map');
				var mapOption = {
				    center: new daum.maps.LatLng(37.556538, 126.919516),
				    level: 7
				};  

				var map = new daum.maps.Map(mapContainer, mapOption); 

				var geocoder = new daum.maps.services.Geocoder();
				
				var data = JSON.parse(response); // response로 보내진 json데이터 파싱							
				var result = document.getElementById("search_result");
				
				var listData = new Array();
				
				$.each(data,function(key,value) { // 파싱된 데이터 값추출
								
				 listData.push(value.loc); // 배열에 위치 정보를 저장함
				 				 				
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
				                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>',
				                disableAutoPan: true
				            });
				            infowindow.open(map, marker);
				            
				            map.setCenter(coords);
				        
				        }
				       
				    });
				});
			
			}
		});
	});
	});
});

</script>
		<div class="col-sm-4" style="border-top: 1px solid; height: 540px; width: 460px;" id="hospital_result">
		<div align="center" style="position: absolute; top: 220px; border: solid 1px; width: 440px; height: 100px;">
		검색을 해주세요
		</div>
		</div>	
	</div>
</body>
</html>