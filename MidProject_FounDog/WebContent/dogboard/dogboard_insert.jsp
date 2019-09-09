<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/bootstrap.min.css">
<link href="../css/hospital.css" rel="stylesheet">
<link rel="stylesheet" href="../css/member.css">
<style type="text/css">
.row {
   margin: 0px auto;
   width:540px;
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
#detailbtn {
	display: inline-block;
	border-radius: 6px;
	background: #bd8942;
	color: #ffffff;
	margin-left: 5px;
	width: 85px;
	height: 85px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	var today = new Date();
	var prev_7day = new Date(); 
	prev_7day.setDate(prev_7day.getDate() - 7);
	document.getElementById('startDate').valueAsDate = prev_7day;
	document.getElementById('endDate').valueAsDate = today;
	$('#detailbtn').click(function(){
		var dno=$('#selectDog option:selected').attr("data-no");
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();	
	
		 $.ajax({ // 검색 결과 리스트 ajax
			type:'post',
			url:'hospital_reserve_list.do',
			data:{dno:dno,startDate:startDate,endDate:endDate},
			success:function(response)
			{	
				$("#reservelist").html(response);	
			
			}
		});
	});
});
</script>
</head>
<body>
   <div class="container">
     <h2 class="text-center">글쓰기</h2>
     <div class="row">
     <form method="post" action="dogboard_insert_ok.do" enctype="multipart/form-data">
       <table class="table table-borderless">
         <tr>
           <th colspan="2">카테고리&nbsp;&nbsp;&nbsp;&nbsp;
					 <select id="category" class="form-control2" name=category>
						<option value="0">찾습니다</option>
						<option value="1">발견했습니다</option>
					</select>
			</th>
   		</tr>
        <tr>
				<th>제보날짜</th>
				<td>
					<input type="date" id="startDate" name=lfdate size=25 class="form-control2">			
				</td>
			</tr>
         <tr>
         	<th>이름</th>
         	<th style="width:187px;">지역</th>
         </tr>
         <tr>
           <td>
             <input type=text name=dname size=25 class="form-control2">
           </td>
           <td class="text-right">
             <input type=text name=area size=25 class="form-control2">
           </td>
         </tr>
         <tr>
           <th>견종</th>
           <th style="width:187px;">성별</th>
         </tr>
         <tr>
           <td>
             <input type=text name=dtype size=25 class="form-control2">
           </td>
           <td>
             <input type=text name=dsex size=25 class="form-control2">
           </td>
         </tr>
         <tr>
           <th>무게</th>
           <th style="width:187px;">색깔</th>
           
         </tr>
         <tr>
           <td>
             <input type=text name=dkg size=25 class="form-control2">
           </td>
           <td>
             <input type=text name=dcolor size=25 class="form-control2">
           </td>
         </tr>
         <tr>
           <th>전화번호</th>
           <th style="width:187px;">나이</th>
           
         </tr>
         <tr>
           <td>
             <input type=text name=tel size=25 class="form-control2">
           </td>
           <td style="width:187px;">
             <input type=text name=dage size=25 class="form-control2">
           </td>
         </tr>
         <tr>
			<th colspan="2">첨부파일</th>
		</tr>
		<tr>
			<td colspan="2">
			<input type=file name=upload size=25 class="input-sm">
			</td>
		</tr>
         <tr>
           <th colspan="2">특징</th>
         </tr>
         <tr>
           <td colspan="2">
             <textarea rows="12" cols="80" name=dcharacter></textarea>
           </td>
         </tr>
         <tr>
           <td colspan="2" class="text-center">
             <input type="submit" value="글쓰기" style="width:200px;" class="btn-submit2">
           </td>
         </tr>
         <tr>
         	<td colspan="2" class="text-center">
         		<input type="button" value="취소" style="font-size:10pt;" class="btn btn-sm" onclick="javascript:history.back()">
         	</td>
         </tr>
       </table>
       </form>
     </div>
   </div>
</body>
</html>