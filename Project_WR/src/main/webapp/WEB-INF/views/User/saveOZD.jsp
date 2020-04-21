<%@page import="test.interline.report.vo.userVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- /******************************************************************************************
	Name
		oz_export.jsp

	Description	
		서버에 오즈보고서를 파일로 생성한다.
		
	String[]	ozrParamVal	= request.getParameterValues("ozrParamVal");
	int		ozrParamCnt	= ozrParamVal == null ? 0 : ozrParamVal.length;

	String		odiName		= request.getParameter("odiName");
	String[] 	odiParamVal	= request.getParameterValues("odiParamVal");
	int		odiParamCnt	= odiParamVal == null ? 0 : odiParamVal.length;

	Arguments
		String serverUrl
			OZ Servlet 서블릿 URI
		String schedulerIp
			오즈스케줄러 IP
		String schedulerPort
			오즈스케줄러 PORT
		String ozrName
			ozr 파일경로
		String[] ozrParamVal
			폼패러미터 배열
		String[] ozrParamCnt
			폼패러미터 개수
		odiNameString odiName
			odi 파일 명
		String[] odiParamName
			ODI패러미터 배열
		String[] odiParamCnt
			ODI패러미터 개수
		String exportFormat
			파일이 생성될 경로
		String exportFileName
			생성될 파일 명

	Remarks
		api 함수에 대한 prototype 과 추가 예제는 메뉴얼을 참조하세요.
		OZ API Developer's Guide (for Java).pdf
		121 ~ 185 쪽 입니다. (Scheduler Class)
		
	Advanced Work
		다음 라이브러리 파일을 클래스 패스에 추가해 주어야 합니다.
		ozsfw60.jar, log4j.jar
		%OZ_HOME%/WEB-INF/lib 에 있습니다.
******************************************************************************************>
 -->
<%@ page import="oz.scheduler.*,
                 oz.framework.api.*,
                 oz.util.SortProperties,
                 
                 oz.framework.cp.OZCPException,
                 java.util.*"
%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%

	userVO user=(userVO)request.getSession().getAttribute("user_inform");
	String userId=user.getUserId();
	
	String[] week=(String[])request.getAttribute("week");
	String tempJson=(String)request.getAttribute("tempJson");
	
	String		serverUrl	= "http://serverComputer:8888/oz80/server";

	String		schedulerIp	= "serverComputer";
	int		schedulerPort	= Integer.parseInt("9521");

	String		ozrName		= "weeklyReport.ozr";
	String[]	ozrParamVal	= request.getParameterValues("ozrParamVal");
	int		ozrParamCnt	= ozrParamVal == null ? 0 : ozrParamVal.length;

	String		odiName		= "weeklyReport";
	String[] 	odiParamVal	= request.getParameterValues("odiParamVal");
	int		odiParamCnt	= odiParamVal == null ? 0 : odiParamVal.length;

	String		exportFormat	= "ozd";
	String		exportFileName	= userId;
%>
<%
	String 	ozServerID 		= "admin";
	String 	ozServerPW 		= "admin1";
	
  	ServerInfo	serverInfo	= null;
  	SortProperties	configMap	= null;
  	SortProperties	exportMap	= null;
  	Scheduler	scheduler	= null;
  	String		taskID		= "";
	String folderName = "12345";                    // 가정의 변경된 폴더 명

	try {
		Service service = new Service(serverUrl, ozServerID, ozServerPW, false, false);
		scheduler = new Scheduler(schedulerIp, schedulerPort);

		boolean serverAlive	= service.ping();
		boolean schedulerAlive	= scheduler.ping();

		if (serverAlive && schedulerAlive) {

			// 오즈 서버 정보, 계정, 타입
			serverInfo = new ServerInfo();
			serverInfo.setID(ozServerID);
			serverInfo.setPWD(ozServerPW);
			serverInfo.setIsDaemon(false);
			serverInfo.setURL(serverUrl);

			// 오즈 스케줄러 정보 설정
			configMap = new SortProperties();
			
			//configMap = scheduler.getConfiguration(serverInfo); // 스케쥴러 설정을 가져 옴
			
			// 뷰어 패러미터 그대로 사용
			configMap.setProperty("task_type", "viewerTag");
			// 즉시 실행
	 		configMap.setProperty("launch_type", "immediately");
	 		// Task 의 타입 new, edit
			configMap.setProperty("cfg.type", "new");
			
			

			//configMap.setProperty("SchedulerPort", "9521"); // 스케쥴러 포트 재지정
			//scheduler.modifyConfiguration(serverInfo, configMap); // 수정된 설정을 적용

			//// 오즈 스케줄러에 작업 설정
			exportMap = new SortProperties();
			exportMap.setProperty("connection.servlet", serverUrl);

			// 폼패러미터 설정
			exportMap.setProperty("connection.reportname", ozrName);
			exportMap.setProperty("connection.pcount", "3"); // 반드시 3도 스트링으로
			exportMap.setProperty("connection.args1", "week1="+week[0]);
			exportMap.setProperty("connection.args2", "week2="+week[1]);
			exportMap.setProperty("connection.args3", "week3="+week[2]);

			// ODI패러미터 설정
			exportMap.setProperty("odi.odinames", odiName);
			exportMap.setProperty("odi." + odiName + ".pcount", "1");  //반드시 둘다 스트링으로
			for (int i = 0; i < odiParamCnt; i++)
				exportMap.setProperty("odi." + odiName + ".args1", user.getUserNum()+"");

			// 익스포트 정보
			exportMap.setProperty("viewer.mode", "export");
			//exportMap.setProperty("viewer.largebundle", "true");
			exportMap.setProperty("export.mode", "silent");
			exportMap.setProperty("export.confirmsave", "false");
			exportMap.setProperty("export.format", exportFormat);//확장자 ,로 여러개 지정
			exportMap.setProperty("tiff.encode", "JPG");
			exportMap.setProperty("tiff.savemultipage", "true");
			exportMap.setProperty("pdf.fontembedding", "true");
			exportMap.setProperty("ozd.includeedits", "true");
			
			// 추출한 json 값을 보고서에 입히는 패러미터
			exportMap.setProperty("connection.inputjson", tempJson);
			
			//String [] exportFormatA = exportFormat.split(",");	
			
			//exportMap.setProperty("word.filename", exportFileName+".doc");
			exportMap.setProperty("ozd.filename", exportFileName+".ozd");   
			//exportMap.setProperty("pdf.filename", exportFileName+".pdf");
			/*
			for(int i = 0; i < exportFormatA.length; i++){
				if(exportFormatA[i].equals("doc")){
					exportMap.setProperty("word.filename", exportFileName+".doc");
				}else if(exportFormatA[i].equals("xls")){
					exportMap.setProperty("excel.filename", exportFileName+".xls");
				}else if(exportFormatA[i].equals("hml")){
					exportMap.setProperty("han97.filename", exportFileName+".hml");
				}else if(exportFormatA[i].equals("tif")){
					exportMap.setProperty("tiff.filename", exportFileName+".tif");
				}else if(exportFormatA[i].equals("txt")){
					exportMap.setProperty("text.filename", exportFileName+".txt");
				}else if(exportFormatA[i].equals("pdf")){
					exportMap.setProperty("pdf.filename", exportFileName+".pdf");   
				}else{
					exportMap.setProperty(exportFormatA[i]+".filename", exportFileName+"."+exportFormatA[i]);
				}
			}*/
			
			scheduler.directExport(serverInfo, configMap, exportMap);
			
			DirectExportResult t = scheduler.directExport(serverInfo, configMap, exportMap);

			out.println("<div>오즈스케줄러 DirectExport 결과</div>");
			out.println("<table border=1>");
			out.println("<tr><td>태스크 아이디</td><td>" + t.taskID+"</td></tr>");
			out.println("<tr><td>태스크 이름</td><td>" + t.taskName+"</td></tr>");
			out.println("<tr><td>태스크 그룹이름</td><td>" + t.taskGroupName+"</td></tr>");
			out.println("<tr><td>성공여부</td><td>" + t.isSuccessful+"</td></tr>");
			out.println("<tr><td>수행시간</td><td>" + t.executeTime + "sec</td></tr>");
			out.println("<tr><td>완료시간</td><td>" + t.completedTime+"</td></tr>");
			out.println("<tr><td>export파일경로</td><td>" + t.exportFileList+"</td></tr>");
			out.println("<tr><td>보고서명</td><td>" + t.formName+"</td></tr>");
			out.println("<tr><td>익스포트된 페이지 수 </td><td>" + t.pageCount+"</td></tr>");
			out.println("</table>");
			out.println("<div>"+week[0]+week[1]+week[2]+tempJson+"</div>");
/*			
			// 작업 등록
			//taskID = scheduler.createTask(serverInfo, configMap, exportMap);
			
			boolean	isComplete = false;
			
			// 등록된 작업이 수행완료 됐을 때까지 대기
			while (!isComplete) {
				ScheduledTask[] taskList = scheduler.getTask(serverInfo);
				if (taskList.length == 0)
				{
					isComplete = true;
				}
				
				//Timer timer = new Timer();
			        //timer.schedule(new RemindTask(), 0, 1*1000);
			        Thread.sleep(1000);

				for (int i = 0; i < taskList.length; i++) {
					//showTask(taskList[i]);
					//if (taskList[i].status == 'W' || taskList[i].status == 'R')
					if (taskList[i].status == 'W')
					{
						isComplete = true;
					}
				}
			}
			
			// 작업 결과를 확인한다.
			TaskResult[] taskList = scheduler.getTaskResult(serverInfo, "", "", taskID);
				
			for (int i = 0; i < taskList.length; i++) {		
			
			  out.println("createTask 사용");
				out.println("<br/>태스크 아이디 :" + taskList[i].taskID);
				out.println("<br/>성공여부 : " + taskList[i].isSuccessful);
				out.println("<br/>보고서 이름 : " + taskList[i].formFileName);
				
				if (isComplete) {
					out.println("<br/>완료시간 :" + taskList[i].completedTime);
					out.println("<br/>export파일경로 : " + taskList[i].exportFileList);
				}
				else
					out.println("<br/>errorMsg : " + new String(taskList[i].errorMsg.getBytes("8859_1"),"euc_kr"));
				out.println("");
			}
*/
			// 저장된 파일은 스케줄러 서버에 존재하기 때문에 만약 웹어플리케이션이 존재하는 WAS 로 이 파일을 가져오려면
			// 다음과 같이 Publisher 클래스를 사용해서 파일을 전송할 수 있다.
			/*Publisher publisher = null;
			InputStream in = null;
			FileOutputStream out1 = null;
		
			if (new File(result.exportFileList).exists()) {

				// 오즈 스케쥴러에서 PDF 파일을 가져온다
				publisher = new Publisher(schedulerIp, schedulerPort);
				in = new ByteArrayInputStream(publisher.downloadFile(serverInfo, "pdf\\" + exportFileName + "." + exportFormat));

				// 가져온 PDF 파일의 스트림 정보로 새 파일을 생성한다
				out1 = new FileOutputStream(result.exportFileList + "_new");
				int twoByte;
				while ((twoByte = in.read()) != -1)
					out1.write(twoByte);

				in.close();
				out1.close();
			}*/
			
			}
		else {
			if (!serverAlive)
				out.println("OZ Server is dead [" + serverUrl + "]");
			if (!schedulerAlive)
				out.println("<p>OZ Scheduler is dead [" + schedulerIp + ":" + schedulerPort + "]");
		}

	}
	
	catch (OZCPException e) {
		e.printStackTrace();
		return;

	}
%>
<script>
	location.href="../main/mainMenu"
</script>