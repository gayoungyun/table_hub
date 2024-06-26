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
		<span class="per05">
			<span class="tooltip05">100%</span>
		</span>
	</div>
</div>

<div class="center-box">
	<div style="display:flex; flex-direction: row; align-items: center;">
		<img src="resources/img/폭죽.png" width="80px">
		<h1>내 가게가 등록 되었습니다!</h1>
		<img src="resources/img/폭죽.png" width="80px">
	</div>
	<br>
	<div style="display:grid; justify-items: center;">
		<button type="button" onclick="">메뉴 등록 하기</button><br>
		<button type="button" onclick="">사진 등록 하기</button><br>
		<button type="button" onclick="window.location.href='http://localhost:8080/root/'">메인 화면</button><br>
		<button type="button" onclick="window.location.href='http://localhost:8080/root/storeInfo'">내 가게 정보보기</button>
	</div>
</div>

</body>
</html>