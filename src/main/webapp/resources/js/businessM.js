function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            console.log( data );
            console.log( data.userSelectedType )
            let addr ="";
           if(data.userSelectedType  == 'R' ){
        	   addr = data.roadAddress;
           }else{
        	   addr = data.jibunAddress;
           }
           document.getElementById("addr1").value = data.zonecode;
           document.getElementById("addr2").value = addr;
           document.getElementById("addr3").focus();
        }
    }).open();
}


function goBack() {
            window.history.back();
        }

        // 페이지 로드 시 이전 페이지의 URL을 저장
        var previousPageUrl = document.referrer;