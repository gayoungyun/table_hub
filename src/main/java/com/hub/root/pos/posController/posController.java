package com.hub.root.pos.posController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class posController {
	
	@GetMapping("pos")
	public String pos() {
		
		return "pos/pos_login";
	}
}
