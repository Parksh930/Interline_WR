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

	public userVO getUser(String login_id) {
		MainMapper mapper = session.getMapper(MainMapper.class);
		userVO vo = mapper.getUser(login_id);
		
		return vo;
	}
}
