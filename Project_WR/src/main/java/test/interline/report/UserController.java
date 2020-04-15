package test.interline.report;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import test.interline.report.dao.UserDAO;
import test.interline.report.vo.reportListVO;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserDAO dao;
	

//@RequestMapping(value="writeReport", method=RequestMethod.POST)
	
	
	@RequestMapping(value = "/myReport", method = RequestMethod.GET)
	public String myReport(Model model, int reportNum) {
		logger.debug("reportNum:{}", reportNum);
		return "User/myReport";
	}
	
	@RequestMapping(value = "/myReportList", method = RequestMethod.GET)
	public String getList(Model model) {
		ArrayList<reportListVO> my_List = dao.getMy_List();
		
		model.addAttribute("report_my",my_List);
		return "User/reportList";
	}
	
	
	//신규작성페이지로
	@RequestMapping(value = "/writeReport", method = RequestMethod.GET)
	public String loginForm(Model model) {
		logger.debug("loginForm");
		model.addAttribute("error",null);
		return "User/writeReport";
	}
	
	//임시저장페이지로
	@RequestMapping(value = "/saveOZD", method = RequestMethod.GET)
	public String saveOZD(Model model, String tempJson ,String[] week) {
		logger.debug("loginForm");
		model.addAttribute("error",null);
		System.out.println(tempJson);
		model.addAttribute("tempJson",tempJson);
		model.addAttribute("week",week);
		
		return "User/saveOZD";
	}
	
	//계속작성으로
	@RequestMapping(value = "/keepWriting", method = RequestMethod.GET)
	public String keepWriting(Model model) {
		logger.debug("loginForm");
		model.addAttribute("error",null);
		return "User/keepWriting";
	}
}
