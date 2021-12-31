package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.company.domain.CustomerDTO;
import com.company.service.UserServcie;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class CustomerController {
	
	@Autowired
	private UserServcie service;
	
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
	
	@GetMapping("/logout")
	public String logout() {
		log.info("로그아웃 폼 요청");
		return "/logoutForm";
	}
	
	@GetMapping("/password")
	public String forgotpassword() {
		log.info("패스워드 찾기");
		return "/password";
	}
}