package test.interline.report.vo;

import java.util.Date;

public class reportMainVO {
	private int ContentNum;
	private int Report_Num;
	private Date StartWork;
	private Date EndWork;
	private String ReportContents;
	private String DailyRemarks;
	
	public reportMainVO() {
		super();
	}

	public reportMainVO(int contentNum, int report_Num, Date startWork, Date endWork, String reportContents,
			String dailyRemarks) {
		super();
		ContentNum = contentNum;
		Report_Num = report_Num;
		StartWork = startWork;
		EndWork = endWork;
		ReportContents = reportContents;
		DailyRemarks = dailyRemarks;
	}

	public int getContentNum() {
		return ContentNum;
	}

	public void setContentNum(int contentNum) {
		ContentNum = contentNum;
	}

	public int getReport_Num() {
		return Report_Num;
	}

	public void setReport_Num(int report_Num) {
		Report_Num = report_Num;
	}

	public Date getStartWork() {
		return StartWork;
	}

	public void setStartWork(Date startWork) {
		StartWork = startWork;
	}

	public Date getEndWork() {
		return EndWork;
	}

	public void setEndWork(Date endWork) {
		EndWork = endWork;
	}

	public String getReportContents() {
		return ReportContents;
	}

	public void setReportContents(String reportContents) {
		ReportContents = reportContents;
	}

	public String getDailyRemarks() {
		return DailyRemarks;
	}

	public void setDailyRemarks(String dailyRemarks) {
		DailyRemarks = dailyRemarks;
	}

	@Override
	public String toString() {
		return "reportVO [ContentNum=" + ContentNum + ", Report_Num=" + Report_Num + ", StartWork=" + StartWork
				+ ", EndWork=" + EndWork + ", ReportContents=" + ReportContents + ", DailyRemarks=" + DailyRemarks
				+ "]";
	}
}
