package finalWeb.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import finalWeb.command.UserCommand;
import finalWeb.dao.BasketDao;
import finalWeb.dao.LoginDao;

@Controller
public class LoginController {

	@Autowired
	private LoginDao loginDao;
	@Autowired
	private BasketDao basketDao;

	@ModelAttribute
	public void checkLogin() {

	}

	public void d(){
		System.out.println("Áö¿ì»ï");
	}
	@RequestMapping("/loginForm.do")
	public String login() {
		return "login/loginForm";
	}

	@RequestMapping("/login.do")
	public String login(@ModelAttribute("userCommand") UserCommand userCommand, HttpSession session) {
		String path = "login/loginForm";
		if (loginDao.login(userCommand) != null) {
			System.out.println(basketDao.basketCount(loginDao.login(userCommand).getId()));
			session.setAttribute("myId", loginDao.login(userCommand).getId());
			session.setAttribute("myInfo", loginDao.login(userCommand));
			session.setAttribute("count", basketDao.basketCount(loginDao.login(userCommand).getId()));
			
			path = "redirect:/main.do";
		}

		return path;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}

}
