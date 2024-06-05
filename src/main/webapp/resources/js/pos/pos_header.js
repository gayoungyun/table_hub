/**
 * 
 */
 
	const header_tab = document.querySelector(".header_tab_wrapper");
	header_tab.addEventListener('click', function(e) {
		// 나중에 경로 추가
		if(e.target.innerHTML === "주문 관리")
			console.log(e.target.innerHTML);
		if(e.target.innerHTML === "매장 관리")
			console.log(e.target.innerHTML);
	})
