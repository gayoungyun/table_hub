<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<%= request.getContextPath() %>/resources/css/member/login.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		const cook = "${userId}";
		console.log("cook : " , cook)
		console.log("1:", cook == "")
		if (cook != "") {
			location.href="/root";
		}
	});

	function loginChk() {
		let inputId = $("#inputId").val();
		let inputPwd = $("#inputPwd").val();
		let form = {id : inputId, pwd : inputPwd};
		$.ajax({
			url : "loginChk",
			type : "post",
			data : JSON.stringify(form),
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function ( result ) {
				if (result.result == null) {
					location.href="/root"
				} else {
					$("#infoMsg").html( result.result );					
				}
			},
			error : function () {
				alert("문제 발생!!!")
			}
		})
	}
	
	function sendMail() {
		let email = $("#emailLocal").val() + "@" + $("#emailDomain").val(); 
		let form = {email : email};
		$.ajax({
			url : "sendMail",
			type : "post",
			data : JSON.stringify(form),
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function ( result ) {
					$("#emailInfoMsg").html( result.result );
// 					$("#codeSendBtn").prop("disabled", true);
			},
			error : function () {
				alert("문제 발생!!!")
			}
		})
	}
	
	function register() {
// 		console.log($("#codeSendBtn").prop("disabled"))
// 		if ($("#codeSendBtn").prop("disabled")) {
			$("#registerBtnInfoMsg").html("")
			let code = $("#authCode").val()
			let form = {code : code};
			$.ajax({
				url : "register",
				type : "post",
				data : JSON.stringify(form),
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function ( result ) {
					console.log("result : ", result.result)
						if (result.result == 1) {
							location.href="registerUser"
						} else {
							$("#emailInfoMsg").html( "코드가 올바르지 않습니다." );
						}
				},
				error : function () {
					alert("문제 발생!!!")
				}
			})
// 		} else {
// 			$("#registerBtnInfoMsg").html("이메일 인증을 진행하여 인증코드를 입력해주세요")
// 		}

	}
		

</script>

</head>
<body>

	<div id="bodyWrapper">
		<div id="loginWrapper">
			<h1>회원 로그인</h1>
			<div id="inputField">
				<h2>아이디</h2>
				<input type="text" id="inputId" name="id" placeholder="아이디를 입력하세요">
				<h2>비밀번호</h2>
				<input type="password" id="inputPwd" name="pwd" placeholder="비밀번호를 입력하세요">
				<div id="infoMsg"></div>
			</div>
			<input id="loginBtn" type="button" onclick="loginChk()" value="로그인">
		</div>
		<div id="registerWrapper">
			<h1>회원가입</h1>
			<div id="inputField">
				<input type="text" placeholder="이메일 주소 입력" id="emailLocal">
				<b>@</b>
				<select id="emailDomain">
					<option>naver.com
					<option>daum.net
					<option>google.com
				</select>
				<input type="button" value="인증코드 전송" onclick="sendMail()" id="codeSendBtn">
				<br>
				<br>
				<div id="emailInfoMsg"></div>
				<input type="text" id="authCode" placeholder="인증코드 입력">
				<br>
				<br>
				<input type="button" value="회원 가입" onclick="register()"  id="registerBtn">
				<p id="registerBtnInfoMsg"></p>
				<hr>
				<br><br>
				<div id="naver_id_login">
				</div>
			</div>
		</div>
	</div>
 <script type="text/javascript">
  	var naver_id_login = new naver_id_login("NY8JwdpMRrDBs7eqhg8A", "http://localhost:8080/root/member/registerNaver");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 3,40);
  	naver_id_login.setDomain("http://localhost:8080/root/member/login");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
</script>
</body>
</html>