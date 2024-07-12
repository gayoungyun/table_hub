console.log("JavaScript 파일이 연결되었습니다.");

window.onload = function() {
            category(0);
    };	     

function category(n) {
		const cateNum = n;
	    let cateVal="";
	    
	    if(cateNum == 2)
	    	cateVal = "http://localhost:8080/root/store/menu";
	    else if(cateNum == 3)
	    	cateVal = "http://localhost:8080/root/store/review";
	    else if(cateNum == 4)
	    	cateVal = "http://localhost:8080/root/store/photo";
	    else if(cateNum == 5)
	    	cateVal = "http://localhost:8080/root/store/map";
	    else
	    	cateVal = "http://localhost:8080/root/store/info";
	    
		 const myIframe = document.getElementById("myIframe");
	     myIframe.src = cateVal;

		console.log("cateVal 주소는? : ", cateVal);
	}


function iHeight(){
var iHeight = document.getElementById('myIframe').contentWindow.document.body.scrollHeight;
document.getElementById('myIframe').height = iHeight;
console.log("카테고리 높이? : ",iHeight);
}