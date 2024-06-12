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

<a href="register04">4단계로</a>
<div class="skill-box">
	<div class="skill-bar">
		<span class="per03">
			<span class="tooltip03">75%</span>
		</span>
	</div>
</div>

<h1>상세정보 입력하기</h1>
	<form action="register03" method="post">
		<textarea name="introduce" placeholder="소개글을 입력해주세요">소개글</textarea><br>
		<input type="text" name="category">가게종류<br>
		<input type="text" name="businessHours">영업시간
		<button type="button" onclick="">영업시간 선택</button><br>
		<input type="text" name="amenities">편의시설<br>
		<input type="text" name="mainPhone">가게전화번호<br>
		<input type="text" name="phone">사장전화번호<br>
		<textarea name="note" placeholder="예) 주차장이 협소합니다. 8인 이상예약은 전화 부탁트립니다">특이사항</textarea>
		<button type="submit">다음</button>
	</form>
		<button onclick="goBack()">뒤로가기</button>

</body>
</html>