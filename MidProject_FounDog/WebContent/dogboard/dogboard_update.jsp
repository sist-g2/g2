<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css" >
<style type="text/css">
.row {
	margin: 0px auto;
	width: 900px;
}
.btn-sm{
	background-color:#FFF;
	color:#A5732A;
}
th{
	background-color:#FFF;
	color:#A5732A;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#updBtn').click(function(){
		var dname=$('#dname').val();
		if(dname.trim()=="") {
			$('#dname').focus();
			return;
		}
		var dcharacter=$('#dchar').val();
		if(dcharacter.trim()=="") {
			$('#dchar').focus();
			return;
		}
		
/* 		var filename=$('#filename').val();
		console.log("filename" + filename);
		if(filename.trim()=="") {
			$('#filename').focus();
			return;
		} */
		
		if(confirm("수정하시겠어요??")) {
			$('#boardUpdForm').submit();
		} else {
			return;
		}
	});
});
</script>
</head>
<body>
<div class="container" >
	<h2 class="text-center" >수정하기</h2>
	<div class="row" >
		<form id="boardUpdForm" method="post" action="dogboard_update_ok.do" enctype="multipart/form-data">
			<table class="table" >
				<tr>
					<th class="text-right" width=20% >회원아이디</th>
					<td width=80% class="text-left">
						<input type="text" name="id" size=15 value="${vo.id }" id="id" readonly="readonly" >
						<input type="hidden" name="no" value="${vo.no }" id="no">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >이름</th>
					<td width=80% class="text-left">
						<input type="text" name="dname" size=45 value="${vo.dname }" id="dname">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >지역</th>
					<td width=80% class="text-left">
						<input type="text" name="area" size=45 value="${vo.area }" id="area">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >파일</th>
					<td width=80% class="text-left">
						<input type="file" name="upload" size=45 value="${vo.filename }" id="filename">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >견종</th>
					<td width=80% class="text-left">
						<input type="text" name="dtype" size=45 value="${vo.dtype }" id="dtype">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >성별</th>
					<td width=80% class="text-left">
						<input type="text" name="dsex" size=45 value="${vo.dsex }" id="dsex">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >무게</th>
					<td width=80% class="text-left">
						<input type="text" name="dkg" size=45 value="${vo.dkg }" id="dkg">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >색깔</th>
					<td width=80% class="text-left">
						<input type="text" name="dcolor" size=45 value="${vo.dcolor }" id="dcolor">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >전화</th>
					<td width=80% class="text-left">
						<input type="text" name="tel" size=45 value="${vo.tel }" id="dcolor">
					</td>
				</tr>
				<tr>
					<th class="text-right" width=20% >나이</th>
					<td width=80% class="text-left">
						<input type="text" name="dage" size=45 value="${vo.dage }" id="dage">
					</td>
				</tr>
   		      <tr>
    		       <th class="text-right" width=20%>카테고리</th>
					<td align="left">&nbsp;
					 <select id="category" class="form-control2" name=category>
						<option value="0">제보</option>
						<option value="1">찾음</option>
						</select>
					</td>
   		      </tr>
					<tr>
					<th class="text-right" width=20% >특징</th>
					<td width=80% class="text-left">
						<textarea rows="10" cols="55" name="dcharacter" id="dchar" >${vo.dcharacter }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan=2 class="text-center" >
						<input type="button" value="수정" class="btn btn-sm" id="updBtn" >
						<input type="button" value="취소" class="btn btn-sm" onclick="javascript:history.back()" >
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>