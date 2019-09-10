<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css">
<link href="../css/member.css" rel="stylesheet">
<style type="text/css">
.row {
   margin: 0px auto;
   width: 500px;
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
.btnCss {
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-right: 3px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-style: none;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#insertBtn').click(function(){
		var subject=$('#subject').val();
		if(subject.trim()=="") {
			alert("제목을 입력해주세요.");
			$('#subject').focus();
			return;
		}
		var content=$('#content').val();
		if(content.trim()=="") {
			alert("내용을 입력해주세요.");
			$('#content').focus();
			return;
		}
		$('#insertform').submit();
	});
});
</script>
</head>
<body>
   <div class="container">
     <h2 class="text-center">글쓰기</h2>
     <div class="row">
     <form id="insertform" method="post" action="qna_board_insert_ok.do">
       <table class="table table-borderless">
       <tr>
      	 <th class="text-left" width=20%>제목</th>
       </tr>
         <tr>
           <td width=80% class="text-left">
             <input type=text name=subject size=45 class="form-control" id=subject>
           </td>
         </tr>
         <tr>
         	<th class="text-left" width=20%>내용</th>
         </tr>
         <tr>
           <td width=80% class="text-left">
             <textarea rows="12" cols="80" name=content id=content></textarea>
           </td>
         </tr>
         <tr>
           <td class="text-center">
             <input type="button" value="글쓰기" style="width:200px" class="btn-submit2" id="insertBtn"><br>
             <input type="button" value="취소" style="margin-top:10px;font-size: 14px;" class="btn btn-sm" onclick="javascript:history.back()">
           </td>
         </tr>
       </table>
       </form>
     </div>
   </div>
</body>
</html>