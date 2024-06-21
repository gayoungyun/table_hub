<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html, body {
	width: 100vw;
	height: 100vh;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
}

.main_wrapper {
	display: flex;
	justify-content:center;
	width : 80vw;
	height: 90vh;
	width: 80vw;
}

.left_body {
	display: inline-block;
	width: 49.5%;
	height: 100%;
}

.right_body {
	display: inline-block;
	width: 49.5%;
	height: 100%;
}
</style>

</head>
<body>
	<div class="main_wrapper">
		<div class="left_body"></div>
		<div class="right_body"></div>
	</div>
</body>
</html>