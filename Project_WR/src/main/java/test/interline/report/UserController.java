package test.interline.report;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
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
import test.interline.report.vo.reportMainVO;

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
	public String loginForm(HttpServletRequest request, HttpServletResponse response, Model model) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		/*
		 * response.setHeader("Access-Control-Allow-Credentials", "true");
		 * response.setHeader("Access-Control-Allow-Methods",
		 * "POST, GET, OPTIONS, DELETE"); response.setHeader("Access-Control-Max-Age",
		 * "3600"); response.setHeader("Access-Control-Allow-Headers",
		 * "Content-Type, Accept, X-Requested-With, remember-me");
		 * response.setHeader("Content-Type", "application/json");
		 * response.setHeader("Accept", "application/json");
		 */
		
		logger.debug("loginForm");
		model.addAttribute("error",null);
		
		HttpSession session = request.getSession();
		String getMobilecheck=(String)session.getAttribute("mobileCheck");
		if(getMobilecheck.equals("")){
			getMobilecheck="1";
		}
		System.out.println("모바일체크:"+getMobilecheck);
		if(getMobilecheck.equals("1")) {
			System.out.println("모바일로 연결");
			return "User/writeReportMobile";
		}
		
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
	public String keepWriting(HttpServletRequest request, Model model) {
		logger.debug("loginForm");
		model.addAttribute("error",null);
		
		HttpSession session = request.getSession();
		String getMobilecheck=(String)session.getAttribute("mobileCheck");
		if(getMobilecheck.equals("")){
			getMobilecheck="1";
		}
		System.out.println("모바일체크:"+getMobilecheck);
		if(getMobilecheck.equals("1")) {
			System.out.println("모바일로 연결");
			return "User/keepWritingMobile";
		}
		return "User/keepWriting";
	}
	
	//저장으로   
	//저장후는 메인메뉴로
	@RequestMapping(value = "/submitReport", method = RequestMethod.GET)
	public String submitReport(Model model, String submitJsonReport, String submitJsonContents,HttpSession session) {
		JSONObject jsonReport= new JSONObject(submitJsonReport);
		JSONObject jsonContents= new JSONObject(submitJsonContents);
		SimpleDateFormat dt = new SimpleDateFormat("yyyyy-mm-dd hh:mm");
	
		reportListVO report = new reportListVO();
		report.setUser_Num(Integer.parseInt(jsonReport.getString("User_Num")));  // setReportNum 을 setUser_Num 으로 고침 ohsaeam
		report.setLocation(jsonReport.getString("location"));
		try {
			report.setStartWeek(new SimpleDateFormat("yyyy-MM-dd").parse(jsonReport.getString("StartWeek")));
			report.setEndWeek(new SimpleDateFormat("yyyy-MM-dd").parse(jsonReport.getString("EndWeek")));
		} catch (JSONException | ParseException e) {
			e.printStackTrace();
		}
		report.setWeeklyRemarks(jsonReport.getString("WeeklyRemarks"));
		
		System.out.println(report);
		//여기까지 report 만들어짐.
		
		/*
		 * 유진씨 여기에  report 가지고 
		 * db에 reportList 테이블에 삽입하는거좀 해주실래요.
		 */
		
		
		String user_Name = (String)session.getAttribute("userName");  // username 은  json에 없길래 섹션에서 받아오기로 했습니다. oh
		report.setUser_Name(user_Name);
		//System.out.println("2: " + report);
		boolean result = dao.writeReportList(report);
		System.out.println("result: "+result);
		
		/*
		 * 유진씨 여기에  방금 insert한 것 reportNum좀 받아오는 것 부탁드립니다.
		 * 받아서 바로 아래 int reportNum= 여기에다좀 넣어주세요.
		 */
		
		reportListVO report2 = new reportListVO();
		report2 = dao.readReportList(report);
		System.out.println("select value:" + report2.getReportNum());
		int reportNum= report2.getReportNum();
	
		/*
		"Report_Num":"",
		"StartWork":"",
		"EndWork":"",
		"ReportContents":"",
		"DailyRemarks":""
		*/
		
		JSONObject[] contents= {jsonContents.getJSONObject("mon"), jsonContents.getJSONObject("tue"), jsonContents.getJSONObject("wed"),jsonContents.getJSONObject("thu"), jsonContents.getJSONObject("fri")};
		ArrayList<reportMainVO> reportMains=new ArrayList<reportMainVO>(); 
		for(int i=0;i<contents.length;i++) {
			reportMainVO reportMain = new reportMainVO();
			reportMain.setDailyRemarks(contents[i].getString("DailyRemarks"));
			try {
				reportMain.setStartWork(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(contents[i].getString("StartWork")));
				reportMain.setEndWork(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(contents[i].getString("EndWork")));
			} catch (JSONException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			reportMain.setReport_Num(reportNum);
			reportMain.setReportContents(contents[i].getString("ReportContents"));
			reportMains.add(reportMain);
		}
		
		for (reportMainVO reportMainVO : reportMains) {
			System.out.println(reportMainVO);			
		}
		//jsonContents.getString("");
		
		
		
		/*
		 * 승훈씨 reportMains 어레이리스트가  0번부터 4번까지 월화수목금  컨텐츠인데요
		 * 이거 db에 넣는거 좀 부탁드힙니다.
		 */
		
		dao.writeReportMain(reportMains);
		
		
		logger.debug("loginForm");
		model.addAttribute("error",null);
		return "mainmenu";
	}
}
