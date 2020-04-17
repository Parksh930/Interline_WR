package test.interline.report.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.interline.report.vo.reportListVO;
import test.interline.report.vo.reportMainVO;

@Repository

public class UserDAO {
		
	@Autowired
		SqlSession session;
		
	public ArrayList<reportListVO> getMy_List(int user_num) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		ArrayList<reportListVO> my_List = mapper.getMy_List(user_num);
		return my_List;
	}

	public boolean writeReportList(reportListVO report) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		return mapper.writeReportList(report);
	}


	public reportListVO readReportList(reportListVO report) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		return mapper.readReportList(report);
	}

	public void writeReportMain(ArrayList<reportMainVO> reportMains) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		mapper.writeReportMain(reportMains);

	}
}