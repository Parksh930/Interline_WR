package test.interline.report.dao;

import java.util.ArrayList;
import java.util.HashMap;

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

	public int getReport_Total() {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		int cnt = mapper.getReport_Total();
		
		return cnt;
	}

	public int insertUser(userVO user) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		int n = mapper.insertUser(user);
		
		return n;
	}

	public userVO check_Multiple(String check_point, Object check_content) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("check_point", check_point);
		map.put("check_content", check_content);
		
		userVO check_reslut = null;
		check_reslut = mapper.check_Multiple(map);
		
		return check_reslut;
	}

	public ArrayList<userVO> getUser_list(int start, int count) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		RowBounds rb = new RowBounds(start,count);
		ArrayList<userVO> vo = mapper.getUser_list(rb);
		
		return vo;
	}

	public userVO getUser(int num) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		userVO vo = mapper.getUser(num);
		
		return vo;
	}
	
	public int updateUser(userVO update_User) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		int n = mapper.updateUser(update_User);
		
		return n;
	}

	public int deleteUser(int userNum) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		int n = mapper.deleteUser(userNum);
		
		return n;
	}

	public int getUser_Total() {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		int cnt = mapper.getUser_Total();
		
		return cnt;
	}

}
