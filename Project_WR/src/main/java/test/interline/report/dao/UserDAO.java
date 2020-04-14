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
		
	
}
