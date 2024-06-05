
			$(document).ready(function() {
			var realSize = window.innerHeight - 56;
			var width = window.innerWidth - 161;
			$(".right_sidebar").css("width", width);
			$("#setting_body").css("height", realSize);
		})
		$(window).resize(function() {
			var realSize = window.innerHeight - 56;
			var width = window.innerWidth - 161;
			if (realSize > 0 || width > 0) {
				$(".right_sidebar").css("width", width);
				$("#setting_body").css("height", realSize);	
			}
		});