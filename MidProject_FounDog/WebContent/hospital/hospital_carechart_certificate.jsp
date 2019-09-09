<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div style="height: 70px; width: 100%; text-align: center; border: solid 1px;">
		<h2>진료 내역서</h2>
		</div>
		<div style="height: 40px; text-align: left; border: solid 1px;">
		진료번호 : ${list.no }
		</div>
		<table style="border: solid 1px; height: 300px; width: 100%">
			<tr style="border: solid 1px; height: 50px">
				<td style="border: solid 1px; width: 100px">보호자 명</td>
				<td colspan="3">${list.name }</td>
				<td style="border: solid 1px; width: 100px">전화번호</td>
				<td>${list.tel}</td>
			</tr>
			<tr style="border: solid 1px; height: 50px">
				<td style="border: solid 1px; width: 100px">진료받은 강아지</td>
				<td>${list.dogname }</td>
				<td style="border: solid 1px;">견종</td>
				<td>${list.dtype }</td>
				<td style="border: solid 1px;">생년월일</td>
				<td>${list.dbirth }</td>
			</tr>
			<tr style="border: solid 1px; height: 50px">
				<td style="border: solid 1px; width: 100px">진료일</td>
				<td colspan="5">${list.caredate }</td>
			</tr>
			<tr style="border: solid 1px; height: 150px">
				<td style="border: solid 1px; width: 100px">진료내용</td>
				<td colspan="5">${list.prescription }</td>
			</tr>
			<tr>
				<td colspan="6" style="text-align: right;">진료기관명 : ${list.hospitalname }<br>
				담당의사 : ${list.doctor }</td>
			</tr>
		</table>
		<div style="text-align: center; padding: 10px;">
		<input type="button" onclick="javascript:window.print()" value="출력" class="btn btn-mg">
		<input type="button" onclick="javascript:window.close()" value="닫기" class="btn btn-mg">
		</div>
	</div>
</body>
</html>