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
	width: 900px;
}

.clear {
	margin: 0px auto;
	width: 400px;
	height: 400px;
}

#meswei {
	width: 50px;
	height: 27.5px;
}

#actlev {
	width: 180px;
	height: 25px;
}

.vGraph {
	padding: 20px 0;
}

.vGraph ul {
	margin: 0;
	padding: 0;
	height: 200px;
	border: 1px solid #ddd;
	border-top: 0;
	border-right: 0;
	font-size: 11px;
	font-family: Tahoma, Geneva, sans-serif;
	list-style: none;
}

.vGraph ul:after {
	content: "";
	display: block;
	clear: both;
}

.vGraph li {
	float: left;
	display: inline;
	width: 8%;
	height: 100%;
	margin: 0 3%;
	position: relative;
	text-align: center;
	white-space: nowrap;
}

.vGraph .gTerm {
	position: relative;
	display: inline-block;
	width: 100%;
	height: 20px;
	line-height: 20px;
	margin: 0 -100% -20px 0;
	padding: 200px 0 0 0;
	vertical-align: bottom;
	color: #767676;
	font-weight: bold;
}

.vGraph .gBar {
	position: relative;
	display: inline-block;
	width: 100%;
	margin: -1px 0 0 0;
	border: 1px solid #ccc;
	border-bottom: 0;
	background: #e9e9e9;
	vertical-align: bottom;
}

.vGraph .gBar span {
	position: absolute;
	width: 100%;
	top: -20px;
	left: 0;
	color: #767676;
}
</style>
<script type="text/javascript">
function checnum(as)
{
	  var a = as.value;
	
	  for(var x=0; x<a.length; x++)
	  {
	     var ff = a[x];
	     if(isNaN(a) || ff==" ")
	     {
		  a = a.substring(0,(a.length-1));
		  as.value = a;
	     }	
  	   }	
}

function dog_calorie()
{
	var weig = $("#weig").val();

	if(weig=="")
	{
		alert("강아지의 체중을 입력해주세요");
		$("#weig").focus();
	}
	else
	{
		weig = parseFloat(weig);
		var meswei = parseFloat($("#meswei").val());
		var actlev = $("#actlev").val(); 
		var actval = actlev.split("--");

		weig = weig * meswei;
		var part1 = Math.pow(weig, 0.75);
		var part2 = Math.round(part1 * parseFloat(actval[0]));
		if(isNumber(actval[1])==true)
		{
			var part3 = Math.round(part1 * parseFloat(actval[1]));
			result = part2 +" - "+ part3 + " Calorie/Day";
		}
		else
		{
			result = part2 + " Calorie/Day";
		}
		$("#result").val(result);
	}
}

function isNumber(num) 
{
  return (typeof num == "string" || typeof num == "number") && !isNaN(num - 0) && num !== "";
}

/* function alert(val)
{
    $("#dynErrDisp").show();
    $("#dynErrDisp").html(val);
}
$(document).ready(function() {
	closeModal();
}); */

</script>
</head>
<body>
	<div class="container">
		<h2 align="center">칼로리 계산기</h2>
		<div class="row">
			<div class="clear">
				<form name="first" class="well">
					<!-- style="background-color: #d29949;" -->
					<!-- 					<div id="overlayloder" style ="top: 400px; display: none;">
						<div class="loder">						
						</div>
					</div> -->
					<div id="dispCalConts" style="opacity: 1;">
						<table align="center" border="0" cellpadding="1" cellspacing="1"
							id="dog_calorie">
							<tbody>
								<tr>
									<td align="center">강아지 무게</td>
									<!-- style="color:white" -->
									<td>&nbsp; <input type="text" id="weig" size="20"
										width="20px" height="20px" onkeyup="checnum(this)"
										style="text-align: center"> <select id="meswei">
											<option value="1">kg</option>
											<option value="0.45359237">lbs</option>
									</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<td align="center">활동량</td>
									<!-- style="color:white" -->
									<td>&nbsp; <select id="actlev">
											<option value="110">표준체중</option>
											<option value="125">활동적인</option>
											<option value="75">과체중</option>
											<option value="175">매우활동적</option>
											<option value="90">노견,중성화,비활동적</option>
											<option value="130--150">가벼운산책</option>
											<option value="150--175">평균적산책</option>
											<option value="175--250">활동적산책</option>
									</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<td align="center" colspan="2"><input type="button"
										value="Calculate" onclick="dog_calorie()" class="btn btn-sm"
										style="background-color: #8F784B; color: white;">
										&nbsp; <input type="reset" value="Reset" class="btn btn-sm"
										style="background-color: #F69B94; color: white;">
										<div class="errClass" id="dynErrDisp" style="display: none;"></div>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<td align="center">일별 칼로리 계산</td>
									<!-- style="color:white" -->
									<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" readonly
										id="result" style="text-align: center">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<!-- 			 <div class="row">
        	    <a href="#"><img src="http://placehold.it/400x200/brown" alt=""></a>
          	  </div>  -->
          	  <h5 align="center">표준체중별 하루 평균 사료열량(Calorie)</h5>
				<div class="vGraph">
					<ul>
						<li><span class="gTerm">5kg미만</span><span class="gBar" style="height: 24.5px"><span>220</span></span></li>
						<li><span class="gTerm">5~10kg</span><span class="gBar" style="height: 49.9px"><span>499</span></span></li>
						<li><span class="gTerm">10~15kg</span><span class="gBar" style="height: 73.1px"><span>731</span></span></li>
						<li><span class="gTerm">15~20kg</span><span class="gBar" style="height: 94.1px"><span>941</span></span></li>
						<li><span class="gTerm">20~25kg</span><span class="gBar" style="height: 113.6px"><span>1136</span></span></li>
						<li><span class="gTerm">25~30kg</span><span class="gBar" style="height: 132.1px"><span>1321</span></span></li>
						<li><span class="gTerm">30kg초과</span><span class="gBar" style="height: 149.7px"><span>1497</span></span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>