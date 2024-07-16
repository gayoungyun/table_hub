<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/businessM/businessMstore.css?after">
<script src="${path}/resources/js/businessM/businessMstore.js"></script>
</head>
<body>
<div class="header">
<%@ include file="../../main/header.jsp" %>
</div>

<div class="center-box">
<div class="skill-box">
	<div class="skill-bar">
		<span class="per03">
			<span class="tooltip03">75%</span>
		</span>
	</div>
</div>
	<form action="register04" method="post" onsubmit="return inputcheck02()">
	<div class="white_box">
<h1>상세정보 입력하기</h1><br>
<h5>*표시 항목은 필수항목입니다</h5>

<div class="text_leftAlign1">
		*소개글 <textarea id="store_introduce" name="store_introduce" placeholder="소개글을 입력해주세요"></textarea><br>
		
		<div id="store_category">
		*가게 종류<br>
		<label><input type="checkbox" name="store_category" value="한식"> 한식</label>&nbsp;
        <label><input type="checkbox" name="store_category" value="양식"> 양식</label>&nbsp;
        <label><input type="checkbox" name="store_category" value="중식"> 중식</label>&nbsp;
        <label><input type="checkbox" name="store_category" value="일식"> 일식</label>&nbsp;
        <label><input type="checkbox" name="store_category" value="뷔페"> 뷔페</label>&nbsp;
        <label><input type="checkbox" name="store_category" value="카페"> 카페</label><br>
        <label><input type="checkbox" name="store_category" value="디저트"> 디저트</label>&nbsp;
        <label for="category_ect"> 기타</label>
		<input type="text" name="store_category" id="category_ect"><br>
		</div>
			
		<div>
		편의 시설<br>
		<label><input type="checkbox" name="store_amenities" value="포장"> 포장</label>&nbsp;
        <label><input type="checkbox" name="store_amenities" value="주차"> 주차</label>&nbsp;
        <label><input type="checkbox" name="store_amenities" value="화장실"> 남/녀 화장실 구분</label>&nbsp;
        <label><input type="checkbox" name="store_amenities" value="인터넷"> 무선 인터넷</label>&nbsp;
        <label><input type="checkbox" name="store_amenities" value="아기의자"> 아기의자</label><br>
        <label><input type="checkbox" name="store_amenities" value="장애인"> 장애인 시설</label>&nbsp;
        <label><input type="checkbox" name="store_amenities" value="수유방"> 수유방</label>&nbsp;
        <label><input type="checkbox" name="store_amenities" value="놀이시설"> 놀이시설</label><br>
        <label for="amenities_ect">기타</label>
		<input type="text" name="store_amenities" id="amenities_ect"><br>
		</div>	
		
		특이사항 <textarea name="store_note" 
		placeholder="예) 주차장이 협소합니다. 8인 이상예약은 전화 부탁트립니다"></textarea><br>
		
		*최대 수용 인원 <input type="text" id="store_max_person" name="store_max_person"><br>
		*예약 규정 <textarea id="store_booking_rule" name="store_booking_rule" 
		placeholder="예) 예약시간 10분 지각 시 예약이 취소됩니다"></textarea>
		<hr>
		</div>
		</div>
		<div style="display: flex; justify-content: space-between;">
			<button type="button" class="button1 btn1Fade" onclick=" window.history.back()">이전</button>
			<button type="submit" class="button1 btn1Fade">다음</button>
		</div>
	</form>
</div>

</body>
</html>