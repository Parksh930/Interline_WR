package test.interline.report.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.interline.report.vo.userVO;

@Repository
public class MainDAO {

	@Autowired
	SqlSession session;

	public ArrayList<userVO> getList() {
		MainMapper mapper = session.getMapper(MainMapper.class);
		ArrayList<userVO> vo = mapper.getList();
		
		return vo;
	}
}
