package test.interline.report;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import test.interline.report.dao.AdminDAO;
import test.interline.report.util.PageNavigator;
import test.interline.report.vo.reportListVO;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private static final int countPerPage=10;		
	private static final int pagePerGroup=10;	
	
	@Autowired
	AdminDAO dao;
	
	//レポートを読む
	@RequestMapping(value = "/ReadReport", method = RequestMethod.GET)
	public String readReport(Model model, int reportNum) {
		logger.debug("reportNum:{}", reportNum);
		model.addAttribute("ReportNumValue", reportNum);
		return "Admin/readReport";
	}
	
	//レポートリスト
	@RequestMapping(value = "/ReportList", method = RequestMethod.GET)
	public String getList2(Model model,@RequestParam(value="page", defaultValue="1") int page) {
		logger.debug("pageNum:{}", page);
		
		int total = dao.getTotal();
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<reportListVO> all_list = dao.getAll_List(navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("navi", navi);
		model.addAttribute("report_all",all_list);
		return "Admin/reportList";
	}
	
	
}
