<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/storeCSS.css?after">
</head>
<body>
<div style= text-align:center>
	<img src="resources/img/결01.jpg" width="100px">
	<div class="infoBox">
		아침엔 상쾌한 브런치카페, 저녁엔 조용한 혼밥플레이스
	</div>
</div>

	가게 이름 : ${ dto.store_name }<br>
	사업자번호 : ${ dto.store_id }<br>
	주소 : ${dto.store_add}<br>${dto.store_add_info}<br>
	우편번호 : ${dto.store_zip}<br>
	가게 종류 : ${ dto.store_category }<br>
	이메일 : ${ dto.store_email }<br>
	가게 전화번호 : ${ dto.store_phone }<br>
	사장님 전화번호 : ${ dto.store_main_phone }<br>
	예약 가능시간 : ${ dto.store_business_hours }<br>
	편의 시설 : ${ dto.store_amenities }<br>
	특이 사항 : ${ dto.store_note }<br>
	소개글 : ${ dto.store_introduce }<br>
	최대 수용 인원 : ${ dto.store_max_person }<br>
	예약 규정 : ${ dto.store_booking_rule }<br>


</body>
</html>