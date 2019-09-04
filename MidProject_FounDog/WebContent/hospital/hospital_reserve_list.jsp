<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<c:forEach var="vo" items="${list }">
		<tr>
				<td>${vo.no }</td>
				<td>${vo.reception_date }</td>
				<td>${vo.name }</td>
				<td>${vo.dname }</td>
				<td>${vo.reserve_date }</td>
				<td>${vo.reserve_time }</td>
				<td>${vo.state }</td>
				<td>${vo.hosname }</td>
		</tr>
			</c:forEach>
	</table>
</body>
</html>