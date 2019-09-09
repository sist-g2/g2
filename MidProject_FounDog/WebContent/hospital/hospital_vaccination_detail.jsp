<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/hospital.css" rel="stylesheet">
<style type="text/css">

#detailbtn {
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-left: 5px;
	width: 85px;
	height: 85px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
}

#layerPopup{
  padding:20px; 
  border:4px solid #ddd; 
  position:absolute; 
  left:100px; 
  top:100px; 
  background:#fff;
}

#layerPopup button{
  cursor:pointer;
}

/* #PopupDiary span {
	font-size: 14px;
	font-weight: 300;
} */

#vaccInsertSubmit {
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-left: 5px;
	width: 85px;
	height: 45px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	  $("#layerPopup").hide();
	  $("#layerPopup2").hide();
	  $("#contents > a").click(function(){
		    
	    $("#contents > a").blur();
	    $("#layerPopup").show();
	    $("#layerPopup a").focus();
	   
	    
	    return false;
	  });
	    
	  $("#layerPopup a").keydown(function(e){
	    if(e.shiftKey && e.keyCode == 9){ // Shift + Tab 키를 의미합니다.
	      $("#contents > a").focus();
	      $("#layerPopup").hide();
	      return false;
	    }
	  });
	  
	  $("#layerPopup button").click(function(){
		    $("#contents > a").focus();
		    $("#layerPopup").hide();	 					  	
	  });
	  
	});
	
$(function(){
	
	$('#detailbtn').click(function(){
		var dno=$('#selectDog option:selected').attr("data-no");
	
		 $.ajax({ // 검색 결과 리스트 ajax
			type:'post',
			url:'hospital_vaccination_list.do',
			data:{dno:dno},
			success:function(response)
			{	
				$("#vaccinationlist").html(response);	
			
			}
		});
	});
});
</script>
</head>
<body>
<div class="container">
	<div class="vaccination_detail_row" >
	
		<div id="hospitalTitle">
			<h2 class="hostitle">예방접종 내역</h2>
		</div>
		<div class="col-md-3 col-sm-5">
             <div class="sidebar blog-sidebar">                           
                 <div class="sidebar-item categories">
                     <h3>병원 이용</h3>
                     <ul class="nav navbar-stacked">
                         <li><a href="../hospital/hospital_reserve_detail.do">예약 내역<span class="pull-right"></span></a></li>
                         <li><a href="../hospital/hospital_carechart_detail.do">진료 내역<span class="pull-right"></span></a></li>
                         <li class="active"><a href="../hospital/hospital_vaccination_detail.do">예방접종 내역<span class="pull-right"></span></a></li>
                     </ul>
                 </div>                                        
             </div>
         </div>
        <div class="col-md-9 col-sm-7">
        <div id="contents">
  			<a href="#layerPopup">&nbsp;&nbsp;접종내역 추가하기&nbsp;&nbsp;</a>
		  	<div id="layerPopup">
				<div id="PopupDiary">
					<form method="post" id="vaccinationForm" action="hospital_vaccination_insert.do">
						<div style="height: 250px; width: 300px">
							<table class="table" >
								<tr>
									<th class="text-right" >
										<h5>추가할 강아지&nbsp;&nbsp;</h5>
										<input type="hidden" value="${sessionScope.id }" name="id">		
									</th>
									<td class="text-left" >
										&nbsp;&nbsp;
										<select name="dname" class="form-control2" style="width: 140px;" >
											<c:forEach var="vo" items="${doglist }">
												<option data-no="${vo.dno }">${vo.dname}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th class="text-right" >
										<h5>추가할 접종백신&nbsp;&nbsp;</h5>
									</th>
									<td class="text-left" >
										&nbsp;&nbsp;
										<select name="vname" class="form-control2" style="width: 140px;" >									
											<option>종합백신</option>
											<option>켄넬코프</option>
											<option>인플루엔자</option>
											<option>광견병</option>
											<option>심장사상충</option>
										</select>
									</td>
								</tr>
								<tr>
									<th class="text-right" >
										<h5>접종일&nbsp;&nbsp;</h5>
									</th>
									<td class="text-left" >
										&nbsp;&nbsp;
										<input type="date" name="vdate" class="form-control2" >
									</td>
								</tr>
								<tr>
									<td colspan=2 class="text-center" >
										<input type="submit" value="추가하기" id="vaccInsertSubmit">
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
		    	<button type="button">닫기</button>
		 	</div>
		</div>
		<table class="" style="width: 100%;" >
			<tr>
				<th width="15%" >
					<h4>강아지 조회</h4>
				</th>
				<td width="55%" style="padding: 5px;" >
					<select id="selectDog" class="form-control2">
						<option >전체</option>
						<c:forEach var="vo" items="${doglist }">
							<option data-no="${vo.dno }">${vo.dname}</option>
						</c:forEach>
					</select>									
				</td>			
				<td rowspan=2 width="30%" style="text-align: right;">
					&nbsp;&nbsp;<input type="button" id="detailbtn" value="조회" >&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		
		<div id="vaccinationlist" style="width: 100%; height: 400px; border: solid 0px; text-align: center;">
			<br><h4>예방접종 내역을 조회해보세요.</h4>
		</div>
		</div>
	</div>
</div>
</body>
</html>