
			$(document).ready(function() {
			var realSize = window.innerHeight;
			$("#login_body").css("height", realSize);
			$("#login_body").css("display", "block");
		})
		$(window).resize(function() {
			var realSize = window.innerHeight;
			if (realSize > 0) {
				$("#login_body").css("height", realSize);	
			}
		});