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
	
	@RequestMapping(value = "/ReportList", method = RequestMethod.GET)
	public String getList2(Model model) {
		ArrayList<reportListVO> my_List = dao.getMy_List();
		
		model.addAttribute("report_my",my_List);
		return "User/reportList";
	}
	
		
	}
