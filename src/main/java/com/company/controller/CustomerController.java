package com.company.controller;

import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.config.MailConfig;
import com.company.domain.AuthDTO;
import com.company.domain.ChangePwdDTO;
import com.company.domain.CustomerDTO;
import com.company.domain.SellItemDTO;
import com.company.mapper.UserMapper;
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
	

	// 중복아이디 검사
	@ResponseBody // 리턴하는 값이 데이터임
	@PostMapping("/checkId")
	public String IdCheck(String userid) {
		log.info("중복 아이디 검사 " + userid);
		
		if(service.checkId(userid) != null) {
			return "false";
		}
		return "true";
	}
	
	@PostMapping("/register")
	public String registerlogin(CustomerDTO customerDto) {
		log.info("회원가입 요청" + customerDto);
		try {
			if (!service.register(customerDto)) {
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
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/adminPage")
	public void admin(Model model) {
		log.info("관리자페이지 폼 요청");
		List<CustomerDTO> list = service.adminRead();
		model.addAttribute("list",list);
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin/{userid}/{role}")
    public String changeRole(@PathVariable String userid, @PathVariable String role) {
        toggleRole(userid, role);
        return "redirect:/adminPage";
    }
    private void toggleRole(String userid, String role) {
        CustomerDTO customerDto = service.read(userid);
        if (! customerDto.hasRole(role)) {
        	log.info("권한 부여 ", role);
            service.adminInsert(customerDto.getUserid(), "ROLE_" + role.toUpperCase());
        } else {
        	log.info("권한 삭제 ", role);
            service.adminDelete(customerDto.getUserid(), "ROLE_" + role.toUpperCase());
        }
    }

	@PostMapping("/changePwd")
	public String changePwdPost(ChangePwdDTO changeDto, Principal principal, HttpSession session,
			RedirectAttributes rttr) {
		log.info("비밀번호 변경 요청 ", changeDto);
		log.info("ddd" + principal.getName());
		String msg = "";

		// 비밀번호 변경 요청
		changeDto.setUserid(principal.getName());

		// 비밀번호 변경이 되면 기존의 세션 해제
		// 로그인 페이지 보여주기
		if (service.changePwd(changeDto)) {
			session.invalidate();
			msg = "성공";
		} else {
			// 변경 실패시 changePwd 보여주기
			msg = "실패";
		}
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/changePwd";
	}

	// @ResponseBody
	@PostMapping("/forgotPwd")
	public String forgotPwdPost(CustomerDTO dto, RedirectAttributes rttr) throws Exception {
		String pwd = "";
		String msg1 = "";
		log.info("dto 값 확인 : ", dto);

		CustomerDTO user = service.searchId(dto);

		if (user != null) {
			// 임시비밀번호를 발급한다
			UUID uid = UUID.randomUUID();
			pwd = uid.toString().substring(0, 6);
			service.forgotPwd(user.getUserid(), pwd);

			String subject = "임시 비밀번호 발급 안내";

			String msg = "";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>임시 비밀번호가 발급되었습니다. 로그인 후 비밀번호를 변경하세요.</h3>";
			msg += "<p>임시 비밀번호 : <strong>" + pwd + "</strong></p></div>";

			MailConfig.sendMail(dto.getUserid(), subject, msg);
			msg1 = "성공";

		} else {
			msg1 = "실패";
		}
		rttr.addFlashAttribute("msg", msg1);
		return "redirect:/forgotPwd";
	}
	
	
	}
	
