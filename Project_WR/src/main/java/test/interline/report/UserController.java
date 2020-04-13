package test.interline.report;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.interline.report.dao.UserDAO;
import test.interline.report.vo.reportListVO;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserDAO dao;
	
	@RequestMapping(value = "/myReport", method = RequestMethod.GET)
	public String myReport(Model model, int reportNum) {
		logger.debug("reportNum:{}", reportNum);
		return "User/myReport";
	}
	
	@RequestMapping(value = "/myReportList", method = RequestMethod.GET)
	public String getList2(Model model) {
		ArrayList<reportListVO> all_list = dao.getMy_List();
		
		model.addAttribute("report_my",my_list);
		return "User/myReportList";
	}
}
