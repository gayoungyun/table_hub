<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.flex-container{
		padding:10px;
		background:lightgray;
		display:flex;
		<!-- justify-content:space-between; -->
		height:100vh;
	}
	.flex-item{
		padding:10px;
		border:3px solid rgb(50,50,40);
		color:white;
		background:green;

	}
	.flex-item:nth-child(1){
		<!--flex:1; 1 1 0 / width:20%-->
		flex-shrink:0;
		width:150px;
	}
	.flex-item:nth-child(2){
		<!--flex:3; 3 1 0 / width:60%-->
		flex-grow:1;
	}
	.flex-item:last-child{
		<!-- flex:1;-->
		<!-- margin-left:auto; -->
		flex-shrink:0;
		width:200px;
	}
</style>
</head>
<body>
	<div class="flex-container">
		<div class="flex-item">AAAAAAAAaAaaaaaaaaaaaaaaaaaaaaa</div>
		<div class="flex-item">BBbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb</div>
		<div class="flex-item">CCCCcccccccccccccccccccccccc</div>
	</div>
</body>
</html>