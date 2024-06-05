<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/pos/layout.css"
	rel="stylesheet">

</head>
<body id="layout_body">

	<div class="layout_main">
		<div class="layout_right">
			<button type="button" onclick="makeTable()">테이블 생성하기</button>
		</div>
		<div class="layout_left"></div>
	</div>


	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/pos/pos_layout.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var realSize = window.innerHeight;
			$("#layout_body").css("height", realSize);
			$("#layout_body").css("display", "block");
		})
		$(window).resize(function() {
			var realSize = window.innerHeight;
			if (realSize > 0) {
				$("#layout_body").css("height", realSize);	
			}
		});
	
		let arr = [];
		let table_num = 0;
		let mx, my;
		let on = 0;
	
		const layout_body = document.querySelector('#layout_body');
		
		layout_body.addEventListener("mousedown", function(event) {
			if(event.target.getAttribute('class') === 'table') {
				mx = event.clientX - event.target.offsetLeft;
				my = event.clientY - event.target.offsetTop;
				on = 1;
			}
		})
		
		layout_body.addEventListener("mousemove", function(event) {
			if(on == 0)
				return;
			let x = event.clientX - mx;
			let y = event.clientY - my;
			
			if(x > 0)	
			{
				event.target.style.left=x+"px";
				arr[event.target.getAttribute('data-id')][0] = 	x;		
			}
			
			if(y > 0)
			{
				event.target.style.top=y+"px";
				arr[event.target.getAttribute('data-id')][1] = 	y;
			}
			
			layout_body.addEventListener("mouseout", function(event) {
				on = 0;
			})
		})
		
		layout_body.addEventListener("mouseup", function(event) {
			on = 0;
			
			const line = 15;
			
			for(let i = 0; i < arr.length; i++)
			{
				console.log("실행");
				console.log(event.target.offsetTop);
				
				if(arr[i][0] - line < event.target.offsetLeft && event.target.offsetLeft < arr[i][0] + line )
				{
					console.log("줄");
					event.target.style.left = arr[i][0] + "px";
					arr[event.target.getAttribute('data-id')][0] = arr[i][0];
					console.log("확인" + arr[event.target.getAttribute('data-id')][0]);
					
				}
			}
		})	

		function makeTable() {
			const table = document.createElement('div');
			table.classList.add('table');
			table.setAttribute('data-id', table_num);
			table_num++;
			table.setAttribute('id', table_num);
			
			const p_tag = document.createElement('p');
			p_tag.innerHTML = table_num + "번 테이블";
			table.appendChild(p_tag);
			
			arr.push([table.offsetLeft, table.offsetTop]);
			
			layout_body.appendChild(table);
		}

	</script>
</body>
</html>