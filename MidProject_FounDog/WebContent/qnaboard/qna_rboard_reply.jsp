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
   width:500px;
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
</head>
<body>
   <div class="container">
     <h2 class="text-center">답글쓰기</h2>
     <div class="row">
     <form method="post" action="qna_rboardreply_ReInsert.do">
       <table class="table table-borderless">
       <tr>
       	<th class="text-left" width=20%>제목</th>
       </tr>
         <tr>
           <td width=80% class="text-left">
           <input type="hidden" name=no value="${no }">
             <input type=text name=subject size=45 class="form-control">
           </td>
         </tr>
         <tr>
         	<th class="text-left" width=20%>내용</th>
         </tr>
         <tr>
           <td width=80% class="text-left">
             <textarea rows="12" cols="80" name=content></textarea>
           </td>
         </tr>
         <tr>
           <td colspan="2" class="text-center">
             <input type="submit" value="답글쓰기" style="width:200px" class="btn-submit2"><br>
             <input type="button" value="취소" style="margin-top:10px;font-size: 14px;" class="btn btn-sm" onclick="javascript:history.back()">
           </td>
         </tr>
       </table>
       </form>
     </div>
   </div>
</body>
</html>