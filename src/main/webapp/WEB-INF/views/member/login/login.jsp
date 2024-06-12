<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<%= request.getContextPath() %>/resources/css/member/login.css?after" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->

<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		const cook = "${userId}";
		if (cook != "") {
			location.href="/root";
		}
	});

	function loginChk() {
		let inputId = $("#inputId").val();
		let inputPwd = $("#inputPwd").val();
		if (inputId == "") {
			$("#infoMsg").html( "아이디를 입력해주세요" );
			$("#infoMsg").css("color", "#ff6868")
			$("#inputId").focus();
		} else if (inputPwd == "") {
			$("#infoMsg").html( "비밀번호를 입력해주세요" );
			$("#infoMsg").css("color", "#ff6868")
			$("#inputPwd").focus();
		} else {
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
	}
	
	function sendMail() {
		let local = $("#emailLocal").val();
		$("#codeSendBtn").prop("disabled", true);
		var koreanPattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if (local == "") {
			$("#emailInfoMsg").html("이메일 주소를 입력해주세요");
			$("#emailInfoMsg").css("color", "#ff6868")
			$("#emailLocal").focus();
			$("#codeSendBtn").prop("disabled", false);
		} else if (koreanPattern.test(local)) {
			$("#emailInfoMsg").html( "한글은 입력할 수 없습니다." );
			$("#emailInfoMsg").css("color", "#ff6868")
			$("#codeSendBtn").prop("disabled", false);
		} else {
			let email = $("#emailLocal").val() + "@" + $("#emailDomain").val(); 
			let form = {email : email};
			$.ajax({
				url : "sendMail",
				type : "post",
				data : JSON.stringify(form),
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function ( result ) {
					$("#emailInfoMsg").html( result.msg );
					if (result.result == 0) {
						$("#emailInfoMsg").css("color", "#6262ff")
						$("#codeSendBtn").prop("disabled", true);
					} else {
						$("#emailInfoMsg").css("color", "#ff6868")
						$("#codeSendBtn").prop("disabled", false);
					}
				},
				error : function () {
					alert("문제 발생!!!")
				}
			})
		}
	}
	$(document).ready( () => {
		$("#authCode").on("input", function() {
			console.log('asdf')
			let authCode = $("#authCode").val();
			console.log(authCode.length)
			if (authCode.length >= 4) {
				console.log('test')
				$("#registerBtn").focus();
				$(this).val($(this).val().substring(0, 4));
			}
		});
	})
	
	function register() {
		if ($("#codeSendBtn").prop("disabled")) {
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
							$("#registerBtnInfoMsg").html( "코드가 올바르지 않습니다." );
							$("#registerBtnInfoMsg").css("color", "#ff6868")
						}
				},
				error : function () {
					alert("문제 발생!!!")
				}
			})
		} else {
			$("#registerBtnInfoMsg").html("이메일 인증을 진행하여 인증코드를 입력해주세요")
			$("#registerBtnInfoMsg").css("color", "#ff6868")
		}

	}
		

</script>
<%@ include file="../../mainPage.jsp" %>

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
				<input id="loginBtn" type="button" onclick="loginChk()" value="로그인">
			</div>
			<hr width="350" class="fieldHr"><br>
			<h2>SNS로 시작하기</h2><br><br>
			<div id="naver_id_login">
				
			</div>
			<div id="kakao_id_login">
				<img width="200" alt="" src="">
			</div>
		</div>
		<div id="registerWrapper">
			<h1>회원가입</h1>
			<div id="registerField">
				<h2>이메일 인증</h2>
				<input type="text" placeholder="이메일 주소 입력" id="emailLocal">
				<b style="font-size:20px;">@</b>
				<select id="emailDomain">
					<option>naver.com
					<option>daum.net
					<option>gmail.com
				</select><br>
				<input type="button" value="인증코드 전송" onclick="sendMail()" id="codeSendBtn">
				<div id="emailInfoMsg"></div>
				<input type="number" id="authCode" placeholder="인증코드 입력">
				<input type="button" value="회원 가입" onclick="register()"  id="registerBtn">
				<p id="registerBtnInfoMsg"></p>
			</div>
				<hr width="350" class="fieldHr"><br>
				<h2>사업자 계정 등록</h2><br><br>
				<div id="storeRegisterInfoMsg">
					<label>
						<b>* 사업자 계정 등록이 필요하신분은 <br>
						<a href="/root/store/test">링크</a>
						를 클릭하여 등록을 진행해주세요.
						</b>
					</label>
				</div>
				<br><br><br>
		</div>
	</div>
 <script type="text/javascript">
	var naver_id_login = new naver_id_login("NY8JwdpMRrDBs7eqhg8A", "http://localhost:8080/root/member/registerNaver");
  	var state = naver_id_login.getUniqState();
//   	naver_id_login.setButton("white", 3,40);
  	naver_id_login.setDomain("http://localhost:8080/root/member/login");
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();
  	
  	$("#naver_id_login_anchor").find("img").attr("src", "<c:url value='/resources/img/naver.png' />");
  	$("#naver_id_login_anchor").find("img").attr("width", "200");
  	$("#naver_id_login_anchor").find("img").attr("height", "53.33");
  	$("#kakao_id_login").find("img").attr("src", "<c:url value='/resources/img/kakao.png' />");
  	
</script>
</body>
</html>