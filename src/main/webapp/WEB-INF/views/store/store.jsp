<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let store_id = '${infoDTO.store_id}';
</script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/store/storeCSS.css?after">
<script src="${path}/resources/js/store/store.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
				<button class="button2 btn2Fade" onclick="Jjim(${infoDTO.store_id})">찜하기</button>
			</div>
		</div>
	
		<div class="main-photo">
			<button style="visibility: hidden;">${infoDTO.store_id}</button>
			<img src="/root/businessM/download?img=${mainImg}">
		</div>
	v
		<div class="store_name">
		    <span style="color: gray;">${infoDTO.store_add} | </span>
		    <span style="color: gray;">${infoDTO.store_category} </span><br>
		    <span style="font-size: 50px; font-weight: bold;">${infoDTO.store_name}</span><br>
		    
		    <img src="resources/img/Boseon/보정/별.png" width="15px"> ${scoreAvr} &nbsp;&nbsp;&nbsp;
		    리뷰 <a href=""><span style="color: #397BE6;">${totalreview}</span></a> &nbsp;&nbsp;&nbsp;
		    <img src="resources/img/Boseon/보정/하트.png" width="15px"> ${totalBookmark}
		    <br><br>
		    
		    <span style="font-size: 18px; visibility: hidden;">#&nbsp;#&nbsp;#&nbsp;#</span>
		</div>
	
		<div class="review-photo">
		<c:choose>
		
			<c:when test="${reviewImg.size() > 4 }">
				<c:forEach var="Rimg" items="${reviewImg}">
	                <img src="/root/businessM/download?img=${Rimg}">
	            </c:forEach>
	        </c:when>
	            
	        <c:otherwise>
				<c:forEach var="Simg" items="${storeImg}">
	                <img src="/root/businessM/download?img=${Simg}">
	            </c:forEach>
				<c:forEach var="Rimg" items="${reviewImg}">
	                <img src="/root/businessM/download?img=${Rimg}">
	            </c:forEach>
            </c:otherwise>
            
        </c:choose>
		</div>
		
		<div class="categories">
			<button class="catebutton catebtnFade" onclick="category(0, '${infoDTO.store_id}')">정보</button>
			<button class="catebutton catebtnFade" onclick="category(2, '${infoDTO.store_id}')">메뉴</button>
			<button class="catebutton catebtnFade" onclick="category(3, '${infoDTO.store_id}')">리뷰()</button>
			<button class="catebutton catebtnFade" onclick="category(4, '${infoDTO.store_id}')">사진()</button>
			<button class="catebutton catebtnFade" onclick="category(5, '${infoDTO.store_id}')">지도</button>
			<hr>
		</div>
		
		<div class="iframe">
			<iframe frameborder="0" scrolling="no" id="myIframe" onload="iHeight();" 
				style="width:1500px; min-height:100px;" ></iframe>
		</div>
		
	</div>
		<%@ include file="../main/footer.jsp" %>	
	</div>
	

<script type="text/javascript">
	

</script>

</body>
</html>

















