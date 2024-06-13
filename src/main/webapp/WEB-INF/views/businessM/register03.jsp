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
		<span class="per03">
			<span class="tooltip03">75%</span>
		</span>
	</div>
</div>

<div class="center-box">
<h1>상세정보 입력하기</h1><br>
	<form action="register04" method="post">
		소개글 <textarea name="storeIntroduce" placeholder="소개글을 입력해주세요"></textarea><br>
		가게 종류 <input type="text" name="storeCategory"><br>
		영업 시간<input type="text" name="storeBusinessHours">
		<button type="button" onclick="">영업시간 선택</button><br>
		편의 시설<input type="text" name="storeAmenities"><br>
		가게 전화번호<input type="text" name="storeMainPhone"><br>
		사장 전화번호<input type="text" name="storePhone"><br>
		특이사항 <textarea name="note" 
		placeholder="예) 주차장이 협소합니다. 8인 이상예약은 전화 부탁트립니다"></textarea><br>
		최대 수용 인원 <input type="text" name="storeMaxPerson"><br>
		예약 규정 <textarea name="storeNote" 
		placeholder="예) 예약시간 10분 지각 시 예약이 취소됩니다"></textarea>
		<hr>
		<div style="display: flex; justify-content: space-between;">
			<button type="button" onclick=" window.history.back()">이전</button>
			<button type="submit">다음</button>
		</div>
	</form>
</div>

</body>
</html>