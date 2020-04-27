package test.interline.report.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.interline.report.vo.reportListVO;
import test.interline.report.vo.reportMainVO;
import test.interline.report.vo.userVO;

@Repository

public class UserDAO {
		
	@Autowired
		SqlSession session;
		
	public ArrayList<reportListVO> getMy_List(int st, int ctt, int user_num) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		RowBounds rbs = new RowBounds(st,ctt);
		ArrayList<reportListVO> my_List = mapper.getMy_List(rbs,user_num);
		return my_List;
	}

	
	public reportListVO readReportList(reportListVO report) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		return mapper.readReportList(report);
	}
	
	
	public int getAll(int user_num) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int ct = mapper.getAll(user_num);
		
		return ct;
	}
	
	
	public boolean writeReportList(reportListVO report) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		return mapper.writeReportList(report);
	}



	public void writeReportMain(ArrayList<reportMainVO> reportMains) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		mapper.writeReportMain(reportMains);

	}


	public int getTotal(int user_num) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		int cnt = mapper.getTotal(user_num);
		return cnt;
	}
	
	
	public userVO updatemyPage(String id) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		userVO vo = mapper.updatemyPage(id);
		
		return vo;
	}
	
	
}