<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/businessM.css?after">
<script src="${path}/resources/js/businessM.js"></script>
</head>
<body>


<div class="skill-box">
	<div class="skill-bar">
		<span class="per04">
			<span class="tooltip04">99%</span>
		</span>
	</div>
</div>

<div class="center-box">
<h1>예약정보 입력하기</h1><br>
	<form action="registerFinish" method="post">
	
		사업자번호*로그인 아이디<input type="text" value ="storeId 값 불러오기" readonly><br>
		비밀번호*로그인 비밀번호<input type="text" name="storePwd"><br>
		이메일<input type="text" name="storeEmail">
		<hr>
		<div style="display: flex; justify-content: space-between;">
			<button type="button" onclick=" window.history.back()">이전</button>
			<button type="submit">다음</button>
		</div>
	</form>
</div>

</body>
</html>