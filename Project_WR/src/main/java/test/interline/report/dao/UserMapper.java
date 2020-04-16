package test.interline.report.dao;

import java.util.ArrayList;

import test.interline.report.vo.reportListVO;

public interface UserMapper {

	
ArrayList<reportListVO> getMy_List();


	boolean writeReportList(reportListVO report);

	//public int writeReport(ReportMain report);

}
