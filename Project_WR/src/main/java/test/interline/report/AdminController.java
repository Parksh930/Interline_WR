package test.interline.report;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test.interline.report.dao.AdminDAO;
import test.interline.report.util.PageNavigator;
import test.interline.report.vo.reportListVO;
import test.interline.report.vo.userVO;


@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	private static final int countPerPage=10;		
	private static final int pagePerGroup=10;	

	@Autowired
	AdminDAO dao;

	//�꺃�깮�꺖�깉�굮沃���

	@RequestMapping(value = "/admin/readReport", method = RequestMethod.GET)
	public String readReport(Model model, int reportNum, HttpServletRequest request) {

		logger.debug("reportNum:{}", reportNum);
		model.addAttribute("ReportNumValue", reportNum); // 모델값

		HttpSession session = request.getSession();
		String getMobilecheck=(String)session.getAttribute("mobileCheck");
		if(getMobilecheck.equals("")){
			getMobilecheck="1";
		}
		System.out.println("관리자모바일: "+getMobilecheck);
		if(getMobilecheck.equals("1")) {
			System.out.println("관리자모바일접속");
			return "Admin/readReportMobile";
		}

		return "Admin/readReport";
	}

	//�꺃�깮�꺖�깉�꺁�궧�깉
	@RequestMapping(value = "/admin/reportList", method = RequestMethod.GET)
	public String getList2(Model model,@RequestParam(value="page", defaultValue="1") int page) {
		logger.debug("pageNum:{}", page);

		int total = dao.getTotal();
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);

		ArrayList<reportListVO> all_list = dao.getAll_List(navi.getStartRecord(), navi.getCountPerPage());

		model.addAttribute("navi", navi);
		model.addAttribute("report_all",all_list);
		return "Admin/reportList";
	}

	@RequestMapping(value="/admin/registerUser", method=RequestMethod.GET)
	public String insertUserForm() {
		logger.debug("RegisterUser");

		return "Admin/registerUser";
	}


	@ResponseBody
	@RequestMapping(value="/admin/check_multiple", method=RequestMethod.POST)
	public String check_Multiple(int userNum, String userId) {
		logger.debug("userNum:{},userId:{}",userNum,userId);
		userVO check_result = null;
		check_result = dao.check_Multiple("check_num",userNum);
		check_result = dao.check_Multiple("check_id",userId);

		return "true";
	}

	@RequestMapping(value="/admin/registerUser", method=RequestMethod.POST)
	public String insertUser(userVO user) {
		logger.debug("insert_user:{}",user);

		int result = dao.insertUser(user); 

		if(result == 1) {
			logger.debug("登録成功");
		}else {
			logger.debug("登録失敗");
		}

		return "redirect:/mainMenu";
	}

	@RequestMapping(value="/admin/printAll", method=RequestMethod.GET)
	public String printAll(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String getMobilecheck=(String)session.getAttribute("mobileCheck");
		if(getMobilecheck.equals("")){
			getMobilecheck="1";
		}
		System.out.println("관리자모바일: "+getMobilecheck);
		if(getMobilecheck.equals("1")) {
		System.out.println("관리자모바일접속");
		return "Admin/AllReporttMobile";
		}
	 

		return "Admin/AllReport";
		
	}


}



