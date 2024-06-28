<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="<%=request.getContextPath()%>/resources/css/pos/setting.css?after"
	rel="stylesheet">
<style type="text/css">
#setting_body {
	background-color: #FFFBF4;
	position: relative;
}

.modal{
  position:absolute;
  display:none;
  
  justify-content: center;
  top:0;
  left:0;

  width:100vw;
  height:100vh;

  background-color: rgba(0,0,0,0.4);
}
.modal_body{
  position:absolute;
  top:50%;  

  width:400px;  
  height:600px; 

  padding:40px;  

  background-color: rgb(255,255,255); 
  border-radius:10px;  
  box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); 

  transform:translateY(-50%);  
}
.tbModal {
  width: 400px;
}

.main_wrapper {
	height: 100%;
	display: flex;
	justify-content: center;
}

.left_sidebar {
	background-color: #D9D9D9;
	height: 100%;
	width: 161px;
	display: flex;
	flex-direction: column;
}

.right_sidebar {
	width: 70%;
	display: flex;
	justify-content: flex-start;
}

.set_store_setting {
	display: none;
	flex-direction: column;
}

.tab {
	width: 141px;
	height: 50px;
	margin-bottom: 3px;
	padding: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.common_wrapper {
	margin: 20px 0 0 40px;
}

.modal_header {
	width: 100%;
	display: flex;
	justify-content: space-between;
}
.header_span {
	font-weight: bolder;
	font-size: 20px;
}
.modal_header_left{
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
.modal_header_right {
	width: 40px;
	height: 40px;
	
	background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeTNkyhJRbYYCPurDfzSTRuk9d5qER1X2J4w&s');
	background-size: cover;
	cursor: pointer;
	
}
.modal_Inbody{
	display: block;
	
	border-bottom: 1px solid silver;
}
.key_wrapper {
	width: 100%;
	height: 40px;
	
	border-top: 1px solid silver;
	
	display: flex;
	
	justify-content: space-between;
}
.key_name {
	width: 100px;
}
.key_name > p {
	text-align: center;	
}
.key_center {
	display: flex;
	justify-content: center;
	align-items: center;
}
.font_green {
	color: green;
}
.font_red {
	color: red;
}
.key_status {
	width: 70px;
}
.key_status > p{
	text-align: center;
}

.key_button {
  	width: 80px;
}

.key_button > button {
	width: 50px;
	height: 25px;
}
</style>
</head>
<body id="setting_body">
	<%@ include file="/WEB-INF/views/pos/common/pos_header.jsp"%>

	<div class="main_wrapper">
		<div class="modal">
			<div class="modal_body">
				<div class="modal_header">
					<div class="modal_header_left">
						<span class="header_span">키 발급 받기</span>
					</div>
					<div class="modal_header_right">
						
					</div>
				</div>
				<div class="modal_Inbody">
					
				</div>
			
			</div>
		</div>
		<div class="left_sidebar">
			<div class="payment tab" data-id="1">
				<span>결재내역 조회</span>
			</div>
			<div class="reservation tab" data-id="2">
				<span>예약정보 조회</span>
			</div>
			<div class="setting tab" data-id="3">
				<span>설정</span>
			</div>
		</div>
		<div class="right_sidebar">
			<div class="set_store_setting">
				<div class="common_wrapper">
					<span>가게 배치도</span>
					<button type="button" onclick="goSetLayout()">설정하기</button><br>
				</div>
				<div class="common_wrapper">
					<span>가게 배치도 등록하기</span>
					<form action="upload" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id"> <input type="file"
							id="myFile" name="myFile">
						<button type="submit">업로드</button>
					</form>
				</div>
				<div class="common_wrapper">
					<span>키 발급 받기</span>
					<button type="button" onclick="makeModal()">발급받기</button>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/pos/pos_setting.js"></script>
	<script type="text/javascript">
			const main_wrapper = document.querySelector(".main_wrapper");
			
			$(document).ready(function() {
				var realSize = window.innerHeight - 57;
				var width = window.innerWidth - 161;
				$(".right_sidebar").css("width", width);
				$("#setting_body").css("height", realSize);
				
				getKey();
			})
			$(window).resize(function() {
				var realSize = window.innerHeight - 57;
				var width = window.innerWidth - 161;
				if (realSize > 0 || width > 0) {
					$(".right_sidebar").css("width", width);
					$("#setting_body").css("height", realSize);	
				}
			});
			
			
			
			main_wrapper.addEventListener("click", function(event) {
				let parent = event.target;
				
				for(let i = 0; i < 4; i ++)
				{
					if(parent.dataset.id != undefined)
					{
						if(parent.dataset.id === '3')
						{
							document.querySelector(".set_store_setting").style.display ="flex";
							break;
						}
					}
					// 키 발급하기 옆 +를 누르면
					else if(parent.classList.contains('modal_header_right'))
					{
						console.log("플러스 버튼 누름!!")
						makeKey();
						break;
					}
					else if(i == 0 && parent.classList.contains('modal'))
					{
						parent.style.display = 'none';
						break;
					}
					else if(parent.classList.contains('setting_body'))
					{
						break;	
					}
					
					else 
					{
						parent = parent.parentElement;
						
					}
				}
			})
		
			function goSetLayout() {
				location.href="<%=request.getContextPath()%>/pos/layout";
			}
			
			function makeModal() {
				const modal = document.querySelector('.modal');
				
				modal.style.display = "flex";
			}
			// 플러스 버튼 누르면 키를 생성해 주는 함수
			function makeKey() {
				const modal_Inbody = document.querySelector('.modal_Inbody');
				
				if(modal_Inbody.children.length <= 2)
				{
					console.log("유저 세선 아이디 : " + ${UserID})
					fetch("http://localhost:8080/root/api/key", {
						method : "POST",
						headers : {"Content-Type": "application/json",},
						body : JSON.stringify({
							"store_id" : ${UserID}
						})
					})
					.then((response) => response.json())
					.then((data) => {
						makeKeyDiv(data);
					})	
				}
			}
			
			// 초반에 설정된 키를 가져오는 함수
			function getKey() {
				const moadl_Inbody = document.querySelector('.modal_Inbody');
			
				console.log("유저 세선 아이디 : " + ${UserID});
				fetch("http://localhost:8080/root/api/key?userId=" + ${UserID})
				.then((response) => response.json())
				.then((data) => {
					for(let i = 0; i < data.length; i++)
					{
						makeKeyDiv(data[i]);	
					}
					
				})	
			}
			// 삭제 버튼 클릭시
			function deleteKey() {
				console.log("삭제");
			}
			
			// 키값을 DOM객체로 화면에 뛰우기
			function makeKeyDiv(data) {
				const modal_Inbody = document.querySelector('.modal_Inbody');
				
				const div_wrapper = document.createElement('div');
				div_wrapper.classList.add('key_wrapper');
				
				const key_name_wrapper_div = document.createElement('div');
				const key_name = document.createElement('p');
				key_name_wrapper_div.classList.add('key_name');
				key_name_wrapper_div.classList.add('key_center');
				key_name.innerText = data.store_key;
				key_name.classList.add("key_name");
				key_name_wrapper_div.appendChild(key_name);
				
				const key_status_wrapper_div = document.createElement('div');
				key_status_wrapper_div.classList.add('key_status');
				key_status_wrapper_div.classList.add('key_center');
				
				const key_status= document.createElement('p');
				if(data.key_status == 0)
				{
					key_status.innerText = "연결가능";
					key_status.classList.add('font_green');
				}
				else 
				{
					key_status.innerText = "연결중";
					key_status.classList.add('font_red');							
				}
				key_status_wrapper_div.appendChild(key_status);
				
				const delete_button_div = document.createElement('div');
				const delete_button = document.createElement("button");
				delete_button_div.classList.add('key_button');
				delete_button_div.classList.add('key_center');
				delete_button.setAttribute('onclick', 'deleteKey()');
				delete_button.innerText = "삭제";
				delete_button_div.appendChild(delete_button);
				
				
				div_wrapper.appendChild(key_name_wrapper_div);
				div_wrapper.appendChild(key_status_wrapper_div);
				div_wrapper.appendChild(delete_button_div);
				
				modal_Inbody.appendChild(div_wrapper);
			}
			
	</script>
</body>
</html>