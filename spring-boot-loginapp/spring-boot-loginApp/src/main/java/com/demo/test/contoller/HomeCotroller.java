package com.demo.test.contoller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.demo.test.dao.RegisterDao;
import com.demo.test.model.Register;



@Controller
public class HomeCotroller {
	
	@Autowired
	RegisterDao register;
	
	@RequestMapping(value="/", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView home(HttpSession httpSession) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView = alreadyLoggedInUser(httpSession,modelAndView);
		//modelAndView.setViewName("login");
		return modelAndView;
	
		
	}
	
	private ModelAndView alreadyLoggedInUser(HttpSession httpSession, ModelAndView modelAndView){
		Register reg=(Register)httpSession.getAttribute("user");
				if(reg != null){
					modelAndView.setViewName("redirect:/homePage");
				}else{
					modelAndView.setViewName("login");
				}
		return modelAndView;
	}
	
	@RequestMapping(value = "/homepage")
	public String homepage(HttpSession httpSession,HttpServletRequest request) {
		Register req=(Register)httpSession.getAttribute("user");
		request.setAttribute("userdetails", req);
		return "home";
	}
	
	@RequestMapping(value="/register", method={RequestMethod.POST})
	public String register(HttpSession httpSession) {
		
		return "register";
	}
	
	@RequestMapping(value="/userRegister", method={RequestMethod.POST})
	public String userRegister(HttpServletRequest req,HttpSession httpSession,@RequestParam("image") MultipartFile file) throws IOException {
		Register reg=new Register();
		reg.setName(req.getParameter("name"));
		reg.setEmail(req.getParameter("email"));
		reg.setPassword(req.getParameter("password"));
		reg.setImage(file.getBytes());
		register.insert(reg);
		return "login";
	}
	
	@RequestMapping(value="/logdin", method={RequestMethod.POST})
	public String userLogin(Model model,HttpServletRequest request,HttpSession httpSession) {
		
		String uname=request.getParameter("email");
		String password=request.getParameter("password");
		Register reg=register.getUserDetails(uname, password);
		if(reg==null) {
			request.setAttribute("invalidCredential", "Wrong username & password or not Registered");
			return "login";
		}
		httpSession.setAttribute("user", reg);
		request.setAttribute("userdetails", reg);
		return "home";
		
	}
	
	
	@RequestMapping(value="/logout",  method = RequestMethod.GET)
	public String logout(HttpSession httpSession, SessionStatus status) {
		
		httpSession.removeAttribute("user");
		httpSession.invalidate();
		status.setComplete();
		return "login";
	}

}
