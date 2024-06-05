<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
 <%@ include file="./header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>

<style type="text/css">
	.page{
		display:flex;
		flex-direction:column;
		min-height: 100vh;
	}
	.content1{
		flex:1;
		padding:2.5rem;
		position: relative;
		height: 80vh;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.main-img{
		flex:1;
		padding:6.5rem;
		position: relative;
		width: 100%;
		height: 80vh;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.main-img div{
		width: 100%;
		height: 100%;
		object-fit: contain;
	}
	.main-img div img {
		width: 100%;
		height: 100%;
		object-fit: contain;
	}
	.intro-hub{
		dispaly:flex;
		justify-content: center;
		align-items: center;
		text-align: center;
	}
	.first-line {
		text-align: center;
		font-size: 30px;
		font-family: "Love Ya Like A Sister",cursive;
	}
	.rest-line {
		text-align: center;
		font-size: 20px;
		margin-top: -40px;
		font-family: "Love Ya Like A Sister",cursive;
	}
	.content2{

		padding:9.5rem;
		height: 80vh;
		display: flex;
		justify-content: center;
        align-items: center;
	}
	.menu-img { 
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: space-between;
	}
	.food-img {
		width: 30%;
		text-align: center;
		display: flex;
		flex-direction: column;
		align-items: center;
		text-decoration: none;
		float: left;
		height: 60%;
	}
	.food-img img {
		width: 100%;
		height: 60%;
		object-fit: contain;
	}
	.food-tagname{
		margin-top: 10px;
	}
</style>
</head>
<body>
	<div class="page">
		<div class="content1">
			<div class="main-img">
				<div>
					<img src="${path}/resources/img/main/맛집02.jpg">
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
					<a href="#" class="food-img">
						<img src="${path}/resources/img/main/맛집03.jpg" width="225"><br>
						<div class="food-tagname">
							#한식 
							<button type="button">자세히보기</button>
						</div>
					</a>
					<a href="#" class="food-img">
						<img src="${path}/resources/img/main/맛집04.jpg" width="225"><br>
						<div class="food-tagname">
							#일식
							<button type="button">자세히보기</button>
						</div>
					</a>
					<a href="#" class="food-img">
						<img src="${path}/resources/img/main/맛집05.jpg" width="225"><br>
						<div class="food-tagname">
							#양식 
							<button type="button">자세히보기</button>
						</div>
					</a>
				</div>
			</div>
	</div>
<%@ include file="./footer.jsp" %>
</body>
</html>







