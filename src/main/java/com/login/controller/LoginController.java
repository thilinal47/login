package com.login.controller;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.login.model.User;
import com.login.model.UserProfile;
import com.login.service.UserService;

@Controller
public class LoginController {
	@Autowired
	UserService userService;

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "login";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homesPage(ModelMap model) {
		return "home";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "admin";
	}

	@RequestMapping(value = "/db", method = RequestMethod.GET)
	public String dbaPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "dba";
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(ModelMap model) {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@RequestMapping(value = "/sendData", method = RequestMethod.POST)
	public String registerForm(@Valid @ModelAttribute("registerForm") User registerForm, BindingResult result,
			Model model) {

		Pattern regex = Pattern.compile("[$&+,:;=?@#|]");
		Matcher matcher = regex.matcher(registerForm.getUsername());
		if (matcher.find()) {
			result.rejectValue("username", "Scharacter", "Do not enter spcial character");
		}

		String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
				+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		regex = Pattern.compile(EMAIL_PATTERN);

		matcher = regex.matcher(registerForm.getEmail());
		if (!matcher.matches()) {
			result.rejectValue("email", "Scharacter", "Enter a valid phone number with out special characters");
		}

		if (!registerForm.getPassword().equals(registerForm.getRePassword())) {
			result.rejectValue("rePassword", "rePassword", "Passwords do not match");
		}
		if (result.hasErrors())
			return "register";
		UserProfile userProfile = new UserProfile();
		userProfile.setId(1);
		userProfile.setType("USER");
		Set<UserProfile> userProfileSet = new HashSet<UserProfile>();
		userProfileSet.add(userProfile);
		registerForm.setUserProfiles(userProfileSet);
		
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(registerForm.getPassword());
		registerForm.setPassword(hashedPassword);
		userService.saveUser(registerForm);
		return "login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		User userForm = new User();
		model.addAttribute("user", getPrincipal());
		model.addAttribute("registerForm", userForm);
		return "register";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}