package com.hub.root.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hub.root.board.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired BoardService bs;

	@GetMapping("")
	public String board() {
		System.out.println("board실행");
		return "board/board";
	}
}
