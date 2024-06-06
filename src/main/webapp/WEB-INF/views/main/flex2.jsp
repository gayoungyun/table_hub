<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menu{
		display: flex;
	}
	.menu-item{
		width:25%;
		background:gold;
		transition: 0.5s;
	}
	.menu-item:hover{
		width: 35%;
		background: crimson;
	}
	.menu-link{
		display: block;
		padding: 1em;
		font-size: 1.2rem;
		font-weight: bold;
		color: #555;
		text-decoration:none;
		text-align: center;
	}
	.menu-link:hover{
		color: white;
	}
</style>
</head>
<body>
	<ul class="menu">
		<li class="menu-item">
			<a href="#" class="menu-link">Home</a>
		</li>
		<li class="menu-item">
			<a href="#" class="menu-link">About</a>
		</li>
		<li class="menu-item">
			<a href="#" class="menu-link">Product</a>
		</li>
		<li class="menu-item">
			<a href="#" class="menu-link">Contact</a>
		</li>
	</ul>
</body>
</html>