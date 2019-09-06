<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#addDog').click(function(){
		var dogname = $('#dogname').val();
		var dtype = $('#dtype').val();
		var dyear = $('#dyear').val();
		var dmonth = $('#dmonth').val();
		var dday = $('#dday').val();
		var dsex = $("input[name='dsex']:checked").val();
	
		if(dogname.trim()==""){
			alert("반려견의 이름을 입력해주세요");
			$('#dogname').focus();
			return;
		}
			
		 $.ajax({ 
				type:'post',
				url:'hospital_dog_insert_ok.do',
				data:{dogname:dogname,dtype:dtype,dyear:dyear,dmonth:dmonth,dday:dday,dsex:dsex},
				success:function(response)
				{	
					$("#PopupDog").html(response);				
				}
			});
		 $("#contents2 > a").blur();
		 $("#layerPopup2").show();
		 $("#layerPopup2 a").focus();


		 return false;
	});
});
</script>
<style type="text/css">
.rowrow{
	margin: 0px auto;
	width: 400px;
}
.dsexSelect input {
	display: none;
}
.dsexSelect input+label {
	display: inline-block;
	border-radius: 6px;
	background: #ffffff;
	margin-right: 3px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	color: #d29949;
}

.dsexSelect label {
	font-weight: 400;
}

.dsexSelect input[type=checkbox]:checked + label {
	background: #bd8942;
	color: #ffffff;
}

.dsexSelect input[type=radio]:checked + label {
	background: #bd8942;
	color: #ffffff;
}

</style>
</head>
<body>

<div class="rowrow optionList">
	<table class="table table-borderless rowrow" style="width:400px">
		<tr>
			<td class="text-center"><h3 class="text-center">반려견 정보</h3>123</td>
		</tr>
	</table>
	<table class="table table-borderless" style="width:400px">
		<tr>
			<td class="text-left" >반려견 이름</td>
		</tr>
		<tr>
			<td class="text-left">
				<input type=text id="dogname" name=dogname class="form-control" size=15 placeholder="Dog Name" >
			</td>
		</tr>
		<tr>
			<td class="text-left" >견종</td>
		</tr>
		<tr>
			<td class="text-left" >
				<input type=text name=dtype id="dtype" class="form-control" size=15 placeholder="Dog breeds">
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 생년월일</td>
		</tr>
		<tr>
			<td class="text-left" >
				<select name=dyear id="dyear" class="form-control2" style="width:27%">
					<option></option>
					<option>2019</option>
					<option>2018</option>
				</select>&nbsp;년&nbsp;&nbsp;&nbsp;
				<select name=dmonth id="dmonth" class="form-control2" style="width:27%">
					<option></option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option>11</option>
					<option>12</option>
				</select>&nbsp;월&nbsp;&nbsp;&nbsp;
				<select name=dday id="dday" class="form-control2" style="width:27%">
					<option></option>
					<option>1</option>
					<option>2</option>
				</select>&nbsp;일
			</td>
		</tr>
		<tr>
			<td class="text-left" >반려견 성별</td>
		</tr>
		<tr>
			<td class="text-left dsexSelect" >
				<input type=radio value="수컷" name=dsex checked="checked" id="dsex-male" class="dsex">
				<label for="dsex-male">&nbsp;&nbsp;&nbsp;수컷&nbsp;&nbsp;&nbsp;</label>
				<input type=radio value="암컷" name=dsex id="dsex-female" class="dsex">
				<label for="dsex-female">&nbsp;&nbsp;&nbsp;암컷&nbsp;&nbsp;&nbsp;</label>
			</td>
		</tr>
	</table>
	<table class="table table-borderless" style="width:400px;">
		<tr>
			<td  class="text-center">
				<input type=button value="반려견 추가" class="btn btn-submit" id="addDog">
			</td>
		</tr>
	</table>
</div>
</body>
</html>