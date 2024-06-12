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
		
		<div class="content_wrapper">
			<div class="content2">
				<div class="menu-img" id="slider1">
					<ul class="image-slide">
				
					<li class="food-img">
						<img class="out" src="${store_menu_img}" >
							<div class="food-tagname">
							#한식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img class="on" src="${store_menu_img}">
							<div class="food-tagname">
							#일식
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${store_menu_img}">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${store_menu_img}">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					
					</ul>
				</div>
			</div>
			
			
			

		
		<div class="content2">
				<div class="menu-img" id="slider2">
					<ul class="image-slide">
				
					<li class="food-img">
						<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225">
							<div class="food-tagname">
							#한식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img class="on" src="${path}/resources/img/main/맛집04.jpg" alt="음식사진">
							<div class="food-tagname">
							#일식
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" alt="음식사진">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집01.jpg" alt="음식사진">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					
					</ul>
				</div>
			</div>
			
			
			<div class="content2">
				<div class="menu-img" id="slider3">
					<ul class="image-slide">
				
					<li class="food-img">
						<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225">
							<div class="food-tagname">
							#한식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img class="on" src="${path}/resources/img/main/맛집04.jpg" alt="음식사진">
							<div class="food-tagname">
							#일식
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" alt="음식사진">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집01.jpg" alt="음식사진">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					
					</ul>
				</div>
			</div>
			
			<div class="content2">
				<div class="menu-img" id="slider4">
					<ul class="image-slide">
				
					<li class="food-img">
						<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225">
							<div class="food-tagname">
							#한식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img class="on" src="${path}/resources/img/main/맛집04.jpg" alt="음식사진">
							<div class="food-tagname">
							#일식
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" alt="음식사진">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집01.jpg" alt="음식사진">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					
					</ul>
				</div>
			</div>
			
			<div class="content2">
				<div class="menu-img" id="slider5">
					<ul class="image-slide">
				
					<li class="food-img">
						<img class="out" src="${path}/resources/img/main/맛집03.jpg" width="225">
							<div class="food-tagname">
							#한식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img class="on" src="${path}/resources/img/main/맛집04.jpg" alt="음식사진">
							<div class="food-tagname">
							#일식
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" alt="음식사진">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					<li class="food-img">
						<img src="${path}/resources/img/main/맛집01.jpg" alt="음식사진">
							<div class="food-tagname">
							#양식 
								<button type="button">자세히보기</button>
							</div>
					</li>>
					
					</ul>
				</div>
			</div>
			
					</div>
		</div>
			

	</div>
</body>
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
	    var sliders = document.querySelectorAll('.menu-img');
	    
	    sliders.forEach(function(slider) {
	    
	    	var index = 0;
	        var li = slider.querySelectorAll('ul.image-slide > li');
	        var liLength = li.length;
			
	        function updateSlider() {
	            var onNum = (index + 1) % liLength;

	            for (var i = 0; i < liLength; i++) {
	                li[i].classList.remove('on', 'out');
	                if (i == index) {
	                    li[i].classList.add('on');
	                } else if (i == onNum) {
	                    li[i].classList.add('out');
	                }
	            }

	            index = (index + 1) % liLength;
	        }

	        setInterval(updateSlider, 3000);
	        
	        
	        //버튼 클릭 이벤트 핸들러
	        var buttons = slider.querySelectorAll('.food-tagname button');
	         // 각 버튼에 클릭 이벤트를 추가
	        buttons.forEach(function(button) {
	            button.addEventListener('click', function() {
	                window.location.href = '/root/main/inputInfo'; 
	            });
	        });
	        
	    });
	});

	
	
	</script>
 <%@ include file="./footer.jsp" %> 
</html>







