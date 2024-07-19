console.log("JavaScript 파일이 연결되었습니다.");

window.onload = function() {
            category(0);
    };	     

function category(n) {
		const cateNum = n;
	    let cateVal="";
	    
	    if(cateNum == 2) {
	    	cateVal = "http://localhost:8080/root/businessM/menuInfo";
		    // History API를 사용하여 URL을 업데이트
		    var newUrl = 'http://localhost:8080/root/businMmenu?category=menuInfo';
		    history.replaceState(null, null, newUrl);
	    }else if(cateNum == 3) {
	    	cateVal = "http://localhost:8080/root/businessM/photoInfo";
		    var newUrl = 'http://localhost:8080/root/businMmenu?category=photoInfo';
		    history.replaceState(null, null, newUrl);
	    }else if(cateNum == 4) {
	    	cateVal = "http://localhost:8080/root/businessM/reviewInfo";
	    	var newUrl = 'http://localhost:8080/root/businMmenu?category=reviewInfo';
		    history.replaceState(null, null, newUrl);
	    }else if(cateNum == 5) {
	    	cateVal = "http://localhost:8080/root/businessM/bookInfo";
	    	var newUrl = 'http://localhost:8080/root/businMmenu?category=bookInfo';
		    history.replaceState(null, null, newUrl);
	    }else{
	    	cateVal = "http://localhost:8080/root/businessM/storeInfo";
	    	var newUrl = 'http://localhost:8080/root/businMmenu?category=storeInfo';
		    history.replaceState(null, null, newUrl);
	    }
	    
		 const myIframe = document.getElementById("myIframe");
	     myIframe.src = cateVal;

		console.log("cateVal 주소는? : ", cateVal);
	}


function iHeight(){
var iHeight = document.getElementById('myIframe').contentWindow.document.body.scrollHeight;
document.getElementById('myIframe').height = iHeight;
console.log("카테고리 높이? : ",iHeight);
}


function changeCategory(category) {
    var iframe = document.getElementById('categoryFrame');
    iframe.src = category + '.html'; // 해당 카테고리의 HTML 파일로 변경

    // History API를 사용하여 URL을 업데이트
    var newUrl = 'iframe_example.html?category=' + category;
    history.replaceState(null, null, newUrl);
}


//메뉴에서 쓰이는 iframe에서 버튼을 누를때 부모페이지가 바뀌게 하는 이벤트
//보안상으로 안좋아서 막아놓는 웹사이트도 많다. iframe을 안쓰는 다른방법을 찾아보기
function changeParentUrl(newUrl) {
	window.location.href = newUrl;
}


// 구현 내용 추가
// reviewInfo 높이 조절을 위한 코드
window.addEventListener('message', function(event) {
	console.log("event : ", event)
    const iframe = document.getElementById('myIframe');
    if (event.data.height) {
        iframe.style.height = event.data.height + 'px';
    }
});


