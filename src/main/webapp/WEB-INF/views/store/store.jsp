<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/store/storeCSS.css?after">
<script src="${path}/resources/js/store/store.js"></script>
<!-- margin 순서 위 왼쪽 아래 오른쪽 --> 
</head>
<body>
<header class="header">
<%@ include file="../main/header.jsp" %>
</header>

<div class="fixed-scroll">
	<div style="margin: 150px auto;">
	
		<div class="store_top">
			<div>
				<button class="button1 btn1Fade" style="visibility: hidden;"></button>
				<button class="button1 btn1Fade" style="visibility: hidden;"></button>
			</div>
			<img src="resources\img\Boseon\보정\로고.png" onclick="window.location.href='/root'">
			<div>
				<button class="button1 btn1Fade" onclick="">예약하기</button>
				<button class="button2 btn2Fade" onclick="">찜하기</button>
			</div>
		</div>
	
		<div class="main-photo">
			<img src="resources\img\Boseon\카페 결\결01.jpg">
		</div>
	
		<div class="store_name">
		    <span style="color: gray;">종로 | </span>
		    <span style="color: gray;">브런치카페, 디저트</span><br>
		    <span style="font-size: 50px; font-weight: bold;">결</span><br>
		    
		    <img src="resources\img\Boseon\보정\별.png" width="15px"> 4.3 &nbsp;&nbsp;&nbsp;
		    리뷰 <a href=""><span style="color: #397BE6;">135</span></a> &nbsp;&nbsp;&nbsp;
		    <img src="resources\imge\Boseon\보정\하트.png" width="15px"> 32
		    <br><br>
		    
		    <span style="font-size: 18px;">#까눌레&nbsp;#브런치&nbsp;#커피&nbsp;#디저트맛집</span>
		</div>
	
		<div class="review-photo">
			<img src="resources\img\Boseon\카페 결\결01_4.jpg">
			<img src="resources\img\Boseon\카페 결\결02.jpg">
			<img src="resources\img\Boseon\카페 결\결02_2.jpg">
			<img src="resources\img\Boseon\카페 결\결02_3.jpg">
		</div>
		
		<div class="categories">
			<button class="catebutton catebtnFade" onclick="category(0)">정보</button>
			<button class="catebutton catebtnFade" onclick="category(2)">메뉴</button>
			<button class="catebutton catebtnFade" onclick="category(3)">리뷰()</button>
			<button class="catebutton catebtnFade" onclick="category(4)">사진()</button>
			<button class="catebutton catebtnFade" onclick="category(5)">지도</button>
			<hr>
		</div>
		
		<div class="iframe">
			<iframe frameborder="0" scrolling="no" id="myIframe" onload="iHeight();" 
				style="width:1500px; min-height:100px;" ></iframe>
		</div>
		
	</div>
</div>

<footer class="footer">
<%@ include file="../main/footer.jsp" %>
</footer>

</body>
</html>

















