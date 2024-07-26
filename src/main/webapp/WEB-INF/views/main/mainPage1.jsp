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
		                    <c:forEach var="store" items="${categoryStoreMap[category]}" varStatus="status">
                                <c:forEach var="img" items="${categoryImagesMap[category][status.index]}">
                                    <li class="food-img">
                                        <img width="380px" height="350px" src="${path}/businessM/download?img=${fn:substringAfter(img.store_img_root, 'C:\\tablehub_image\\businessM\\')}" alt="Store Image">
                                        <div class="food-tagname">#${category}
                                            <!-- 자세히보기 버튼 -->
                                            <form action="${path}/main/mainPage2" method="get">
                                                <input type="hidden" name="searchType" value="menu_category"/>
                                                <input type="hidden" name="keyword" value="${category}"/>
                                                <input type="hidden" name="category" value="${category}"/>
                                                <input type="submit" value="자세히보기"/>
                                            </form>
                                        </div>
                                    </li>
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
        var li = slider.querySelectorAll('ul.image-slide > li'); // 모든 슬라이드 요소 선택
        console.log(li); // 선택된 슬라이드 요소를 콘솔에 출력
        var liLength = li.length; // 슬라이드의 총 개수 저장

        if (liLength > 0) { // 슬라이드 요소가 존재하는지 확인
            var index = 0; // 현재 슬라이드의 인덱스 추적
            li[index].classList.add('on'); // 초기 상태 설정: 첫 번째 슬라이드를 보이도록 설정

            function updateSlider() {
                var prevIndex = (index - 1 + liLength) % liLength; 
                li[prevIndex].classList.remove('on');
                li[prevIndex].classList.add('out');
                li[index].classList.remove('out');
                li[index].classList.add('on');
                index = (index + 1) % liLength; // 인덱스 증가, 마지막 슬라이드 이후에 첫 번째 슬라이드로 돌아가도록
            }

            setInterval(updateSlider, 3000);
        } else {
            console.error("No slide elements found for this slider."); // 슬라이드 요소가 없을 때 경고를 출력합니다.
        }
    });
    

    
});




</script>





