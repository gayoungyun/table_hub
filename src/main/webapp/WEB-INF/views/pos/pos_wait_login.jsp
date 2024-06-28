<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/pos/wait_login.css" rel="stylesheet">
<style type="text/css">

* {
	margin: 0;
	padding: 0;
}

.wait_login_wrapper {
	width: 100vw;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #191E36;
}

#input_key {
	font-size: 19px;
	background-color: #FFFBF4;
	border: none;
	border-bottom: solid #aaaaaa 1px;
	width: 300px;
	height: 35px;
	
	margin-bottom: 55px;
	border-radius: 10px;	
}

#input_key::placeholder {
	color: #D2D2D2;
}

.label_key {
	font-weight: bold;
	font-size: 30px;
	font-family: "Moi";
	color: white;
}
</style>

</head>
<body id="body">
	<div class="wait_login_wrapper">
		<div class="form_wrapper">
			<form method="post" action="<%=request.getContextPath()%>/pos/wait_keyCheck">
				<label for="input_key" class="label_key">발급받은 키 입력</label><br>
				<input type="text" id="input_key" name="key" placeholder="키 입력">
				<button type="submit">로그인</button> 
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	
</script>
</html>