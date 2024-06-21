<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.search-form{
		display: flex;
		height: 40px;
	}
	.search-form input[type='search']{
		flex:1;
		border:0;
		border-radius: 0.3em;
		font-size: 1rem;
		margin-right:10px;
	}
	.search-form input[type='submit']{
		border:0;
		border-radius: 0.3em;
		font-size: 1rem;
		background: gold;
		width: 4em;
	}
</style>
</head>
<body>
	<form class="search-form">
		<input type="search">
		<input type="submit" value="찾기">
	</form>
</body>
</html>