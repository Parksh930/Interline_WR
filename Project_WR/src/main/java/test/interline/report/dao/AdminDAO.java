package test.interline.report.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.interline.report.vo.reportListVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSession session;
	
	public ArrayList<reportListVO> getAll_List() {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		ArrayList<reportListVO> all_List = mapper.getAll_List();
		
		return all_List;
	}

}
