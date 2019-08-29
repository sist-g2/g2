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
</head>
<body>
	<div class="calc">
		<h2 align="center">칼로리 계산기</h2>
		<div class="clearfix">
			<div class="clear">
				<form name="first">
					<div id="overlayloder" style ="top: 400px; display: none;">
						<div class="loder">						
						</div>
					</div>
					<div id="dispCalConts" style="opacity:1;">
						<table align="center" border="0" cellpadding="1" cellspacing="1" id="dog_calorie">
							<tbody>
								<tr>
									<td>강아지 무게</td>
									<td>" = "
									<input type="text" id="weig" size="17" onkeyup="checnum(this)">
									<select id="meswei">
										<option value="0.45359237">lbs</option>
										<option value="1">kg</option>
									</select>									
									</td>
								</tr>
								<tr>
									<td>활동량</td>
									<td>" = "									
									<select id="active">
										<option value="110">평균</option>
										<option value="125">활동적</option>
										<option value="75">과체중</option>
										<option value="175">매우활동적</option>
										<option value="90">비활동적</option>
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
									<td align="center" colspan="2">
									<input type="button" value="Calculate" onclick="dog_calorie()" style="visibility:visible">
									"&nbsp;"
									<input type="reset" value="Reset" style="visibility:visible;">
									<div class="errClass"></div>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>								
								</tr>
								<tr>
									<td>일별 칼로리 계산</td>
									<td>" = "
									<input type="text" readonly id="result">								
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>