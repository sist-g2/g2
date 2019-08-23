<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css">


</head>
<body>

	<div class="container">
	<div class="row">
	<div class="col-md-3 col-sm-5">
                    <div class="sidebar blog-sidebar">
                      
                        <div class="sidebar-item categories">
                            <h3>Categories</h3>
                            <ul class="nav navbar-stacked">
                                <li><a href="#">Lorem ipsum<span class="pull-right">(1)</span></a></li>
                                <li class="active"><a href="#">Dolor sit amet<span class="pull-right">(8)</span></a></li>
                                <li><a href="#">Adipisicing elit<span class="pull-right">(4)</span></a></li>
                                <li><a href="#">Sed do<span class="pull-right">(9)</span></a></li>
                                <li><a href="#">Eiusmod<span class="pull-right">(3)</span></a></li>
                                <li><a href="#">Mockup<span class="pull-right">(4)</span></a></li>
                                <li><a href="#">Ut enim ad minim <span class="pull-right">(2)</span></a></li>
                                <li><a href="#">Veniam, quis nostrud <span class="pull-right">(8)</span></a></li>
                            </ul>
                        </div>
                        <div class="sidebar-item tag-cloud">
                            <h3>Tag Cloud</h3>
                            <ul class="nav nav-pills">
                                <li><a href="#">Corporate</a></li>
                                <li><a href="#">Joomla</a></li>
                                <li><a href="#">Abstract</a></li>
                                <li><a href="#">Creative</a></li>
                                <li><a href="#">Business</a></li>
                                <li><a href="#">Product</a></li>
                            </ul>
                        </div>
                       
                    </div>
                </div>	
				<h1 class="text-center">동물 병원</h1>
				
				<div style="margin: 30px; " class="text-center">
				<input type="button" class="btn btn-lm btn-primary" value="동물 병원 검색" >
				<input type="button" class="btn btn-lm btn-primary" value="주변 병원 찾기">
				</div>
				
				<div style="height: 150px">
				<form name="frm" method="post" action="../main/sample_ok.do">
							<input type="text" value="서울특별시" readonly="readonly">
							<select name="loc" id="loc" style="height: 27px">
										<option></option>
									<c:forEach var="loc" items="${loc }">
										<option>${loc }</option>
									</c:forEach>
							</select> 
							<input type="text" name="name" id="name" size="10">
							<input type="submit" class="btn btn-primary" style="height: 30px" value="검색">
				</form>
				</div>
				<div style="margin-top: 30px; margin-bottom: 30px;">
				<h3>전체 ${list.size()}건의 검색 결과가 있습니다.</h3>
				- 검색 시 주의사항
				</div>
			<div id="map" style="width: 350px; height: 300px;" class="col-sm-5"></div>

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
		</div>
</body>
</html>