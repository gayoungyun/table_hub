document.addEventListener('DOMContentLoaded', function() {
var index = 0;

function slider(){
    li = document.querySelectorAll('.menu-img > ul> li');

    if (index == 4){ 
        index = 0;
    }
    for(i=0; i<li.length; i++){
        var onNum = index+1;
        if(onNum ==4) {
            onNum = 0;
        }
        console.log(index,onNum);
        
        if(i==index){
            console.log(i,'번째 클래스명 out');
            li.item(i).setAttribute('class','out');
        }
        else if(i==onNum){
            console.log(i,'번째 클래스명 on');
            li.item(i).setAttribute('class','on');
        }
        else {
            console.log(i,'여긴 클래스를 지워라');
            li.item(i).setAttribute('class','');
        }
        
    }
    index++;
}

function prevImage(){
	index--;
	if(index < 0){
		index = 3;
	}
	slider();
}

function nextImage(){
	index++;
	if(index > 3){
		index = 0;
	}
	slider();
}

setInterval(slider,3000);


});



document.addEventListener('DOMContentLoaded', function() {
var index = 0;

function slider(){
    li = document.querySelectorAll('.menu-img1 > ul> li');

    if (index == 4){ 
        index = 0;
    }
    for(i=0; i<li.length; i++){
        var onNum = index+1;
        if(onNum ==4) {
            onNum = 0;
        }
        console.log(index,onNum);
        
        if(i==index){
            console.log(i,'번째 클래스명 out');
            li.item(i).setAttribute('class','out');
        }
        else if(i==onNum){
            console.log(i,'번째 클래스명 on');
            li.item(i).setAttribute('class','on');
        }
        else {
            console.log(i,'여긴 클래스를 지워라');
            li.item(i).setAttribute('class','');
        }
        
    }
    index++;
}

function prevImage(){
	index--;
	if(index < 0){
		index = 3;
	}
	slider();
}

function nextImage(){
	index++;
	if(index > 3){
		index = 0;
	}
	slider();
}

setInterval(slider,3000);


});


document.addEventListener('DOMContentLoaded', function() {
var index = 0;

function slider(){
    li = document.querySelectorAll('.menu-img2 > ul> li');

    if (index == 4){ 
        index = 0;
    }
    for(i=0; i<li.length; i++){
        var onNum = index+1;
        if(onNum ==4) {
            onNum = 0;
        }
        console.log(index,onNum);
        
        if(i==index){
            console.log(i,'번째 클래스명 out');
            li.item(i).setAttribute('class','out');
        }
        else if(i==onNum){
            console.log(i,'번째 클래스명 on');
            li.item(i).setAttribute('class','on');
        }
        else {
            console.log(i,'여긴 클래스를 지워라');
            li.item(i).setAttribute('class','');
        }
        
    }
    index++;
}

function prevImage(){
	index--;
	if(index < 0){
		index = 3;
	}
	slider();
}

function nextImage(){
	index++;
	if(index > 3){
		index = 0;
	}
	slider();
}

setInterval(slider,3000);


});