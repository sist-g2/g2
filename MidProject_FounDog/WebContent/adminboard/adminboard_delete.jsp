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
</style>
<!-- 
     Javascript AND XML  => AJAX
 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#delBtn').click(function(){
		var pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		// ?no=1&pwd=1234
		   /*
		        HttpXMLRequest hxr;
		        ==================== IE,기타 
		        1) hxr.open("POST","board_delete_ok.do",true)
		        2) hxr.onreadystatechange=callback;
		        3) hxr.send(데이더 전송)
		        
		        4) function callback()
		           {
		        	  if(hxr.readyState==4 && hxr.status==200)
		        	  {
		        		  0 open전
		        		  1 open중
		        		  2 open완료 => 서버에 접속
		        		  3 send중
		        		  4 send완료 
		        	  }
		        	  else
		        	  {
		        		  
		        	  }
		           }
		   */
		var no=$('#no').val();
		$.ajax({
			type:'post',
			url:'adminboard_delete_ok.do',
			data:{no:no,pwd:pwd},
			success:function(response)
			{
				var i=response.trim();
				if(i==0)
				{
					alert("비밀번호가 틀립니다!!");
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					location.href="../adminboard/adminboard_list.do";
				}
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
	      <table class="table">
	        <tr>
	          <td class="text-right" width=30%>비밀번호</td>
	          <td class="text-left" width=70%>
	            <input type=password name=pwd size=15 id="pwd">
	            <input type=hidden name=no value="${no }" id="no">
	          </td>
	        </tr>
	        <tr>
	          <td class="text-center" colspan="2">
	            <input type=button value="삭제" class="btn btn-sm btn-danger" id="delBtn">
	            <input type=button value="취소" class="btn btn-sm btn-primary"
	              onclick="javascript:history.back()"
	            >
	          </td>
	        </tr>
	      </table>
    </div>
  </div>
</body>
</html>