<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/pos/layout.css?after"
	rel="stylesheet">

</head>
<body>
	<div id="layout_main">
		<div class="menu">
			<div><button type="button" onclick="makeTable()">테이블 생성</button></div>
			<a onclick="save()">저장</a>		
		</div>
		<div class="drow_area">
		</div>
		<div class="menu_detail">
			<div class="if_tableClick">
				<div class="menu_tab">
					<label for="input_tableNum">Num</label>
					<input type="text" id="input_tableNum" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br>
					<label for="input_tableWidth">X</label>
					<input type="text" id="input_tableWidth" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br>
					<label for="input_tableHeight">Y</label>
					<input type="text" id="input_tableHeight" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br>
					<label for="delete_btn">테이블 삭제</label>
					<button type="button" onclick="deleteTable()">삭제</button>
				</div>
			</div>
			<div class="else_tableClick">
				<div class="menu_tab">
					<label for="input_tableAllWidth">All_tableX</label>
					<input type="text" id="input_tableAllWidth" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br>
					<label for="input_tableAllHeight">All_tableY</label>
					<input type="text" id="input_tableAllHeight" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/pos/pos_layout.js"></script>
	<script type="text/javascript">
		let arr = [];
		let table_num = 0;
		let mx, my;
		let on = 0;
		
		
		$(document).ready(function() {
			var realSizeH = window.innerHeight;
			var realSizeW = window.innerWidth;
			$(".drow_area").css("height", realSizeH + "px");
			$(".drow_area").css("display", "inline-block");
			$(".drow_area").css("width", realSizeW - 280 + "px");
			$("#layout_main").css("height", realSizeH + "px");
		})
		$(window).resize(function() {
			var realSizeH = window.innerHeight;
			var realSizeW = window.innerWidth;
			if (realSizeH > 0) {
				$(".drow_area").css("height", realSizeH + "px");
				if(focus_table == false)
					$(".drow_area").css("width", realSizeW - 480 + "px");
				else
					$(".drow_area").css("width", realSizeW - 280 + "px");
				$("#layout_main").css("height", realSizeH + "px");
			}
		});
	
		
		const main = document.querySelector('#layout_main');
		const drow_area = document.querySelector('.drow_area');
		const input_tableNum = document.getElementById("input_tableNum");
		const input_tableWidth = document.getElementById("input_tableWidth");
		const input_tableHeight = document.getElementById("input_tableHeight");
		
		const input_tableAllWidth = document.getElementById("input_tableAllWidth");
		const input_tableAllHeight = document.getElementById("input_tableAllHeight");
		let focus_table;
		
		input_tableNum.addEventListener("input", function(event) {
			focus_table.children[0].innerText = input_tableNum.value;
		})
		input_tableWidth.addEventListener("input", function(event) {
			focus_table.style.width = input_tableWidth.value + "px";		
		})
		input_tableHeight.addEventListener("input", function(event) {		
			focus_table.style.height = input_tableHeight.value + "px";
		})
		input_tableAllWidth.addEventListener("input", function(event) {
			allTable_ChangeWidth(input_tableAllWidth.value);
		})
		input_tableAllHeight.addEventListener("input", function(event) {
			allTable_ChangeHeight(input_tableAllHeight.value);
		})
		
		main.addEventListener("mousedown", function(event) {
			const if_tableClick = document.querySelector(".if_tableClick");
			const else_tableClick = document.querySelector(".else_tableClick");
			let find_table = event.target;
			
			for(let j = 0; j < 3; j++)
			{
				if(find_table.getAttribute('class') === 'table') {
					
					focus_table = find_table;
					focus_table.classList.add('z_index');
					input_tableNum.value = find_table.children[0].innerText;
					
					
					input_tableWidth.value = find_table.clientWidth;
					input_tableHeight.value = find_table.clientHeight;
					
					if_tableClick.setAttribute("style", "display: block");
					else_tableClick.setAttribute("style", "display: none");
					
					mx = event.clientX - find_table.offsetLeft;
					my = event.clientY - find_table.offsetTop;
					on = 1;
					break;
				}
				else{
					find_table = find_table.parentElement;
					if(j == 2)
					{
						let break_for = true;
						let parent = event.target;
						for(let i = 0; i < 4; i++)
						{
							if(break_for == true)
							{
								let item = parent.classList;
								for( let className of item)
								{
									if(className === "menu_detail")
									{
										break_for = false;
										break;
									}
								}
								if(parent.getAttribute('id') === "layout_main")
								{
									if_tableClick.setAttribute("style", "display: none");
									else_tableClick.setAttribute("style", "display: block");
								}
								
								parent =parent.parentElement;
							}
						}	
					}
				}		
			}
		})
		
		main.addEventListener("mousemove", function(event) {
			if(on == 0)
				return;
			let x = event.clientX - mx;
			let y = event.clientY - my;
			
			if(x > 0)	
			{
				focus_table.style.left=x+"px";
				arr[focus_table.getAttribute('data-id')][0] = 	x;		
			}
			
			if(y > 0)
			{
				focus_table.style.top=y+"px";
				arr[focus_table.getAttribute('data-id')][1] = 	y;
			}
			
			drow_area.addEventListener("mouseout", function(event) {
				on = 0;
			})
		})
		
		main.addEventListener("mouseup", function(event) {
			on = 0;
			focus_table.classList.remove('z_index');
			
			const line = 15;
			
			for(let i = 0; i < arr.length; i++)
			{	
				if(i + 1 == focus_table.getAttribute('id'))
				{
					continue;
				}
				
				if(arr[i][0] - line < focus_table.offsetLeft && focus_table.offsetLeft < arr[i][0] + line )
				{
					focus_table.style.left = arr[i][0] + "px";
					arr[focus_table.getAttribute('data-id')][0] = arr[i][0];
					break;
				}
				
				if(arr[i][1] - line < focus_table.offsetTop && focus_table.offsetTop < arr[i][1] + line ) {
					focus_table.style.top = arr[i][1] + "px";
					arr[focus_table.getAttribute('data-id')][1] = arr[i][1];
				}
			}
		})	

		function makeTable() {
			const menu = document.querySelector('.menu');
			
			const table = document.createElement('div');
			table.classList.add('table');
			table.setAttribute('data-id', table_num);

			const label = document.createElement('label');
			label.setAttribute('data-id', table_num)
			label.classList.add('label_table');
			
			table_num++;
			table.setAttribute('id', table_num);
			label.innerHTML = table_num + "번 테이블";
			
			const p_tag = document.createElement('p');
			p_tag.innerHTML = table_num;
			table.appendChild(p_tag);
			
			arr.push([table.offsetLeft, table.offsetTop]);
			
			menu.appendChild(label);			
			drow_area.appendChild(table);
		}
		
		function deleteTable() {
			const allLabel = document.querySelectorAll(".label_table");
			
			for(let i = 0; i < allLabel.length; i++)
			{
				console.log(allLabel[i].getAttribute('data-id'));
				if(allLabel[i].getAttribute('data-id') === focus_table.getAttribute('data-id'))
				{
					allLabel[i].remove();
					break;
				}
			}
			
			focus_table.remove();	
		}
		
		function allTable_ChangeWidth(width) {
			const allTable = document.querySelectorAll(".table");
			
			for(let i = 0; i < allTable.length; i++)
			{
				allTable[i].style.width = width + "px";
			}
		}
		
		function allTable_ChangeHeight(height) {
			const allTable = document.querySelectorAll(".table");
			
			for(let i = 0; i < allTable.length; i++)
			{
				allTable[i].style.height = height + "px";
			}
		}
		
		function save() {
			const htmlContent = new Array(document.documentElement.innerHTML);
			const bl = new Blob(htmlContent, {type: "text/jsp"});
			const a = document.querySelector('a');
			a.href = URL.createObjectURL(bl);
			a.download = '안녕.jsp';

			
		}
		
	</script>
</body>
</html>