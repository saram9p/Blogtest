package com.cos.blogtest.domain.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blogtest.web.UserRepository;
import com.cos.blogtest.web.dto.JoinReqDto;
import com.cos.blogtest.web.dto.LoginReqDto;

@Controller
public class UserController {
	private UserRepository userRepository;
	private HttpSession session;

	public UserController(UserRepository userRepository, HttpSession session) {
		this.userRepository = userRepository;
		this.session = session;
	}
	
	@GetMapping("/home")
	public String home() {
		return "home";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}
	
	@PostMapping("/join")
	public String join(JoinReqDto dto) {
		userRepository.save(dto.toEntity());
		return "redirect:/loginForm";
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	public String login(LoginReqDto dto, HttpServletResponse response) {
		System.out.println(dto.getUsername());
		System.out.println(dto.getPassword());
		System.out.println(dto.getIdChecked());

		User userEntity = userRepository.mLogin(dto.getUsername(), dto.getPassword());

		if (userEntity == null) {
			return "redirect:/loginForm";
		} else {
			session.setAttribute("principal", userEntity);
			Cookie rCookie = new Cookie("username", userEntity.getUsername());
			rCookie.setPath("/");
			
			System.out.println("rCookie: " + rCookie);
			if (dto.getIdChecked() != 0) {
				rCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(rCookie);
			} else {
				rCookie.setMaxAge(0);
				response.addCookie(rCookie);
			}

			return "redirect:/home";
		}	
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/home";
	}
	
}

	

