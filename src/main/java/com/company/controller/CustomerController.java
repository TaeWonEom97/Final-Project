package com.company.controller;


import java.security.Principal;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.config.MailConfig;
import com.company.domain.ChangePwdDTO;
import com.company.domain.CustomerDTO;
import com.company.service.UserService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class CustomerController {
	
	@Autowired
	private UserService service;
	
	@GetMapping("/login")
	public String login() {
		log.info("로그인 폼 요청");
		
		return "/login";
	}
	
	@GetMapping("/main")
	public String chart1() {
		log.info("판매차트 요청");
		return "/main";
	}
	
	@GetMapping("/insertmain")
	public String chart2() {
		log.info("입고차트 요청");
		return "/insertmain";
	}
	
	@GetMapping("/allmain")
	public String chart3() {
		log.info("재고차트 요청");
		return "/allmain";
	}

	@GetMapping("/register")
	public String register() {
		log.info("회원가입 폼 요청");
		return "/register";
	}
	
	@GetMapping("/list")
	public String board() {
		log.info("게시판 폼 요청");
		return "/list";
	}
	
	
	@PostMapping("/register")
	public String registerlogin(CustomerDTO customerDto) {
		log.info("회원가입 요청"+customerDto);
		try {
			if(!service.register(customerDto)) {
				return "/register";
			}
		} catch (Exception e) {
			return "/register";
		}
		return "redirect:/login";
	}
	
	@GetMapping("/logoutForm")
	public String logoutGet(HttpServletRequest request) {
		log.info("로그아웃 폼 요청");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/forgotPwd")
	public String forgotPwdGet() {
		log.info("비밀번호 찾기 폼 요청");
		return "/forgotPwd";
	}
	
	@GetMapping("/changePwd")
	public String changePwdGet() {
		log.info("비밀번호 변경 폼 요청");
		return "/changePwd";
	}
	
	
	
	@PostMapping("/changePwd")
	public String changePwdPost(ChangePwdDTO changeDto, Principal principal) {
		log.info("비밀번호 변경 요청 ", changeDto);
		log.info("ddd"+principal.getName());		
		
		
		// 비밀번호 변경 요청
		changeDto.setUserid(principal.getName());
		
		// 비밀번호 변경이 되면 기존의 세션 해제
		// 로그인 페이지 보여주기
		if (service.changePwd(changeDto)) {		
			return "redirect:/login";
		} else {
		// 변경 실패시 changePwd 보여주기
		return "redirect:/changePwd";
		}
	}
	
	//@ResponseBody
	@PostMapping("/forgotPwd")
	  public String forgotPwdPost(CustomerDTO dto, RedirectAttributes rttr) throws Exception {
		String pwd = "";
		String msg1 = "";
		log.info("dto 값 확인 : ", dto);
		
		CustomerDTO user = service.searchId(dto);
		
		if(user != null) {
			//임시비밀번호를 발급한다
			UUID uid = UUID.randomUUID();
			pwd = uid.toString().substring(0,6);
			service.forgotPwd(user.getUserid(), pwd);
			
			String subject = "임시 비밀번호 발급 안내";
			
			String msg = "";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>임시 비밀번호가 발급되었습니다. 로그인 후 비밀번호를 변경하세요.</h3>";
			msg += "<p>임시 비밀번호 : <strong>" + pwd + "</strong></p></div>";
			
			MailConfig.sendMail(dto.getUserid(), subject, msg);
			msg1 = "이메일 발송 완료";

		}
		else {
			msg1 = "아이디나 회사명을 확인해 주세요.";
		}
		rttr.addFlashAttribute("msg", msg1);
		return "redirect:/forgotPwd";
	  }
}