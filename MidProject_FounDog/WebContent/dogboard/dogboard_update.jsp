<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css" >
<link rel="stylesheet" href="../css/member.css">
<style type="text/css">
.row {
   margin: 0px auto;
   width:540px;
}
.btn-sm{
	background-color:#FFF;
	color:#A5732A;
}
th{
	background-color:#FFF;
	color:#A5732A;
}
textarea {
  border: 1px solid #d99c4e;
  font-weight: 300;
  outline: none;
  box-shadow: none;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border-radius: 4px;
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
		
		var filename=$('#filename').val();
		console.log("filename" + filename);
		if(filename.trim()=="") {
			$('#filename').focus();
			return;
		}
		
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
			<table class="table table-borderless" >
				<tr>
					<th colspan="2">회원아이디&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="id" size=20 value="${vo.id }" id="id" readonly="readonly"  class="form-control2">
						<input type="hidden" name="no" value="${vo.no }" id="no">
					</th>
				</tr>
				<tr>
    		       <th>카테고리　&nbsp;&nbsp;&nbsp;&nbsp;
					 <select id="category" class="form-control2" name=category class="form-control2">
						<option value="0">제보</option>
						<option value="1">찾음</option>
						</select>
					</th>
   		      </tr>
   		      <tr>
					<th>제보날짜　&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="date" name="dage" size=25 value="${vo.DLFDATE }" id="dage" class="form-control2">
					</th>
				</tr>
				<tr>
					<th>이름</th>
					<th style="width:187px;">지역</th>
					
				</tr>
				<tr>
					<td class="text-left">
						<input type="text" name="dname" size=25 value="${vo.dname }" id="dname" class="form-control2">
					</td>
					<td class="text-left">
						<input type="text" name="area" size=25 value="${vo.area }" id="area" class="form-control2">
					</td>
				</tr>
				
				<tr>
					<th>견종</th>
					<th style="width:187px;">성별</th>
					
				</tr>
				<tr>
					<td class="text-left">
						<input type="text" name="dtype" size=25 value="${vo.dtype }" id="dtype" class="form-control2">
					</td>
					<td class="text-left">
						<input type="text" name="dsex" size=25 value="${vo.dsex }" id="dsex" class="form-control2">
					</td>
				</tr>
				<tr>
					<th>무게</th>
					<th style="width:187px;">색깔</th>
				</tr>
				<tr>
					<td class="text-left">
						<input type="text" name="dkg" size=25 value="${vo.dkg }" id="dkg" class="form-control2">
					</td>
					<td class="text-left">
						<input type="text" name="dcolor" size=25 value="${vo.dcolor }" id="dcolor" class="form-control2">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<th style="width:187px;">나이</th>
				</tr>
				<tr>
					<td class="text-left">
						<input type="text" name="tel" size=25 value="${vo.tel }" id="dcolor" class="form-control2">
					</td>
					<td class="text-left">
						<input type="text" name="dage" size=25 value="${vo.dage }" id="dage" class="form-control2">
					</td>
				</tr>
				
				<tr>
					<th colspan="2">파일&nbsp;&nbsp;&nbsp;&nbsp;
					</th>
						
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="upload" size=25 value="${vo.filename }" id="filename">
					</td>
				</tr>
   		      
					<tr>
					<th colspan="2">특징</th>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="12" cols="80" name="dcharacter" id="dchar" >${vo.dcharacter }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan=2 class="text-center">
						<input type="button" value="수정하기" style="width:200px;" class="btn-submit2" id="updBtn" >
					</td>
				</tr>
				<tr>
					<td colspan=2 class="text-center" >
						<input type="button" value="취소" class="btn btn-sm" onclick="javascript:history.back()" >
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>