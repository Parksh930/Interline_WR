package test.interline.report;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import test.interline.report.dao.MainDAO;
import test.interline.report.vo.userVO;

/**
 * Handles requests for the application home page.
 */

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MainDAO dao;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//メインメニュー
	@RequestMapping(value = "/main/mainMenu", method = RequestMethod.GET)
	public String MainMenu(Model model,HttpSession session) {
		logger.debug("MainMenu");
		session.getAttribute("login_id");
		session.getAttribute("user_inform");
		return "mainmenu";
	}
	
	//ログインフォーム
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(HttpSession session, HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		logger.debug("loginForm");
		
		return "login";
	}
	
	//ログイン処理
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String login_id, String login_pw, String mobileCheck
					, HttpSession session,RedirectAttributes redirect) {
		
		logger.debug("login id:{}, pw:{}", login_id,login_pw);
		
		userVO user = dao.getUser(login_id);
		
		if(user != null && user.getPassword().equals(login_pw)){
			session.setAttribute("login_id", user.getUserId());
			session.setAttribute("user_inform", user);
			session.setAttribute("userName", user.getUserName());
			session.setAttribute("mobileCheck", mobileCheck);
			
			return"redirect:/main/mainMenu";

		}
		
		if(user == null) {
			redirect.addFlashAttribute("error","存在しないIDです。");
		}else if(!user.getPassword().equals(login_pw)){
			redirect.addFlashAttribute("error","パスワードが一致しません。");
		}
		return "redirect:/login";
	}
	
	
	
	//ログアウト
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.debug("logout");
		session.removeAttribute("login_id");
		session.invalidate();
		
		return "redirect:/";
	}
}
