package test.interline.report.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.interline.report.vo.reportListVO;

@Repository

public class UserDAO {
		
	@Autowired
		SqlSession session;
		
	public ArrayList<reportListVO> getMy_List() {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		ArrayList<reportListVO> my_List = mapper.getMy_List();
		return my_List;
	}

	public boolean writeReportList(reportListVO report) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		return mapper.writeReportList(report);
	}
<<<<<<< HEAD
	
	
=======

	public reportListVO readReportList(reportListVO report) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		return mapper.readReportList(report);
	}
>>>>>>> 00a94ea52dc03c37ad452799a936a5c882111625
}