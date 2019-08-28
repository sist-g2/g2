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
            <a href="board_update.do?no=${vo.no }" class="btn btn-sm">수정</a>
            <a href="board_delete.do?no=${vo.no }" class="btn btn-sm" >삭제</a>
          	<a href="#" class="btn btn-sm">답글</a>
            <a href="board_list.do" class="btn btn-sm" >목록</a>
           
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
        <c:forEach var="vo" items="${list }">
          
          <table class="table">
           <tr>
             <td class="text-left">
             <c:if test="${vo.group_tab>0 }">
	            <c:forEach var="i" begin="1" end="${vo.group_tab }">
	              &nbsp;&nbsp;
	            </c:forEach>
	            <img src="re.gif">
	          </c:if>
                             ◐<font color="blue">${vo.name }</font>&nbsp;${vo.dbday }</td>
             <td class="text-right">
              <c:if test="${sessionScope.id!=null && sessionScope.id==vo.id }">
               <a href="#" class="btn btn-xs updateBtn" value="${vo.no }">수정</a>
               <a href="../board/reply_delete.do?no=${vo.no }&bno=${rvo.no}" class="btn btn-xs">삭제</a>
              </c:if>
              <c:if test="${sessionScope.id!=null }">
               <a href="#" class="btn btn-xs replyBtn" value="${vo.no }">댓글</a>
              </c:if>
             </td>
           </tr>
           <tr>
             <td class="text-left" colspan="2">
             <c:if test="${vo.group_tab>0 }">
	            <c:forEach var="i" begin="1" end="${vo.group_tab }">
	              &nbsp;&nbsp;
	            </c:forEach>
	          </c:if>
             ${vo.content }</td>
           </tr>
           <tr style="display:none" id="m${vo.no }" class="reply">
	          <td class="text-left" colspan="2">
	           <form name="frm" method="post" action="../board/reply_reinsert.do">
	            <textarea rows="3" cols="100" name="content" style="float: left"></textarea>
	            <input type="hidden" name="bno" value="${rvo.no }">
	            <input type="hidden" name=no value="${vo.no }">
	            <input type="submit" class="btn btn-sm" style="height: 67px" value="댓글쓰기">
	           </form>
	          </td>
	        </tr>
	        <tr style="display:none" id="u${vo.no }" class="update">
	          <td class="text-left" colspan="2">
	           <form name="frm" method="post" action="../board/reply_update.do">
	            <textarea rows="3" cols="100" name="content" style="float: left">${vo.content }</textarea>
	            <input type="hidden" name="bno" value="${rvo.no }">
	            <input type="hidden" name=no value="${vo.no }">
	            <input type="submit" class="btn btn-sm" style="height: 67px" value="수정하기">
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
	           <form name="frm" method="post" action="../board/reply_insert.do">
	            <textarea rows="3" cols="110" name="content" style="float: left"></textarea>
	            <input type="hidden" name="bno" value="${rvo.no }">
	            <input type="submit" class="btn btn-sm" style="height: 67px" value="댓글쓰기">
	           </form>
	          </td>
	        </tr>
	      </table>
      </c:if>
    </div>
  </div>
</body>
</html>













