package com.hub.root.pos.posController;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.zxing.WriterException;
import com.hub.root.pos.posService.PosService;

@Controller
@RequestMapping("pos")
public class PosController {

	@Autowired
	PosService service;

	@GetMapping("login")
	public String pos() {
		return "pos/pos_login";
	}
	@GetMapping("set")
	public String set() {
		return "pos/pos_setting";
	}
	@GetMapping("layout")
	public String layout() {
		return "pos/pos_layout";
	}
	@GetMapping("order")
	public String order() {
		return "pos/pos_order";
	}

	@GetMapping("qr")
	public String qr(@RequestParam("store_name") String store_name
					,@RequestParam("store_id") String store_id
					,Model model) {
		model.addAttribute("store_name", store_name);
		model.addAttribute("store_id", store_id);
		return "pos/pos_qr";
	}

	@GetMapping("wait")
	public String wait1(Model model,
						HttpServletRequest req) {
		HttpSession session = req.getSession();
		String store_name = session.getAttribute("store_name").toString();
		String link = "http://34.47.108.10:8080/root/pos/qr?store_name=" + store_name + "&store_id=" + session.getAttribute("store_id").toString();

		try {

			byte[] qrCodeBytes = service.qrCode(link);

			String qrCode = Base64.getEncoder().encodeToString(qrCodeBytes);

			model.addAttribute("qrCode", qrCode);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			e.printStackTrace();
		}

		return "pos/pos_wait";
	}
	@GetMapping("wait_login")
	public String wait_login() {
		return "pos/pos_wait_login";
	}

	@PostMapping("pos_login_chk")
	public String login_chk(HttpServletRequest req,
					@RequestParam String id,
					@RequestParam String pwd) {
		int result = service.login_chk(req, id, pwd);

		if(result == 1)
			return "redirect:/pos/order";

		return "redirect:/pos/login";
	}

	@PostMapping("upload")
	public String upload(MultipartHttpServletRequest mReq) {
		System.out.println(mReq.getFile("myFile"));
		HttpSession session = mReq.getSession();
		System.out.println(session.getAttribute("UserID"));
		MultipartFile file = mReq.getFile("myFile");

		int result = service.upload_store_file(file, session);

		return "redirect:/pos/set";

	}

	@PostMapping("wait_keyCheck")
	public String wait_keyCheck(HttpServletRequest req,
								@RequestParam String key)
	{
		int result = service.wait_keyCheck(req, key);

		return "redirect:/pos/wait";
	}
}
