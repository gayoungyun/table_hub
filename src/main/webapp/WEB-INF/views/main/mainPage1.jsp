<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/main/mainPage1.css?after"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
<script  type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main/image_slide.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3/dist/js/splide.min.js"></script>

 <%@ include file="./header.jsp" %> 
</head>
<body>
	<div class="page">
	
		<!-- ===== main img 부분 ===== -->
		<div class="content1">
			<div class="main-img">
				<div>
					<img src="${path}/resources/img/main/test8.jpg">
				</div>
			</div>
		</div>
		
		<!-- ===== 소개글 부분 ===== -->
		<section class="intro-hub">
			<div>
				<p class="first-line">WELCOME!</p><br>
				<p class="rest-line">qwerqwer qwerqwerqwerqwerqwer qwerqwerqwerqwerqwer<br>
				qwerqwer qwerqwerqwerqwer qwerqwer</p>
			</div>
		</section>
		
		<!-- ===== 태그별 img-slide 부분 ===== -->
		<div class="content_wrapper">
			<div class="content2">
				<div class="menu-img" id="slider1">
					<ul class="image-slide">
						<c:forEach var="dto" items="${dtoList}">
							<li class="food-img">
								<img width="380px" height="350px" src="download?fileName=${dto.store_menu_img}" >
								<div class="food-tagname">#한식 
									<button type="button">자세히보기</button>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		
			<div class="content2">
				<div class="menu-img" id="slider2">
					<ul class="image-slide">
						<li class="food-img">
							<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225">
							<div class="food-tagname">#한식 
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img class="on" src="${path}/resources/img/main/맛집04.jpg" alt="음식사진">
							<div class="food-tagname">#일식
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img src="${path}/resources/img/main/맛집05.jpg" alt="음식사진">
							<div class="food-tagname">#양식 
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img src="${path}/resources/img/main/맛집01.jpg" alt="음식사진">
							<div class="food-tagname">#양식 
								<button type="button">자세히보기</button>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="content2">
				<div class="menu-img" id="slider3">
					<ul class="image-slide">
						<li class="food-img">
							<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225">
							<div class="food-tagname">#한식 
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img class="on" src="${path}/resources/img/main/맛집04.jpg" alt="음식사진">
							<div class="food-tagname">#일식
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img src="${path}/resources/img/main/맛집05.jpg" alt="음식사진">
							<div class="food-tagname">#양식 
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img src="${path}/resources/img/main/맛집01.jpg" alt="음식사진">
							<div class="food-tagname">#양식 
								<button type="button">자세히보기</button>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="content2">
				<div class="menu-img" id="slider4">
					<ul class="image-slide">
						<li class="food-img">
							<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225">
							<div class="food-tagname">#한식 
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img class="on" src="${path}/resources/img/main/맛집04.jpg" alt="음식사진">
							<div class="food-tagname">#일식
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img src="${path}/resources/img/main/맛집05.jpg" alt="음식사진">
							<div class="food-tagname">#양식 
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img src="${path}/resources/img/main/맛집01.jpg" alt="음식사진">
							<div class="food-tagname">#양식 
								<button type="button">자세히보기</button>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="content2">
				<div class="menu-img" id="slider5">
					<ul class="image-slide">
						<li class="food-img">
							<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225">
							<div class="food-tagname">#한식 
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img class="on" src="${path}/resources/img/main/맛집04.jpg" alt="음식사진">
							<div class="food-tagname">#일식
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img src="${path}/resources/img/main/맛집05.jpg" alt="음식사진">
							<div class="food-tagname">#양식 
								<button type="button">자세히보기</button>
							</div>
						</li>
						<li class="food-img">
							<img src="${path}/resources/img/main/맛집01.jpg" alt="음식사진">
							<div class="food-tagname">#양식 
								<button type="button">자세히보기</button>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</body>
 <%@ include file="./footer.jsp" %> 
</html>







