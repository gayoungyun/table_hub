<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/businessM/businMinfo.css?after">
<script src="${path}/resources/js/businessM/store.js"></script>
</head>
<body>
	<div id="myPageMenuWrapper">
		<div id="myPageMenu">
			<h3>마이페이지</h3>
			<hr>
			<b class="title">가게정보 관리</b><br>
			<a class="content" id="detail" href="storeInfo">정보 확인 및 수정</a><br>
			<a class="content" id="myBooking" href="myBooking">메뉴 정보 확인</a><br>
			<a class="content" id="myBooking" href="myBooking">사진 정보 확인</a><br>
			<a class="content" id="myBooking" href="myBooking">고객 후기 보기</a><br>
			<a class="content" id="deleteUser" href="deleteUser">예약 관리</a>
		</div>
	</div>
	
	<div class="iframe">
	<iframe frameborder="0" scrolling="no" id="myIframe" onload="iHeight();" 
		style="width:1500px; min-height:100px;" ></iframe>
	</div>


</body>
</html>