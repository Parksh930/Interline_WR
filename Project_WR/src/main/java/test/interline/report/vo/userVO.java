package test.interline.report.vo;

public class userVO {
	private int UserNum;
	private String UserId;
	private String UserName;
	private	String Password;
	private	String Authority;
	
	public userVO() {
		super();
	}

	public userVO(int userNum, String userId, String userName, String password, String authority) {
		super();
		UserNum = userNum;
		UserId = userId;
		UserName = userName;
		Password = password;
		Authority = authority;
	}

	public int getUserNum() {
		return UserNum;
	}

	public void setUserNum(int userNum) {
		UserNum = userNum;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getAuthority() {
		return Authority;
	}

	public void setAuthority(String authority) {
		Authority = authority;
	}

	@Override
	public String toString() {
		return "userVO [UserNum=" + UserNum + ", UserId=" + UserId + ", UserName=" + UserName + ", Password=" + Password
				+ ", Authority=" + Authority + "]";
	}
}
