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
<img src="resources/img/로고.png" width="100px"
		onclick="window.location.href='http://localhost:8080/root/'"><br>
가게 이름 : ${ store_name }<br>
사업자번호 : ${ store_id }<br>
주소 : ${store_zip}<br> ${store_add}<br>${store_add_info}<br>
가게 종류 : ${ store_category }<br>
이메일 : ${ store_email }<br>
비밀번호 : ${ store_pwd }<br>
가게 전화번호 : ${ store_phone }<br>
사장님 전화번호 : ${ store_main_phone }<br>
예약 가능시간 : ${ store_business_hours }<br>
편의 시설 : ${ store_amenities }<br>
특이 사항 : ${ businM.id }<br>
소개글 : ${ store_introduce }<br>
최대 수용 인원 : ${ store_max_person }<br>
예약 규정 : ${ store_booking_rule }<br>
<button type="button"> 수정하기 </button>

</body>
</html>