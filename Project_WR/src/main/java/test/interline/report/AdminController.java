package test.interline.report;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.interline.report.dao.AdminDAO;
import test.interline.report.vo.reportListVO;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminDAO dao;
	
	@RequestMapping(value = "/ReadReport", method = RequestMethod.GET)
	public String readReport(Model model, int reportNum) {
		logger.debug("reportNum:{}", reportNum);
		return "Admin/readReport";
	}
	
	@RequestMapping(value = "/ReportList", method = RequestMethod.GET)
	public String getList2(Model model) {
		ArrayList<reportListVO> all_list = dao.getAll_List();
		
		model.addAttribute("report_all",all_list);
		return "Admin/reportList";
	}
}
