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

.board_write { width: 100%; border-collapse: collapse; border-top: 3px solid #232021; margin-top:20px }
.board_write th, .board_write td { border-bottom: 1px solid #cdcdcd; border-top: 1px solid #cdcdcd; padding: 10px 0; background: #fff }
.board_write th { background: #efefef; font-weight: bold; text-align: left; font-size: 13px;border: 1px solid #cdcdcd;border-left:0;border-right:0;vertical-align:top;padding-top:12px }
.board_write th em {font-family:'Verdana';font-size:1.1em;padding-right:5px;padding-left:10px}
.board_write td { padding-left: 30px }
.board_write .spacer {border:0}
.board_write .label {font-weight:bold; display:inline-block; width:105px}

th {padding-left:88px; border: 1px solid}
td {padding-left:88px; border: 1px solid}

.board_write th{text-align:left;padding-left:30px;}
.board_write .bdt{border-top:1px solid #cdcdcd;}
.board_write .bdb{border-bottom:1px solid #cdcdcd;}
.board_write td,.board_write th{border:0;}
.board_write > tbody > tr > td.ml_28{padding-left:0;margin-left:28px;display:block;border-bottom:1px solid #cdcdcd;}

.board_write .end {border-bottom:3px solid #2b2829;border-left:0;border-right:0}

</style>
</head>
<body>
	<div class="container">
		<div id="hospitalTitle">
			<h2 class="hostitle">예약 내역</h2>
		</div>
		<form method="post" action="hospital_reserve_detail.do">
			<div style="width: 100%; height: 300px; border: solid 1px;">
			<table class="board_write">
				<colgroup>
				<col width="214px">
				<col width="">
				</colgroup>	
				<tr>
					<th>강아지 조회</th>
					<td>
						<select name="selectDog"
						id="selectDog" class="form-control2">
						<option value="">전체</option>
						<c:forEach var="doglist" items="${doglist }">
							<option>${doglist}</option>
						</c:forEach>
						</select>				
					</td>
				</tr>
				<tr>
					<th>조회 기간</th>
					<td>
					<input type="date" name="startData">&nbsp;~&nbsp;<input type="date" name="endData">			
					</td>
				</tr>		
			</table>
				<div style="width: 100%; height: 70px; border: solid 1px;">
					<input type="submit" value="조회" style="position:relative; top:50%; left:50%;">
				</div>
				<div style="width: 100%; height: 100px; border: solid 1px;">
					ㅁㅁㅁ 고객님의 예약 내역입니다.
				</div>
			</div>
		</form>
		<div style="width: 100%; height: 400px; border: solid 1px;">
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
			<tr>
				<c:forEach var="vo" items="${list }">
					<td>${vo.no }</td>
					<td>${vo.reception_date }</td>
					<td>${vo.name }</td>
					<td>${vo.dname }</td>
					<td>${vo.reserve_date }</td>
					<td>${vo.reserve_time }</td>
					<td>${vo.state }</td>
					<td>${vo.hosname }</td>
				</c:forEach>
			</tr>
			</table>
		</div>
	</div>
</body>
</html>