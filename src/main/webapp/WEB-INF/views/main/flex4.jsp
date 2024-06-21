<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.info-list-item{
		margin: 0.5em 0;
		display: flex;
	}
	.info-list-item:before{
		content: '😍';
		margin-right: 0.5em;
	}
	<!-- message -->
	.user-item{
		display: flex;
		margin-bottom : 1.5em;
	}
	.user-photo {
		flex-shrink: 0;
		width: 50px;
		height: 50px;
		margin-right: 0.5em;
		border: 2px solid #333;
		border-radius: 50%;
		background-color: gold;
		background-repeat: no-repeat;
		background-position: center;
		background-size: 150%;
	}
	.friend-item{
		align-item:center;
	}
	.user-name{
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
</style>
</head>
<body>
	<ul class="info-list">
		<li class="info-list-item">
			안녕 왜 영어로 늘이면 오류가 뜨는거지?
			그냥 아무말도 못쓰나?
			귀찮네 길게쓰기 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
			ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
		</li>
		<li class="info-list-item">
			한글은 되는구나?ㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂ
			ㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍ
			ㅠㅠㅠ
			
		</li>
		<li class="info-list-item">
			이 저녁에 이걸하는게 귀찮구나
			왜 오류나지? 
			</>이부분에서 오류가 나는데 왜지?
		</li>
	</ul>
	<ul class="user-list friend-list">
		<li class="user-item friend-item">
			<figure class="user-photo" 
			style="background-image: url('resources/img/main/맛집05.jpg');">
			</figure>
			<p class="user-name">
				안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 
			</p>
		</li>
		<li class="user-item friend-item">
			<figure class="user-photo" 
			style="background-image: url('resources/img/main/맛집05.jpg');">
			</figure>
			<p class="user-name">
				안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 
			</p>
		</li>
		<li class="user-item friend-item">
			<figure class="user-photo" 
			style="background-image: url('resources/img/main/맛집05.jpg');">
			</figure>
			<p class="user-name">
				안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 
			</p>
		</li>
	</ul>
</body>
</html>



