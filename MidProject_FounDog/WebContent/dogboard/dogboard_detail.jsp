<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link rel="stylesheet" href="../main/css/bootstrap.min.css">
<style type="text/css">
.row {
   margin: 0px auto;
   width:900px;
}
.btn-xs{
	background-color:#FFF;
	color:#A5732A;
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
<script type="text/javascript">
var i=0;
var u=0;
$(function(){
	$('.replyBtn').click(function(){
		var no=$(this).attr("value");
		$('.reply').hide();
		$('.update').hide();
		if(i==0)
		{
			$('#m'+no).show();
			i=1;
		}
		else
		{
			$('#m'+no).hide();
			i=0;
		}
		
	});
	$('.updateBtn').click(function(){
		var no=$(this).attr("value");
		$('.update').hide();
		$('.reply').hide();
		if(u==0)
		{
			$('#u'+no).show();
			u=1;
		}
		else
		{
			$('#u'+no).hide();
			u=0;
		}		
	});
	
});
</script>
</head>
<body>

  <div class="container">
    <h2 class="text-center">내용보기</h2>
    <div class="row">
      <table class="table">
        <tr>
          <th class="text-center" width=20%>번호</th>
          <td class="text-left" width=30%>${vo.no }</td>
          <th class="text-center" width=20%>작성일</th>
          <td class="text-left" width=30%>${vo.dbday }</td>
        </tr>
        <tr>
          <th class="text-center" width=20%>회원아이디</th>
          <td class="text-left" width=30%>${vo.id }</td>
          <th class="text-center" width=20%>이름</th>
          <td class="text-left" width=30%>${vo.dname }</td>
        </tr>
        <tr>
          <th class="text-center" width=20%>지역</th>
          <td class="text-left" width=30%>${vo.area }</td>
          <th class="text-center" width=20%>견종</th>
          <td class="text-left" width=30%>${vo.dtype }</td>
        </tr>
        <tr>
          <th class="text-center" width=20%>성별</th>
          <td class="text-left" width=30%>${vo.dsex }</td>
          <th class="text-center" width=20%>무게</th>
          <td class="text-left" width=30%>${vo.dkg }</td>
        </tr>
        <tr>
          <th class="text-center" width=20%>색깔</th>
          <td class="text-left" width=30%>${vo.dcolor }</td>
          <th class="text-center" width=20%>전화번호</th>
          <td class="text-left" width=30%>${vo.tel }</td>
        </tr>
        <tr>
          <th class="text-center" width=20%>나이</th>
          <td class="text-left" width="30%">${vo.dage }</td>
          <th class="text-center" width=20%>제보날짜</th>
          <td class="text-left" width="30%">${vo.DLFDATE }</td>
        </tr>
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200">
          <p style="text-align:center;"><img src="upload/${vo.filename }" class="img-responsive"></p>
          ${vo.dcharacter }</td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
          	<c:if test="${sessionScope.id!=null && (sessionScope.id==vo.id || sessionScope.id=='admin' )}" >
          		<a href="dogboard_update.do?no=${vo.no }" class="btn btn-sm">수정</a>
            	<a href="dogboard_delete.do?no=${vo.no }" class="btn btn-sm" >삭제</a>
          	</c:if>
            <a href="dogboard_list.do" class="btn btn-sm" >목록</a>           
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>













