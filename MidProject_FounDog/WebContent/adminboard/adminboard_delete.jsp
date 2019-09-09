<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/member.css">
<style type="text/css">
.row {
   margin: 0px auto;
   width:900px;
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
<!-- 
     Javascript AND XML  => AJAX
 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#delBtn').click(function(){

		var no=$('#no').val();
		$.ajax({
			type:'post',
			url:'adminboard_delete_ok.do',
			data:{no:no},
			success:function(response)
			{
				location.href="../adminboard/adminboard_list.do";
			}
		});
	});
});
</script>
</head>
<body>
  <%-- 삭제하기  --%>
  <div class="container">
    <h2 class="text-center">삭제하기</h2>
    <div class="row">
	      <table class="table table-borderless">
	        <tr>
	          <td class="text-center" colspan="2">삭제하시겠습니까?
	           <!--  <input type=password name=pwd size=15 id="pwd"> -->
	            <input type=hidden name=no value="${no }" id="no"></td>
	        </tr>
	        <tr>
	          <td class="text-center" colspan="2">
	            <input type=button value="삭제" class="btnCss" id="delBtn">&nbsp;&nbsp;&nbsp;
	            <input type=button value="취소" class="btnCss"
	              onclick="javascript:history.back();"
	            >
	          </td>
	        </tr>
	      </table>
    </div>
  </div>
</body>
</html>