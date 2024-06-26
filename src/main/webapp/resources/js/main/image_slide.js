	document.addEventListener('DOMContentLoaded', function() {
	    var sliders = document.querySelectorAll('.menu-img');
	    
	    sliders.forEach(function(slider) {
	    
	    	var index = 0; // 현재 슬라이드의 인덱스 추적
	        var li = slider.querySelectorAll('ul.image-slide > li'); // 모든 슬라이드 요소 선택
	        var liLength = li.length; // 슬라이드의 총 개수 저장
			
	   	   	li[index].classList.add('on'); // 초기 상태 설정: 첫 번째 슬라이드를 보이도록 설정(setTimeout으로도 가능)
	        
	        function updateSlider() {
	            var prevIndex = (index - 1 + liLength) % liLength; 
	            // 이전 슬라이드 인덱스 계산, index-1이 음수가 되어도 올바른 인덱스 찾을 수 있도록 liLength더하고 '%liLenght'로 나머지 연산
	                
	            	li[prevIndex].classList.remove('on');
	                li[prevIndex].classList.add('out');	
					// 이전 슬라이드의 클래스를 out으로 설정하여 슬라이드 아웃 애니메이션 적용
					
	                li[index].classList.remove('out');
	                li[index].classList.add('on');
	                // 현재 슬라이드의 클래스를 on으로 설정해여 슬라이드 인 애니메이션 적용
	                
	          		index = (index + 1) % liLength; // 인덱스 증가, 마지막 슬라이드 이후에 첫 번째 슬라이드로 돌아가도록
	        }
			
	        setTimeout(function(){
	        	setInterval(updateSlider, 3000);	
	        },0);
	        
	        
	        //버튼 클릭 이벤트 핸들러
	        var buttons = slider.querySelectorAll('.food-tagname button');
	         // 각 버튼에 클릭 이벤트를 추가
	        buttons.forEach(function(button) {
	            button.addEventListener('click', function() {
	                window.location.href = '/root/main/mainPage2'; 
	            });
	        });
	        
	    });
	});
	
	
	