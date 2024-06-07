<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${path}/resources/css/main/mainPage1.css?after"/>
<script  type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main/image_slid.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3/dist/js/splide.min.js"></script>

 <%@ include file="./header.jsp" %> 
</head>
<body>
	<div class="page">
		<div class="content1">
			<div class="main-img">
				<div>
					<img src="${path}/resources/img/main/test8.jpg">
				</div>
			</div>
		</div>
			<section class="intro-hub">
				<div>
					<p class="first-line">WELCOME!</p><br>
					<p class="rest-line">qwerqwer qwerqwerqwerqwerqwer qwerqwerqwerqwerqwer<br>
					qwerqwer qwerqwerqwerqwer qwerqwer</p>
				</div>
			</section>
			
			<div class="content2">
				<div class="menu-img">
					<ul class="image-slid">
				
				
				
					<li class="food-img">
						<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225"><br>
							<div class="food-tagname">
							#한식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img class="on" src="${path}/resources/img/main/맛집04.jpg" width="225"><br>
							<div class="food-tagname">
							#일식
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					</ul>
				</div>
				
				<div class="menu-img1">
					<ul class="image-slid">
				
				
				
					<li class="food-img">
						<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225"><br>
							<div class="food-tagname">
							#한식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img class="on" src="${path}/resources/img/main/맛집04.jpg" width="225"><br>
							<div class="food-tagname">
							#일식
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					</ul>
				</div>
				
				<div class="menu-img2">
					<ul class="image-slid">
				
				
				
					<li class="food-img">
						<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225"><br>
							<div class="food-tagname">
							#한식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img class="on" src="${path}/resources/img/main/맛집04.jpg" width="225"><br>
							<div class="food-tagname">
							#일식
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					</ul>
				</div>
			</div>
	</div>
</body>
 <%@ include file="./footer.jsp" %> 
</html>







