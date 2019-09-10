<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var i = 0;
var bfNo = 0;
var no = 0;
$(function(){
	
	$('.pageBtn').click(function(){
		var page = $(this).val();
		var bno = ${bno};
		$.ajax ({
			type: 'post', 
			data: {page:page, bno:bno},
			url: 'feed_detail_review.do',
			success: function(response){
				$('#reviewDiv').html(response);
			}
		});
	});
	
	$('#reviewSubmit').click(function(){
		if($('[name="subject"]').val()=="") {
			alert('제목을 입력해주세요!');
			$('[name="subject"]').focus();
			return;
		}
		if($('[name="dtype"]').val()=="") {
			alert('견종을 입력해주세요!');
			$('[name="dtype"]').focus();
			return;
		}
		if($('[name="content"]').val()=="") {
			alert('내용을 입력해주세요!');
			$('[name="content"]').focus();
			return;
		}
		$('#reviewInsFrm').submit();
	});

	$('[name="subject"]').keyup(function(){
	    if ($(this).val().length > $(this).attr('maxlength')) {
	        alert('100자까지만 입력 가능합니다!');
	        $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
	    }
	});

	$('[name="dtype"]').keyup(function(){
	    if ($(this).val().length > $(this).attr('maxlength')) {
	        alert('60자까지만 입력 가능합니다!');
	        $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
	    }
	});

	$('.rvwUpd').click(function(){
		var valueSplit = $(this).attr("value").split(',');
		no = valueSplit[0];
		$('.rvwUp').hide();
		
		if(i==0) {
			$('#Up'+no).show();
			bfNo = no;
			i = 1;
		} else {
			if (bfNo != no) {
				$('#Up'+bfNo).hide();
				$('#Up'+no).show();
				bfNo = no;
				i = 1;
			} else {
				$('#Up'+no).hide();
				i = 0;
			}
		}
		
		$('#Up'+no).find('.upStar'+valueSplit[1]).prop("selected", true);
		
	});
});
</script>
</head>
<body>
<table id="reviewTable" class="table table-borderless" >
	<caption><font class="feed_detail feed_title" >&nbsp;&nbsp;고객 리뷰</font></caption>
	<c:if test="${totalNum==0 }" >
		<tr height=30px;>
		</tr>
		<tr height=50px;>
			<td class="text-center">
				이런, 아직 작성된 후기가 없네요ㅠㅠ 첫 후기를 작성해주세요!
			</td>
		</tr>
	</c:if>
	<c:if test="${totalNum>0 }" >
		<c:forEach var="rvw" items="${rlist }">
			<tr height=30px;></tr>
			<tr>
				<td>
					<table class="table reviewList" >
						<tr>
							<td class="text-right" width=8% >작성자</td>
							<td class="text-left" width=10% >
								<c:if test="${rvw.id=='delete' }" >
									&nbsp;<font color="grey">(탈퇴)</font>
								</c:if>
								<c:if test="${rvw.id!='delete' }" >
									&nbsp;${rvw.mvo.name }
								</c:if>
							</td>
							<td class="text-right" width=8% >작성일</td>
							<td class="text-left" width=14% >&nbsp;${rvw.rdateS }</td>
							<td class="text-right" width=8% >별점</td>
							<td class="text-left" width=14% >
								&nbsp;<font style="color: #FFBB00;" ><c:forEach begin="1" end="${rvw.star }">★</c:forEach></font>
								<font style="color:#808080;" ><c:forEach begin="1" end="${5-rvw.star }">☆</c:forEach></font> (${rvw.star }.0)
							</td>
							<td class="text-right" width=8% >견종</td>
							<td class="text-left" width=12% >
								<c:if test="${rvw.dtype==null || rvw.dtype=='' }" >
									&nbsp;<font color="grey">(없음)</font>
								</c:if>
								<c:if test="${rvw.dtype!=null || rvw.dtype!='' }" >
									&nbsp;${rvw.dtype }
								</c:if>
							</td>
							<td class="text-right" width=18% >
								<c:if test="${sessionScope.id!=null && rvw.id==sessionScope.id }" >
									<button type="button" class="rvwUpd" value="${rvw.no },${rvw.star}" >수정</button>&nbsp;
									<a href="feed_review_del.do?no=${rvw.no }&bno=${bno }" class="rvwDel" onclick="return confirm('리뷰를 삭제하시겠습니까?');" >&nbsp;&nbsp;삭제&nbsp;&nbsp;</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td width=8% class="text-right" >제목</td>
							<td colspan=8 >&nbsp;${rvw.subject }</td>
						</tr>
						<tr>
							<td width=8% class="text-right" >내용</td>
							<td colspan=8 >&nbsp;${rvw.content }</td>
						</tr>
					</table>
					<div id="Up${rvw.no }" class="rvwUp" style="border: 1px solid #c3c3c3; border-radius: 10px; padding: 5px; display: none;">
						<form id="UpFrm${rvw.no }" method="post" action="feed_review_upd.do" >
							<div >
								<input type="hidden" name="no" value="${rvw.no }" >
								<input class="input-sm" type="text" name="subject" placeholder="제목 (최대 100자)" size="50" maxlength=100 value="${rvw.subject }">&nbsp;&nbsp;&nbsp;
								<input class="input-sm" type="text" name="dtype" placeholder="견종 (최대 60자)" size="20" maxlength=60 value="${rvw.dtype }">&nbsp;&nbsp;&nbsp;
								<select name="star" class="input-sm" >
									<option value="1" class="upStar1"  >★☆☆☆☆</option>
									<option value="2" class="upStar2"  >★★☆☆☆</option>
									<option value="3" class="upStar3"  >★★★☆☆</option>
									<option value="4" class="upStar4"  >★★★★☆</option>
									<option value="5" class="upStar5"  >★★★★★</option>
								</select>
								<input type="hidden" name="fnum" value="${bno }" >
								<table class="table-borderless" style="margin: 5px 0px 0px 0px;">
									<tr>
										<td width=85% style="padding: 0;" >
											<textarea rows="3" cols="120" name="content" placeholder="내용" class="input-sm">${rvw.content }</textarea>
										</td>
										<td width=15% style="padding: 0;" >
											<input type="submit" class="reviewUpSub" onclick="return confirm('리뷰를 수정하시겠습니까?');" value="수정" >
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td>
				<div class="blog-pagination">
				<div style="height: 30px;" ></div>
				<ul class="pagination">
					<c:if test="${curpage>3 }" >
						<li><button type="button" class="pageBtn" id="firstPage" name="page" value="1"></button></li>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }" >
						<li class="${i==curpage?'active':'' }" ><button type="button" class="pageBtn" name="page" value="${i }">${i }</button></li>
					</c:forEach>
					<c:if test="${curpage<totalPage-2 }" >
						<li><button type="button" class="pageBtn" id="lastPage" name="page" value="${totalPage }"></button></li>
					</c:if>
				</ul>
			</div>
			</td>
		</tr>
	</c:if>
	<c:if test="${sessionScope.id!=null }" >
		<tr>
			<td>
				<form id="reviewInsFrm" method="post" action="feed_review_ins.do" >
					<div id="reviewInput" style="border: 1px solid #c3c3c3; border-radius: 10px; padding: 5px;">
						<div >
							<input class="input-sm" type="text" name="subject" placeholder="제목 (최대 100자)" size="50" maxlength=100 >&nbsp;&nbsp;&nbsp;
							<input class="input-sm" type="text" name="dtype" placeholder="견종 (최대 60자)" size="20" maxlength=60 >&nbsp;&nbsp;&nbsp;
							<select name="star" class="input-sm" >
								<option value="1" >★☆☆☆☆</option>
								<option value="2" >★★☆☆☆</option>
								<option value="3" selected="selected">★★★☆☆</option>
								<option value="4" >★★★★☆</option>
								<option value="5" >★★★★★</option>
							</select>
							<input type="hidden" name="fnum" value="${bno }" >
							<table class="table-borderless" style="margin: 5px 0px 0px 0px;">
								<tr>
									<td width=85% style="padding: 0;" >
										<textarea rows="3" cols="120" name="content" placeholder="내용" class="input-sm"></textarea>
									</td>
									<td width=15% style="padding: 0;" >
										<input type="button" id="reviewSubmit" value="작성" >
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</td>
		</tr>
	</c:if>
</table>
</body>
</html>