
			$(document).ready(function() {
			var realSize = window.innerHeight - 56;
			$("#login_body").css("height", realSize);
			$("#login_body").css("display", "block");
		})
		$(window).resize(function() {
			var realSize = window.innerHeight - 56;
			if (realSize > 0) {
				$("#login_body").css("height", realSize);	
			}
		});