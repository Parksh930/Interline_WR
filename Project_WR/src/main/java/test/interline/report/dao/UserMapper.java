package test.interline.report.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import test.interline.report.vo.reportListVO;
import test.interline.report.vo.reportMainVO;
import test.interline.report.vo.userVO;

public interface UserMapper {


	ArrayList<reportListVO> getMy_List(RowBounds rbs,int user_num);
	
	int getAll(int user_num);

	boolean writeReportList(reportListVO report);


	reportListVO readReportList(reportListVO report);

	void writeReportMain(ArrayList<reportMainVO> reportMains);

	int getTotal(int user_num);

	int updateMp(userVO user);

	
}
