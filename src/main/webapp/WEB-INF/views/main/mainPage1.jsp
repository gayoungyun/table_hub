<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/main/mainPage1.css?after"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
<script  type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


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
		    <c:forEach var="category" items="${categories}">
			    <div class="content2">
			        <div class="menu-img" id="slider${category}">
			            <ul class="image-slide">
			                <c:forEach var="dto" items="${dtoList}">
			                    <c:forEach var="cat" items="${fn:split(dto.store_menu_category, '/')}">
			                        <c:if test="${fn:trim(cat) == category}">
			                            <li class="food-img">
			                                <img width="380px" height="350px" src="download?fileName=${dto.store_menu_img}">
			                                <div class="food-tagname">#${cat}
			                                    <!-- 자세히보기 버튼 -->
			                                    <form action="${path}/main/mainPage2" method="get">
			                                        <input type="hidden" name="category" value="${cat}" />
			                                        <button type="submit">자세히보기</button>
			                                    </form> 
			                                </div>
			                            </li>
			                        </c:if>
			                    </c:forEach>
			                </c:forEach>
			            </ul>
			        </div>
			    </div>
			</c:forEach>
		</div>
	</div>
 <%@ include file="./footer.jsp" %> 
</body>
</html>


<script>


document.addEventListener('DOMContentLoaded', function() {
    var sliders = document.querySelectorAll('.menu-img');
    
    sliders.forEach(function(slider) {
        var index = 0; // 현재 슬라이드의 인덱스 추적
        var li = slider.querySelectorAll('ul.image-slide > li'); // 모든 슬라이드 요소 선택
        var liLength = li.length; // 슬라이드의 총 개수 저장

        li[index].classList.add('on'); // 초기 상태 설정: 첫 번째 슬라이드를 보이도록 설정

        function updateSlider() {
            var prevIndex = (index - 1 + liLength) % liLength; 
            // 이전 슬라이드 인덱스 계산, index-1이 음수가 되어도 올바른 인덱스 찾을 수 있도록 liLength 더하고 '%liLength'로 나머지 연산

            li[prevIndex].classList.remove('on');
            li[prevIndex].classList.add('out');
            // 이전 슬라이드의 클래스를 out으로 설정하여 슬라이드 아웃 애니메이션 적용

            li[index].classList.remove('out');
            li[index].classList.add('on');
            // 현재 슬라이드의 클래스를 on으로 설정해여 슬라이드 인 애니메이션 적용

            index = (index + 1) % liLength; // 인덱스 증가, 마지막 슬라이드 이후에 첫 번째 슬라이드로 돌아가도록
        }

        setTimeout(function() {
            setInterval(updateSlider, 3000);
        }, 0);

       
        // 버튼 클릭 이벤트 핸들러
        var buttons = slider.querySelectorAll('.food-tagname button');
        // 각 버튼에 클릭 이벤트를 추가
        buttons.forEach(function(button) {
            button.addEventListener('click', function() {
                var category = button.closest('.food-tagname').querySelector('input[name="category"]').value;
                var currentUrl = new URL(window.location.href);
                var keyword = currentUrl.searchParams.get("keyword");
                var searchType = currentUrl.searchParams.get("searchType");
                var url = '/root/main/mainPage2?category=' + encodeURIComponent(category);
                
                if (keyword) {
                    url += '&keyword=' + encodeURIComponent(keyword);
                }
                if (searchType) {
                    url += '&searchType=' + encodeURIComponent(searchType);
                }

                window.location.href = url;
            });
        });
    });
});


</script>



