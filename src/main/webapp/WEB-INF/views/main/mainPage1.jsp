<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		#top-menu { 
			display:inline-block; 
			height : 30%;
			width : 100%;
			align-items:center;
			vertical-align:middle;<!--세로 정렬을 가운데로 설정-->
			text-align:center;
			}
		#top-menu ul li{ 
			list-style : none;<!--목록을 나타내는 점을 없앰-->

			}
		#top-menu .menu-link-left{
			text-decoration:none;
			display:block;
			width:150px;
			font-weight:bold;
			color:gray;
			font-size:12px;
			float:left;
			text-align:left;
			vertical-align:middle;<!--세로 정렬을 가운데로 설정-->
		}
		#top-menu .menu-link-right{
			text-decoration:none;
			display:block;
			width:150px;
			font-weight:bold;
			color:gray;
			font-size:12px;
			float:right;
			text-align:right;
			vertical-align:middle;<!--세로 정렬을 가운데로 설정-->
		}
		#top-menu .menu-title{
			text-decoration:none;
			display:block;
			width:150px;
			font-weight:bold;
			color:black;
			font-size:50px;
			text-align:center;
		}
	</style>
</head>
<body>
	<div id="top-menu" align="center">
		<ul>
			<li>
				<a class="menu-link-left" href="#">Tag1</a>
			</li>
			<li>
				<a class="menu-link-left" href="#">Tag2</a>
			</li>
			<li>
				<a class="menu-title" href="#">Table HUB</a>
			</li>
			<li>
				<a class="menu-link-right" href="#">Tag3</a>
			</li>
			<li>
				<a class="menu-link-right" href="#">Tag4</a>
			</li>
		</ul>
	</div>
</body>
</html>