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
.btnCss2 {
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-right: 3px;
	height: 74px;
	width: 80px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-style: none;
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
<script type="text/javascript">
var i=0;
var u=0;
$(function(){
	$('.qna_replyBtn').click(function(){
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
	$('.qna_updateBtn').click(function(){
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
          <td class="text-left" width=30%>
            ${vo.dbday }
 		 </td>
        </tr>
        <tr>
          <th class="text-center" width=20%>이름</th>
          <td class="text-left" width=30%>${vo.id }</td>
          <th class="text-center" width=20%>조회수</th>
          <td class="text-left" width=30%>${vo.hit }</td>
        </tr>
        <tr>
          <th class="text-center" width=20%>제목</th>
          <td class="text-left" colspan="3">${vo.subject }</td>
        </tr>
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200">${vo.content }</td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
          	<c:if test="${sessionScope.id!=null && sessionScope.id==vo.id}" >
          		<a href="qna_board_update.do?no=${vo.no }" class="btnCss">&nbsp;&nbsp;수정&nbsp;&nbsp;</a>
          	</c:if>
          	<c:if test="${sessionScope.id!=null && (sessionScope.id==vo.id || sessionScope.id=='admin' )}" >
            	<a href="qna_board_delete.do?no=${vo.no }" class="btnCss" >&nbsp;&nbsp;삭제&nbsp;&nbsp;</a>
          	</c:if>
          	<c:if test="${sessionScope.id!=null}" >
          		<a href="qna_rboard_reply.do?no=${vo.no }" class="btnCss">&nbsp;&nbsp;답글&nbsp;&nbsp;</a>
          	</c:if>
            <a href="qna_board_list.do" class="btnCss" >&nbsp;&nbsp;목록&nbsp;&nbsp;</a>
           
          </td>
        </tr>
      </table>
    </div>
    <div class="row">
      <table class="table">
        <tr>
         <td class="text-left">댓글(${count })</td>
        </tr>
      </table>
      <table class="table">
        <c:forEach var="rvo" items="${list }">
          
          <table class="table">
          <tr>
				      <td class="text-left">
					      <c:if test="${rvo.group_tab>0 }">
					      	<c:forEach var="i" begin="1" end="${rvo.group_tab }">
					      		&nbsp;&nbsp;
					      	</c:forEach>
					      	<img src="qna_rereply.gif">&nbsp;&nbsp;
					      </c:if>
					      <c:if test="${rvo.id=='delete' }">
					      	<font color="red">탈퇴한 회원</font>
					      </c:if>
					      <c:if test="${rvo.delState==1 }" >
					      	<font color="red">삭제된 댓글</font>
					      </c:if>
					      <c:if test="${rvo.id!='delete' && rvo.delState!=1 }" >
					      	<img src="qna_reply.png"><font color="#A5732A">${rvo.id }</font>&nbsp;${rvo.dbday }
					      </c:if>
					  </td>
					  <c:if test="${rvo.id!='delete' && rvo.delState!=1 }" >
					  	<td class="text-right">
			              <c:if test="${sessionScope.id!=null && sessionScope.id==rvo.id  }">
			             <button class="btn btn-xs qna_updateBtn" value="${rvo.no }">수정</button>
			             </c:if>
			              <c:if test="${sessionScope.id!=null && (sessionScope.id==rvo.id || sessionScope.id=='admin' ) }">
			             <a href="../qboard/qboardreply_Delete.do?no=${rvo.no }&bno=${vo.no}" class="btn btn-xs">삭제</a>
			              </c:if>
			              <c:if test="${sessionScope.id!=null }">
			               <button class="btn btn-xs qna_replyBtn" value="${rvo.no }">댓글</button>
			              </c:if>
			             </td>
					  </c:if>
			       </tr>
		           <tr>
		             <td class="text-left" colspan="2">
			             <c:if test="${rvo.group_tab>0 }">
				            <c:forEach var="i" begin="1" end="${rvo.group_tab }">
				              &nbsp;&nbsp;
				            </c:forEach>
				         </c:if>
				         <c:if test="${rvo.id=='delete' }" >
				         	<font color="red">탈퇴한 회원의 댓글입니다.</font>
				         </c:if>
				         <c:if test="${rvo.delState==1 }" >
					      	<font color="red">삭제된 댓글입니다.</font>
					     </c:if>
					     <c:if test="${rvo.id!='delete' && rvo.delState!=1 }" >
					     	${rvo.content }
					     </c:if>
			         </td>
		           </tr>
           <tr>
           <tr style="display:none" id="m${rvo.no }" class="reply">
	          <td class="text-left" colspan="2">
	           <form name="frm" method="post" action="../qnaboard/qna_boardreply_ReInsert.do">
	            <textarea rows="3" cols="100" name="content" style="float: left"></textarea>&nbsp;&nbsp;
	            <input type="hidden" name="bno" value="${vo.no }">
	            <input type="hidden" name=no value="${rvo.no }">
	            <input type="submit" class="btnCss2" value="댓글쓰기">
	           </form>
	          </td>
	        </tr>
	        <tr style="display:none" id="u${rvo.no }" class="update">
	          <td class="text-left" colspan="2">
	           <form name="frm" method="post" action="../qnaboard/qna_boardreply_Update.do">
	            <textarea rows="3" cols="100" name="content" style="float: left">${rvo.content }</textarea>&nbsp;&nbsp;
	            <input type="hidden" name="bno" value="${vo.no }">
	            <input type="hidden" name=no value="${rvo.no }">
	            <input type="submit" class="btnCss2" value="수정하기">
	           </form>
	          </td>
	        </tr>
          </table>
        </c:forEach>
      </table>
      <c:if test="${sessionScope.id!=null }">
	      <table class="table">
	        <tr>
	          <td class="text-left">
	           <form name="frm" method="post" action="../qnaboard/qna_boardreply_Insert.do">
	            <textarea rows="3" cols="110" name="content" style="float: left"></textarea>&nbsp;&nbsp;
	            <input type="hidden" name="bno" value="${vo.no }">
	            <input type="submit" class="btnCss2" value="댓글쓰기">
	           </form>
	          </td>
	        </tr>
	      </table>
      </c:if>
    </div>
  </div>
</body>
</html>













