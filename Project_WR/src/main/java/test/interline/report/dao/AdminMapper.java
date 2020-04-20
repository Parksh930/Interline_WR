package test.interline.report.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import test.interline.report.vo.reportListVO;
import test.interline.report.vo.userVO;

public interface AdminMapper {

	ArrayList<reportListVO> getAll_List(RowBounds rb);

	int getTotal();

	int insertUser(userVO user);

}
