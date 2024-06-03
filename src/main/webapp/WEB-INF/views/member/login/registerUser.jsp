<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>회원 정보 입력</h1>
	<b>아이디</b>
	<input type="text" name="id"><br>
	<b>닉네임</b>
	<input type="text" name="id"><br>
	<b>비밀번호</b>
	<input type="text" name="id"><br>
	<b>비밀번호 확인</b>
	<input type="text" name="id"><br>
	<b>이메일</b>
	<input type="text" name="id"><b>@</b>
	<select>
		<option>naver.com
		<option>daum.net
		<option>google.com
	</select><br>
	<b>전화번호</b>
	<select>
		<option>010
	</select>
	<b>-</b>
	<input type="number" name="phone1">
	<b>-</b>
	<input type="number" name="phone2">
	<input type="button" value="인증"><br>
	<b>전화번호 인증</b>
	<input type="number" placeholder="인증번호 입력">
	<input type="button" value="인증"><br>
	<b>생년월일</b>
	<select id="year">
		<% 
		int year = Calendar.getInstance().get(Calendar.YEAR);
		for (int i = year; i >= 1900; i--) { %> 
				<option><% out.println(i); %>
		<% } %>		
	</select>
	<b>년</b>
	<select id="month">
		<% for (int i = 1; i <= 12; i++) { %>
				<option><% out.println(i); %>
		<% } %>
	</select>
	<b>월</b>
	<select id="day">
		<% int day = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH); 
			for (int i = 1; i <= day; i++) { %>
				<option><% out.println(i); %>
		<% } %>
	</select>
	<b>일</b>
	
	<script type="text/javascript">
		$("#month").click( () => {
			const month = $("#month").val();
			const year = $("#year").val();
			console.log("month : ", month)
			console.log("year : ", year)
			console.log(new Date(year, month));
			console.log(new Date(new Date(year, month)-1))
			$("#day").option("asdf")
		})
	</script>
</body>
</html>