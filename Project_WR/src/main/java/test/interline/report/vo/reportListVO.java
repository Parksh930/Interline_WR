package test.interline.report.vo;

import java.util.Date;

public class reportListVO {
	private int ReportNum;
	private int User_Num;
	private String User_Name;
	private String Location;
	private Date StartWeek;
	private Date EndWeek;
	private String WeeklyRemarks;
	private Date SendDays;
	
	public reportListVO() {
		super();
	}

	public reportListVO(int reportNum, int user_Num, String user_Name, String location, Date startWeek, Date endWeek,
			String weeklyRemarks, Date sendDays) {
		super();
		ReportNum = reportNum;
		User_Num = user_Num;
		User_Name = user_Name;
		Location = location;
		StartWeek = startWeek;
		EndWeek = endWeek;
		WeeklyRemarks = weeklyRemarks;
		SendDays = sendDays;
	}

	public int getReportNum() {
		return ReportNum;
	}

	public void setReportNum(int reportNum) {
		ReportNum = reportNum;
	}

	public int getUser_Num() {
		return User_Num;
	}

	public void setUser_Num(int user_Num) {
		User_Num = user_Num;
	}

	public String getUser_Name() {
		return User_Name;
	}

	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}

	public String getLocation() {
		return Location;
	}

	public void setLocation(String location) {
		Location = location;
	}

	public Date getStartWeek() {
		return StartWeek;
	}

	public void setStartWeek(Date startWeek) {
		StartWeek = startWeek;
	}

	public Date getEndWeek() {
		return EndWeek;
	}

	public void setEndWeek(Date endWeek) {
		EndWeek = endWeek;
	}

	public String getWeeklyRemarks() {
		return WeeklyRemarks;
	}

	public void setWeeklyRemarks(String weeklyRemarks) {
		WeeklyRemarks = weeklyRemarks;
	}

	public Date getSendDays() {
		return SendDays;
	}

	public void setSendDays(Date sendDays) {
		SendDays = sendDays;
	}

	@Override
	public String toString() {
		return "reportListVO [ReportNum=" + ReportNum + ", User_Num=" + User_Num + ", User_Name=" + User_Name
				+ ", Location=" + Location + ", StartWeek=" + StartWeek + ", EndWeek=" + EndWeek + ", WeeklyRemarks="
				+ WeeklyRemarks + ", SendDays=" + SendDays + "]";
	}
}