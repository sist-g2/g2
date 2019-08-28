<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#findBtn').click(function(){
		var ss=$('#ss').val();
		if(ss.trim()=="")
		{
			$('#ss').focus();
			return;
		}
		$('#frm').submit();
	});
});
</script>
</head>
<body>
   <div class="container">
     <div class="row">
       <h2 class="text-center">게시판</h2>
       <table class="table">
         <tr>
           <td class="text-left">
             <a href="board_insert.do" class="btn btn-sm">새글</a>
           </td>
           <td class="text-right">
             ${curpage } page / ${totalpage } pages
           </td>
         </tr>
       </table>
       <table class="table">
         <tr>
          <th width=7% class="text-center">번호</th>
          <th width=43% class="text-center">제목</th>
          <th width=15% class="text-center">이름</th>
          <th width=20% class="text-center">작성일</th>
          <th width=10% class="text-center">조회수</th>
         </tr>
         <c:set var="count" value="${count }"/>
         <c:forEach var="vo" items="${list }" varStatus="s">
           <tr class="${s.index%2==0?'':'warning' }">
             <td width=7% class="text-center">${count }</td>
             <td width=43% class="text-left"><a href="board_detail.do?no=${vo.no }">${vo.subject }</a>
               
             <c:if test="${today==vo.dbday }">
             <sup><font color=red>new</font></sup>
             </c:if>
             </td>
             <td width=15% class="text-center">${vo.id }</td>
             <td width=20% class="text-center">${vo.dbday }</td>
             <td width=10% class="text-center">${vo.hit }</td>
           </tr>
           <c:set var="count" value="${count-1 }"/>
         </c:forEach>
       </table>
       <table class="table">
        <tr>
          <td class="text-left">
           <form method="post" action="find.do" id="frm">
           Search:
           <select name="fs" class="input-sm">
             <option value="id">이름</option>
             <option value="subject">제목</option>
             <option value="content">내용</option>
           </select>
           <input type=text name=ss size=15 class="input-sm" id="ss">
           <input type=button value="검색" class="btn btn-sm" id="findBtn">
           </form>
          </td>
          <td class="text-center">
            <ul class="pagination">
              <li><a href="board_list.do?page=1">&lt;&lt;</a></li>
              <li><a href="#">&lt;</a></li>
			  <c:forEach var="i" begin="1" end="${totalpage }">
			    <li class="${i==curpage?'active':''}"><a href="board_list.do?page=${i }">${i }</a>
			  </c:forEach>
			  <li><a href="#">&gt;</a></li>
			  <li><a href="board_list.do?page=${totalpage }">&gt;&gt;</a></li>
			</ul>
          </td>
        </tr>
       </table>
		</div>
     </div>
   </div>
</body>
</html>