<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/member/registerUser.css" rel="stylesheet"/>

<link href="<%= request.getContextPath() %>/resources/css/member/registerUser.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div id="bodyWrapper">
		<div id="registerInputWrapper">
			<h1>회원 정보 입력</h1>
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" oninput="idChk()" id="inputId" placeholder="아이디를 입력해주세요">
						<p id="idInfoMsg">asdfasdfasdf</p>
					</td>		
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="nick" oninput="nickChk()" id="inputNick" placeholder="닉네임을 입력해주세요">
						<p id="nickInfoMsg">asdfasdfasdf</p>
					</td>		
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" oninput="pwdChk()" id="inputPwd" placeholder="패스워드를 입력해주세요">
						<p id="pwdInfoMsg">asdfasdfasdf</p>
					</td>		
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="pwdChk" oninput="pwdChk()" id="inputPwdChk" placeholder="패스워드를 다시 한번 입력해주세요">
						<p id="pwdChkInfoMsg">asdfasdfasdf</p>
					</td>		
				</tr>
				<tr>
					<th hidden="true">이메일</th>
					<td hidden="true">
						<input hidden="true" type="text" value="${email }" name="email" disabled>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<select id="phoneCode">
							<option>010
						</select>
						<b>-</b>
						<input type="number" name="phone1" id="phone1">
						<b>-</b>
						<input type="number" name="phone2" id="phone2">
						<input type="button" value="인증코드 전송" onclick="sendMessage()">
						<p id="phoneInfoMsg">asdfasdfasdf</p>
					</td>		
				</tr>
				<tr>
					<th>전화번호 인증</th>
					<td>
						<input type="number" placeholder="인증번호를 입력해주세요" id="inputCode">
						<input type="button" disabled id="codeChkBtn" value="인증" onclick="codeChk()">
						<p id="phoneChkInfoMsg">asdfasdfasdf</p>
					</td>		
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<select id="year">
							<% 
							int year = Calendar.getInstance().get(Calendar.YEAR);
							for (int i = year; i >= 1900; i--) { %> 
									<option><% out.println(i); %>
							<% } %>		
						</select>
						<b>년</b>
						
						<select id="month">
							<% for (int i = 1; i <= 12; i++) { %>
									<option><% out.println(i); %>
							<% } %>
						</select>
						
						<b>월</b>
						
						<select id="day">
							<% int day = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH); 
								for (int i = 1; i <= 31; i++) { %>
									<option><% out.println(i); %>
							<% } %>
						</select>
						<b>일</b>
					</td>		
				</tr>
				<tr>
					<th>성별</th>
					<td>	
						<input type="radio" name="gender" value="남" id="radioMan" hidden>
						<input type="radio" name="gender" value="여" id="radioWoman" hidden>
						<input type="button" name="gender" value="남" id="genderMan">
						<input type="button" name="gender" value="여" id="genderWoman">
					</td>		
				</tr>
				<tr>
					<td><input type="button" value="회원가입" id="registerBtn" onclick="register()" disabled>
				</tr>
			</table>
		</div>
	</div>


	

	
	
	
	
	
	<script type="text/javascript">

		let idPass = false;
		let pwdPass = false;
		let nickPass = false;
		let phonePass = false;
		
		
		idChk = () => {
			let inputId = $("#inputId").val();
			let form = {id : inputId};
			if (inputId.length < 3) {
				$("#idInfoMsg").html("3자 이상 입력해주세요")
				idPass = false;
			} else {
				$.ajax({
					url : "idChk?id="+inputId,
					type : "get",
					dataType : "text",
					contentType : "application/json; charset=utf-8",
					success : function ( result ) {
						if (result == 0) {
							$("#idInfoMsg").html("사용 가능한 아이디 입니다.");
							idPass = true;
						} else {
							$("#idInfoMsg").html("중복되는 아이디 입니다. 다른 아이디를 입력해주세요");
							idPass = false;
						}
					},
					error : function (e) {
						console.log("문제 발생!!!")
						console.log(e)
					}
				}).then( () => {
					registerChk();
				})
				return;
			}
			registerChk();
		}
		
		register = () => {
			console.log("asdf")
		}
		
		nickChk = () => {
			let inputNick = $("#inputNick").val();
			let form = {nick : inputNick};
			if (inputNick.length < 2) {
				$("#nickInfoMsg").html("2자 이상 입력해주세요")
				nickPass = false;
			} else {
				$.ajax({
					url : "nickChk?nick="+inputNick,
					type : "get",
					dataType : "text",
					contentType : "application/json; charset=utf-8",
					success : function ( result ) {
						if (result == 0) {
							$("#nickInfoMsg").html("사용 가능한 닉네임 입니다.");
							nickPass = true;
						} else {
							$("#nickInfoMsg").html("중복되는 닉네임 입니다. 다른 닉네임을 입력해주세요");
							nickPass = false;
						}
					},
					error : function (e) {
						console.log("문제 발생!!!")
						console.log(e)
					}
				}).then( () => {
					registerChk();				
				})
				return;
			}
			registerChk();
		}
		
		pwdChk = () => {
			const pwd = $("#inputPwd").val();
			const pwdChk = $("#inputPwdChk").val();
			const regex1 = /[^a-zA-Z0-9\s]/;
			const regex2 = /[A-Z]/;
			if (pwd.length < 6) {
				$("#pwdInfoMsg").html("6자 이상 입력하세요")
				pwdPass = false;
			}else {
				if (regex1.test(pwd) && regex2.test(pwd)) {
					$("#pwdInfoMsg").html("사용 가능한 패스워드 입니다.")
					if (pwd == pwdChk) {
						$("#pwdChkInfoMsg").html("같다")
						pwdPass = true;
					} else {
						$("#pwdChkInfoMsg").html("다르다")
						pwdPass = false;
					}
				} else {
					if (regex1.test(pwd)) {
						$("#pwdInfoMsg").html("대문자 필요")
						pwdPass = false;
					} else if (regex2.test(pwd)){
						$("#pwdInfoMsg").html("특수문자 필요")
						pwdPass = false;
					} else if (!regex1.test(pwd) || !regex2.test(pwd)){
						$("#pwdInfoMsg").html("특수문자 대문자 필요")
						pwdPass = false;
					}
				}
			}
			registerChk();
		}
		
		sendMessage = () => {
			const phoneCode = $("#phoneCode").val()
			const phone1 = $("#phone1").val()
			const phone2 = $("#phone2").val()
			const phone = phoneCode + phone1 + phone2
			let form = {phoneNumber : phone}
			$.ajax({
				url : "sendMessage",
				type : "post",
				data : JSON.stringify(form),
				dataType : "text",
				contentType : "application/json; charset=utf-8",
				success : function ( result ) {
					$("#phoneInfoMsg").html(result);
					$("#codeChkBtn").prop("disabled", false)
					
				},
				error : function (e) {
					console.log("문제 발생!!!")
				}
			})
		}
		
		codeChk = () => {
			let inputCode = $("#inputCode").val()
			let form = {inputCode : inputCode}
			$.ajax({
				url : "codeChk",
				type : "post",
				data : JSON.stringify(form),
				dataType : "text",
				contentType : "application/json; charset=utf-8",
				success : function ( result ) {
					if (result == 1) {
						$("#phoneChkInfoMsg").html("인증되었습니다.");
						phonePass = true;
					} else {
						$("#phoneChkInfoMsg").html("인증코드를 확인해주세요");
						phonePass = false;
					}
				},
				error : function (e) {
					console.log("문제 발생!!!")
				}
			}).then( () => {
				registerChk();				
			})
		}
		
		$("#genderMan").click( () => {
			var man = document.getElementById("genderMan");
			var woman = document.getElementById("genderWoman");
			$("#radioMan").click();
			man.style.backgroundColor = "#8d8d8d";
			woman.style.backgroundColor = "#c0c0c0";
		})
		$("#genderWoman").click( () => {
			var man = document.getElementById("genderMan");
			var woman = document.getElementById("genderWoman");
			$("#radioWoman").click();
			man.style.backgroundColor = "#c0c0c0";
			woman.style.backgroundColor = "#8d8d8d";
		})
	
		$("#month").change( () => {
			const month = $("#month").val();
			const year = $("#year").val();
			console.log(new Date(new Date(year, month) - 1))
			const day = new Date(new Date(year, month, 1) - 1).getDate()
			var html = null;
			
			for (let i = 1; i <= day; i++) {
				html += "<option>" + i;
			}
			$("#day").html(html);
			
		})
		$("#year").change( () => {
			const month = $("#month").val();
			const year = $("#year").val();
			console.log(new Date(new Date(year, month) - 1))
			const day = new Date(new Date(year, month, 1) - 1).getDate()
			var html = null;
			
			for (let i = 1; i <= day; i++) {
				html += "<option>" + i;
			}
			$("#day").html(html);
			
		})
		
		registerChk = () => {
			console.log(idPass)
			console.log(pwdPass)
			console.log(nickPass)
			console.log(phonePass)
			if (idPass && pwdPass && nickPass && phonePass) {
				$("#registerBtn").prop("disabled", false)
			} else {
				$("#registerBtn").prop("disabled", true)
			}
			
		}
		
		$("#genderMan").click();
	</script>
</body>
</html>