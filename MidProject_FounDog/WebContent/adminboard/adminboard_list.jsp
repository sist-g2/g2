<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.btnSearchCss {
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-right: 3px;
	height: 37px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-style: none;
}
th{
	background-color:#FFF;
	color:#A5732A;
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
       <h2 class="text-center">정보성 게시판</h2>
       <table class="table">
         <tr>
    	   <c:if test="${sessionScope.id!=null && sessionScope.id=='admin' }">
           <td class="text-left">
             <a href="adminboard_insert.do" class="btnCss">&nbsp;&nbsp;새글&nbsp;&nbsp;</a>
           </td>
            </c:if>
           <td class="text-right">
             ${curpage } page / ${totalpage } pages
           </td>
         </tr>
       </table>
       <table class="table">
         <tr>
          <th width=10% class="text-center">번호</th>
          <th width=45% class="text-center">제목</th>
          <th width=15% class="text-center">이름</th>
          <th width=20% class="text-center">작성일</th>
          <th width=10% class="text-center">조회수</th>
         </tr>
         <c:set var="count" value="${count }"/>
         <c:forEach var="vo" items="${list }" varStatus="s">
           <tr class="${s.index%2==0?'':'warning' }">
             <td width=10% class="text-center">${count }</td>
             <td width=45% class="text-left"><a href="adminboard_detail.do?no=${vo.no }"><font color='black'>${vo.subject }</font></a>
               <%--
                     board_detail.do => DispatcherServlet => 1.(BoardModel
                                        =================    @RequestMapping("board_detail.do")
                                           service           메소드 => DAO연결 => 결과값을 가지고 온다 
                                                             request에 담아서 전송)
                                                             ==> DispatcherServlet => forward
                                                             ==> 2. JSP에서 request에 있는 데이터 출력 
                --%>
               <c:if test="${today==vo.dbday }">
                 <sup><font color=red>new</font></sup>
               </c:if>
             </td>
             <td width=15% class="text-center">${vo.name }</td>
             <td width=20% class="text-center">${vo.dbday }</td>
              <%--
                  SimpleDateFormat = fmt:formatDate
               --%>
             <td width=10% class="text-center">${vo.hit }</td>
           </tr>
           <c:set var="count" value="${count-1 }"/><%-- (count--) --%>
         </c:forEach>
       </table>
       <table class="table">
        <tr>
          <td class="text-left">
           <form method="post" action="adminboard_find.do" id="frm">
           <select name="fs" class="input-md form-control2">
             <option value="name">이름</option>
             <option value="subject">제목</option>
             <option value="content">내용</option>
           </select>&nbsp;
           <%--
                  lg => sm => md => xs
            --%>
           <input type=text name=ss size=15 class="input-sm form-control2" id="ss">&nbsp;&nbsp;
           <input type=button value="검색" class="btnSearchCss" id="findBtn">
           </form>
          </td>
          	<td class="text-center">
				<ul class="pagination">
					<li><a href="adminboard_list.do?page=1">&lt;&lt;</a></li>
					<c:if test="${curpage != startPage }">
					<li><a href="adminboard_list.do?page=${curpage-1}">&lt;</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<li class="${i==curpage?'active':''}"><a href="adminboard_list.do?page=${i }">${i }</a>
					</c:forEach>
					<c:if test="${curpage != endPage }">
					<li><a href="adminboard_list.do?page=${curpage+1}">&gt;</a></li>
					</c:if>
					<li><a href="adminboard_list.do?page=${allPage }">&gt;&gt;</a></li>
				</ul>
			</td>
        </tr>
       </table>
		</div>
     </div>
</body>
</html>