<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/member/info/common.css?after" rel="stylesheet"/>
<link href="<%= request.getContextPath() %>/resources/css/member/info/deleteUser.css?after" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready( () => {
		$("#deleteUser").css("font-weight", "bold");
		$("#deleteUser").css("border-bottom", "2px solid #006ad5")
		$("#deleteUser").css("margin-bottom", "6px")
		
		$(document).ready( () => {
			
			$("#pwdCheckBtn").on("click", function() {
				let inputPwd = $("#inputPwd").val();
				console.log("inputPwd : ", inputPwd)
				$.ajax( {
					url : "pwdCheck",
					type : "get",
					data : {
						inputPwd : inputPwd
					},
					dataType : 'json',
// 					contentType : "application/json; charset=utf-8",
					success : function ( data ) {
// 						console.log("data : ", data)
						let result = confirm("정말 회원탈퇴를 하시겠습니까?\n회원탈퇴시 복구가 되지 않으며 기존 정보도 함께 삭제됩니다.\n회원탈퇴를 원하시면 확인을 선택해주세요")
						if (result) {
							if ( data.result == 1 ) {
								$.ajax({
									url : "deleteUser",
									type : "delete",
									dataType : "json",
									success : function (data2) {
										if (data2.result == 1) {
											$("#pwdInfoMsg").html(data2.msg);
											alert(data2.msg);
											location.href=data2.url
										} else {
										}
									}, 
									error : function (error) {
										
									}
								})
							} else {
								$("#pwdInfoMsg").html(data.msg);
							}
						}
					},
					error : function (error) {
						console.log("asdfasdfasdfasdf")
						
					}
					
				})
			})
		})
		
	})


</script>

<%@ include file="../../main/header.jsp" %>
</head>
<body>
	<div id="myPageWrapper">
		<%@ include file="./myPageMenu.jsp" %>
		<div id="myPagePwdCheckWrapper">
			<label class="myPwdCheckInfo">회원탈퇴시 복구가 불가능합니다.<br>회원정보 확인을 위해 패스워드를 입력해주세요</label>
			<table id="pwdCheckTable" border="1px">
				<tr>
					<th class="tableContent">비밀번호 입력</th>
					<td class="tableContent">
						<input type="password" class="inputText" id="inputPwd"><br>
						<label id="pwdInfoMsg"></label>
					</td>
				</tr>
			</table>
			<input id="pwdCheckBtn" type="button" value="비밀번호 확인">
		</div>
	</div>
</body>
<%@ include file="../../main/footer.jsp" %>
</html>