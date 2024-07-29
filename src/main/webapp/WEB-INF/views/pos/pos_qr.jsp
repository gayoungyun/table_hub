<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.body {
		width: 100vw;
		height: 100vh;
		margin: 0;
		
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	.circle {
		display: flex;
		justify-content: center;
		align-items: center;
		
		border-radius: 50%;
		width: 500px;
		height: 500px;
		background: #191E36;
	}
	.number {
		color: #FF9616;
		font-size: 200px;
	}
	.wait {
		font-size: 70px;
	}
	.title_p {
		font-size: 70px;
	}
</style>
</head>
<body class="body">
	<p class="title_p"></p>
	<p class="wait">현재 입장번호</p>
	<div class="circle">
		<span class="number"></span>	
	</div>
</body>

<script type="text/javascript">

	function ready() 
	{
		const title_p = document.querySelector(".title_p");
		title_p.innerText = '${store_name}';
		
		fetch("/root/api/nowWaitNum", {
			headers : {"Content-Type": "application/json",
						"store_id" : '${store_id}'},
		})
		.then((response) => response.json())
		.then((data) => {
			console.log(data);
			const number = document.querySelector('.number');
			number.innerText = data;
		})			
		
	}
	document.addEventListener("DOMContentLoaded", ready);
	
</script>
</html>
