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
</head>
<body>

<a href="register02">2단계로</a>
<div class="skill-box">
	<div class="skill-bar">
		<span class="per01">
			<span class="tooltip01">25%</span>
		</span>
	</div>
</div>
<h1>가게 등록하기</h1>
<form action="register01" method="post">
		<input type="text" name="storeName" placeholder="가게 이름을 입력해주세요"><br>
		<input type="text" name="businessNumber" placeholder="사업자번호를 입력해주세요"><br>
		<button type="submit">다음</button>
	</form>
	<a href="javascript:history.back()">이전</a>



</body>
</html>