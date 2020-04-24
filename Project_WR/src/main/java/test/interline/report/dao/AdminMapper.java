package test.interline.report.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import test.interline.report.vo.reportListVO;
import test.interline.report.vo.userVO;

public interface AdminMapper {

	ArrayList<reportListVO> getAll_List(RowBounds rb);

	int getReport_Total();

	int insertUser(userVO user);

	userVO check_Multiple(HashMap<String, Object> map);

	ArrayList<userVO> getUser_list(RowBounds rb);
	
	int getUser_Total();

	userVO getUser(int num);

	int deleteUser(int userNum);

	int updateUser(userVO update_User);

}
