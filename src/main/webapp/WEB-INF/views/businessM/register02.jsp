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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${path}/resources/js/businessM.js"></script>
</head>
<body>

<a href="register03">3단계로</a>
<div class="skill-box">
	<div class="skill-bar">
		<span class="per02">
			<span class="tooltip02">50%</span>
		</span>
	</div>
</div>
<h1>주소 등록하기</h1>
	<form action="register02" method="post">
		<input type="text" id="addr1" name="addr1" readonly placeholder="우편번호를 검색해주세요">
		<button type="button" onclick="daumPost()">우편번호 검색</button>
		<input type="text" id="addr2" name="addr2" readonly placeholder="주소"><br>
		<input type="text" id="addr3" name="addr3" placeholder="상세주소를 입력해주세요">
		<button type="submit">다음</button>
	</form>
		<button onclick="goBack()">뒤로가기</button>

</body>
</html>