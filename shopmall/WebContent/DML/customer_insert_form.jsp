<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 입력</title>
</head>
<body>
	<form method="post" action="customer_insert_db.jsp">
		<table>
			<caption>회원 정보 입력</caption>
			<tr style="border-syle: hidden hidden solid hidden">
				<td colspan="2" style="background-color: white; text-align: right;">* 부분은 필수 입력사항입니다.</td>
			</tr>
			<%@ include file="/common/html_input1_irud.inc"%>

			<tr>
				<th>*비밀번호</th>
				<td>
					<input type="password" name="cust_pw" required>
				</td>
			</tr>
			<tr>
				<th>&nbsp; *이름 &nbsp;</th>
				<!-- &nbsp;는 띄어쓰기 한칸을 의미함 html에서 띄어쓰기 연속해서 넣어도 1개만 인식하므로 &nbsp;를 사용 -->
				<td>
					<input type="text" name="cust_name" required>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<select name="tel_no_gubun" >
						<option selected value="">서비스 구분</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					-
					<input type="text" name="tel_no_guk" maxlength="4">
					-
					<input type="text" name="tel_no_seq" maxlength="4">
				</td>
			</tr>

			<tr>
				<th>&nbsp; 주소 &nbsp;</th>
				<!-- &nbsp;는 띄어쓰기 한칸을 의미함 html에서 띄어쓰기 연속해서 넣어도 1개만 인식하므로 &nbsp;를 사용 -->
				<td>
					<input type="text" name="cust_addr">
				</td>
			</tr>


			<tr>
				<th>&nbsp; 성별 &nbsp;</th>
				<td>
					<input type="radio" name="cust_gender" value="M" >
					남자 &nbsp;
					<input type="radio" name="cust_gender" value="F" >
					여자 &nbsp;
				</td>
			</tr>

			<tr>
				<th>&nbsp; 이메일 &nbsp;</th>
				<td>
					<input type="text" name="cust_email_1">
					@
					<input type="text" name="cust_email_2">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="회원가입">
				</td>
			</tr>

		</table>
	</form>
</body>
</html>