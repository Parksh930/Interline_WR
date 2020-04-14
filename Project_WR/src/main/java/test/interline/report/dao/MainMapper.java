package test.interline.report.dao;


import test.interline.report.vo.userVO;

public interface MainMapper {

	userVO getUser(String login_id);

}
