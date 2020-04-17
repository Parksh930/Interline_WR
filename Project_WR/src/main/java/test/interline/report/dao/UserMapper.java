package test.interline.report.dao;

import java.util.ArrayList;

import test.interline.report.vo.reportListVO;
import test.interline.report.vo.reportMainVO;

public interface UserMapper {

	
ArrayList<reportListVO> getMy_List();


	boolean writeReportList(reportListVO report);


	reportListVO readReportList(reportListVO report);

	void writeReportMain(ArrayList<reportMainVO> reportMains);


	//public int writeReport(ReportMain report);

}
