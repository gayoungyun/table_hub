console.log("JavaScript 파일이 연결되었습니다.");

window.onload = function() {
            category(0);
    };	     

function category(n) {
		const cateNum = n;
	    let cateVal="";
	    
	    if(cateNum == 2)
	    	cateVal = "http://localhost:8080/root/businessM/menuInfo";
	    else if(cateNum == 3)
	    	cateVal = "http://localhost:8080/root/businessM/photoInfo";
	    else if(cateNum == 4)
	    	cateVal = "http://localhost:8080/root/businessM/reviewInfo";
	    else if(cateNum == 5)
	    	cateVal = "http://localhost:8080/root/businessM/bookInfo";
	    else
	    	cateVal = "http://localhost:8080/root/businessM/storeInfo";
	    
		 const myIframe = document.getElementById("myIframe");
	     myIframe.src = cateVal;

		console.log("cateVal 주소는? : ", cateVal);
	}


function iHeight(){
var iHeight = document.getElementById('myIframe').contentWindow.document.body.scrollHeight;
document.getElementById('myIframe').height = iHeight;
console.log("카테고리 높이? : ",iHeight);
}


//메뉴에서 쓰이는 iframe에서 버튼을 누를때 부모페이지가 바뀌게 하는 이벤트
//보안상으로 안좋아서 막아놓는 웹사이트도 많다. iframe을 안쓰는 다른방법을 찾아보기
function changeParentUrl(newUrl) {
	window.location.href = newUrl;
}


