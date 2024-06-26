<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/businessM/businessM.css?after">
<script type="text/javascript" src="${path}/resources/js/businessM/businessM.js"></script>
</head>
<body>


<div class="skill-box">
	<div class="skill-bar">
		<span class="per01">
			<span class="tooltip01">25%</span>
		</span>
	</div>
</div>

<div class="center-box">
<h1>회원정보 확인하기</h1><br>
<form action="register02" method="post" onsubmit="return inputcheck00()">
		<label>
		가게 이름
		<input type="text" id="store_name" name="store_name" placeholder="${storeName}">
		</label>
		<br>
		<label>
		사업자번호 &nbsp;
		<span class="line">${storeId}</span>
		</label>
		<hr>
		회원정보가 올바르다면 다음 버튼을, 틀리다면 <b>회원정보 수정을 위해 <a href="">여기</a></b>를 눌러주세요.
		<div style="display: flex; justify-content: space-between;">
			<button type="button" onclick=" window.history.back()">이전</button>
			<button type="submit">다음</button>
		</div>
	</form>
</div>


</body>
</html>