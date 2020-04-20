package test.interline.report.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.interline.report.vo.reportListVO;
import test.interline.report.vo.userVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSession session;
	
	//全ての報告書リストを出力
	public ArrayList<reportListVO> getAll_List(int start, int count) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		RowBounds rb = new RowBounds(start,count);
		ArrayList<reportListVO> all_List = mapper.getAll_List(rb);
		
		return all_List;
	}

	public int getTotal() {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		int cnt = mapper.getTotal();
		
		return cnt;
	}

	public int insertUser(userVO user) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		int n = mapper.insertUser(user);
		
		return n;
	}

}
