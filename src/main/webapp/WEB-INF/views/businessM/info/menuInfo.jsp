<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메뉴정보 확인 메뉴입니다</h1>
	<button onclick="parent.changeParentUrl('http://localhost:8080/root/businessM/menu/menuRegister')">메뉴 등록 하기</button><br>
	
	<script>
	for (let i = 1; i <= 200; i++) {
	    document.write(i + "<br>");
	}
</script>
</body>
</html>