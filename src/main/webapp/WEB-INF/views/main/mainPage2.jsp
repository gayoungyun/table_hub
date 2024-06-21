<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script  type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main/image_slide.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3/dist/js/splide.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
 
 <%@ include file="./header.jsp" %>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Black+Han+Sans:400')

	.page{
		display:flex;
		flex-direction:column;
		min-height: 100vh;
	}
	.page{
		display:flex;
		flex-direction:column;
		min-height: 100vh;
	}
	.main-container{
		display: flex;
		flex:1;
		position: relative;
		height: 80vh;
		justify-content: center;
		padding:7rem;
		width: 100%;
	}
	
	/* left side store menu detail */
	
	/* left side ===== navbar */
	.main-items{
		display: flex;
		flex-grow: 1;
		height: 100%;
		flex-direction: column;
	}
	.left-item{
		flex-basis: 70%;
		max-width: 50%;
		height: 100%;
		display: flex;
	    flex-direction: column;
	}
	.nav-container{
		display: flex;
		flex-direction: row;
		width: 100%;
		margin-bottom: 20px;
	}
	.nav-main{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-right: 70px;
		padding: 10px;
		width: calc(50% - 35px);
		height: 35px;
		border-radius: 10px;
		background: black;
		color: white;
	}
	.nav-item{
		margin: 0 20px;
		padding: 10px 20px;
		backgroud-color: black;
		font-size: 20px;
		font-family: 'Black Han Sans', sans-serif;
	}
	/* left side ===== navbar end */
	
	/* left side ===== db span */
	.location-condition{
		display: flex;
		justify-content: space-between;
		width: 100%;
		margin-top: 20px;
	}
	.location-condition span:last-child{
		margin-right: 80px;
	}
	/* left side ===== db span end */
	
	/* left side ===== detail view */
	.menu-detail{
		max-width: 60%;
		display: flex;
		flex-grow: 1;
		/* height: 500px; */
		flex-direction: row;
		position: relative;
		width: 100%;
		padding-top: 10%;
	}
	.detail-container-left{
		display: flex;
		flex-direction: column;
		width: 1200px;
	}
	.menu-detail-imgBig{
		display: flex;
		flex: 1;
		width: 100%;
		height: 100%;
		position: relative;
		margin-bottom: 10px;
	}
	.imgBig{
		max-width: 450px;
		max-height: 100%;
		/* object-fit: contain; */
	}
	.menu-detail-imgSmall{
		display: flex;
		justify-content: space-between;
		width: 100%;
	}
	.imgSmall1, .imgSmall2, .imgSmall3{
		width: 32%;
		/* height: 100px; */
		height: auto;
		background-color: #f0f0f0;
		display: flex;
		align-items: center;
		justify-content:center;
	}
	.imgSmall{
		width: 100%;
		height: 100%;
		object-position: fill;
	}
	.detail-container-right{
		display: flex;
		width: 70%;
		/* margin-right: 90px; */
		flex-direction: column;
		word-wrap: break-word;
		margin-left: 20px;
	}
	
	
	/* left side ===== detail view end */
	
	/* left side store menu detail end */
	
	/* right side store menu map */
	
	.right-itme{
		flex-basis: 30%;
		max-width: 50%;
		/* position: sticky; */
	}
	.map-api{
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
	}
	.map-img{
		width: 80%;
		height: 100%;
	}
	
	/* right side store menu map end */
	
</style>
</head>
<body>
	<div class="page">
		<div class="main-container">
			<!-- ===== left side ===== -->
			<div class="main-items left-item">
				
				<!-- ===== navbar ===== -->
				<div class="nav-container">
					<nav class="nav-main">
						<div class="nav-item">인기순(평점)</div>
					</nav>
					<nav class="nav-main">
						<div class="nav-item">리뷰많은순</div>
					</nav>
				</div>
				
				<!-- ===== 위치가져오기, 상세보기 부분 ===== -->
				<div class="location-condition">
					<span>서울 종로구 계동 #한식</span>
					<span>상세조건</span>
				</div>
				
				<!-- ===== 메뉴 상세보기 부분 ===== -->
				<div class="menu-detail">
					<div class="detail-container-left">
						<div class="menu-detail-imgBig">
							<img class="imgBig" src="${path }/resources/img/main/car01.png">
						</div>
						<div class="menu-detail-imgSmall">
							<div class="imgSmall1">
								<img class="imgSmall" src="${path }/resources/img/main/맛집01.jpg">
							</div>
							<div class="imgSmall2">
								<img class="imgSmall" src="${path }/resources/img/main/맛집02.jpg">
							</div>
							<div class="imgSmall3">
								<img class="imgSmall" src="${path }/resources/img/main/맛집03.jpg">
							</div>
						</div>
					</div>
					<div class="detail-container-right">
						<span>음식이름aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbb
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaa</span>
					</div>
				</div>
			
			
				<div class="menu-detail">
					<div class="detail-container-left">
						<div class="menu-detail-imgBig">
							<img class="imgBig" src="${path }/resources/img/main/car01.png">
						</div>
						<div class="menu-detail-imgSmall">
							<div class="imgSmall1">
								<img class="imgSmall" src="${path }/resources/img/main/맛집01.jpg">
							</div>
							<div class="imgSmall2">
								<img class="imgSmall" src="${path }/resources/img/main/맛집02.jpg">
							</div>
							<div class="imgSmall3">
								<img class="imgSmall" src="${path }/resources/img/main/맛집03.jpg">
							</div>
						</div>
					</div>
					<div class="detail-container-right">
						<span>음식이름aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbb
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaa</span>
					</div>
				</div>
			
				<div class="menu-detail">
					<div class="detail-container-left">
						<div class="menu-detail-imgBig">
							<img class="imgBig" src="${path }/resources/img/main/car01.png">
						</div>
						<div class="menu-detail-imgSmall">
							<div class="imgSmall1">
								<img class="imgSmall" src="${path }/resources/img/main/맛집01.jpg">
							</div>
							<div class="imgSmall2">
								<img class="imgSmall" src="${path }/resources/img/main/맛집02.jpg">
							</div>
							<div class="imgSmall3">
								<img class="imgSmall" src="${path }/resources/img/main/맛집03.jpg">
							</div>
						</div>
					</div>
					<div class="detail-container-right">
						<span>음식이름aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbb
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaa</span>
					</div>
				</div>
			</div>
			
			<!-- right side -->
			<div class="main-items right-itme">
				<div id="map" class="map-api">
					<img class="map-img" src="${path}/resources/img/main/map.png">
				</div>
			</div>
		</div>
	</div>
</body>
 <%@ include file="./footer.jsp" %> 
</html>






