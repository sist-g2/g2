<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css">
<style type="text/css">
.row {
   margin: 0px auto;
   width:900px;
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
</head>
<body>
   <div class="container">
     <h2 class="text-center">답글쓰기</h2>
     <div class="row">
     <form method="post" action="qna_rboardreply_ReInsert.do">
       <table class="table">
         <tr>
           <th class="text-right" width=20%>제목</th>
           <td width=80% class="text-left">
           <input type="hidden" name=no value="${no }">
             <input type=text name=subject size=45 class="input-sm">
           </td>
         </tr>
         <tr>
           <th class="text-right" width=20%>내용</th>
           <td width=80% class="text-left">
             <textarea rows="10" cols="55" name=content></textarea>
           </td>
         </tr>
         <tr>
           <td colspan="2" class="text-center">
             <input type="submit" value="답글쓰기" class="btn btn-sm">
             <input type="button" value="취소" class="btn btn-sm" onclick="javascript:history.back()">
           </td>
         </tr>
       </table>
       </form>
     </div>
   </div>
</body>
</html>