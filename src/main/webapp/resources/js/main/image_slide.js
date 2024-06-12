document.addEventListener('DOMContentLoaded', function() {
    var sliders = document.querySelectorAll('.menu-img');
	
	
    sliders.forEach(function(slider) {
    
    	let currSlide = 1;
    	
    	if(currSlide <= 4) {
    		
    		const offset = 350 * 4;
    		
    		const food_img = document.querySelectorAll('.food_img');
    	
    		food_img.forEach((i) => i.classList.remove("active");
    		food_img[currSlide - 1].classList.add("active");
    	} else {
    	
    	}
    	
    	
    
    
    
    
    
    
        var index = 0;
        var li = slider.querySelectorAll('ul.image-slide > li');
        var liLength = li.length;
		
        function updateSlider() {
            var onNum = (index + 1) % liLength;
            var rightNum = (index + 2) % liLength;

            for (var i = 0; i < liLength; i++) {
                li[i].classList.remove('on', 'out', 'right');
                if (i == index) {
                    li[i].classList.add('right');
                } else if (i == onNum) {
                    li[i].classList.add('on');
                } else if (i == rightNum) {
                	li[i].classList.add('out');
                }
            }

            index = (index + 1) % liLength;
        }

        setInterval(updateSlider, 3000);
        
        
        //버튼 클릭 이벤트 핸들러
        var buttons = slider.querySelectorAll('.food-tagname button');
         // 각 버튼에 클릭 이벤트를 추가
        buttons.forEach(function(button) {
            button.addEventListener('click', function() {
                window.location.href = '/root/main/inputInfo'; 
            });
        });
        
    });
});


