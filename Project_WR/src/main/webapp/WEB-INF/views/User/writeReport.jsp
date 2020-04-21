<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%">
<head>
	<meta charset="utf8" http-equiv="X-UA-Compatible" content="IE=edge"/>
	<script src="../resources/js/reportControl.js"></script>
	<script src="http://serverComputer:8888/oz80/ozhviewer/jquery-2.0.3.min.js"></script>
	<link rel="stylesheet" href="http://serverComputer:8888/oz80/ozhviewer/jquery-ui.css" type="text/css"/>
	<script src="http://serverComputer:8888/oz80/ozhviewer/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="http://serverComputer:8888/oz80/ozhviewer/ui.dynatree.css" type="text/css"/>
	<script type="text/javascript" src="http://serverComputer:8888/oz80/ozhviewer/jquery.dynatree.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://serverComputer:8888/oz80/ozhviewer/OZJSViewer.js" charset="utf-8"></script>
	<!-- If you want to run the HTML5SVG viewer please change the OZJSViewer.js to OZJSSVGViewer.js.
	<script type="text/javascript" src="http://serverComputer:8888/oz80/ozhviewer/OZJSSVGViewer.js" charset="utf-8"></script>
	-->
</head>
<body style="width:98%;height:98%">
	<div id='userNum' style="display:none;">${sessionScope.user_inform.userNum}</div>
	<div id="OZViewer" style="width:98%;height:98%"></div>
	<script type="text/javascript" >
		var today = new Date();
		var day = today.getDay();
		var period=[];
		var monday = new Date(today.setDate(today.getDate()-(day-1)));
		var friday = new Date(today.setDate(today.getDate()+4));
		period.push(generateDate(monday,friday));
		monday.setDate(monday.getDate()-7);
		friday.setDate(friday.getDate()-7);
		period.push(generateDate(monday,friday));
		monday.setDate(monday.getDate()-7);
		friday.setDate(friday.getDate()-7);
		period.push(generateDate(monday,friday));
		console.log(period);
		
	
	 	//input null
	 	//
	 	//오즈를 뷰어호출 소스
		function SetOZParamters_OZViewer(){
			var userNum=$('#userNum').html();
			var oz;
			oz = document.getElementById("OZViewer");
			oz.sendToActionScript("connection.servlet","http://serverComputer:8888/oz80/server");
			oz.sendToActionScript("connection.reportname","weeklyReport.ozr");
			oz.sendToActionScript("connection.pcount","3");
			oz.sendToActionScript("connection.args1","week1="+period[0]);
			oz.sendToActionScript("connection.args2","week2="+period[1]);
			oz.sendToActionScript("connection.args3","week3="+period[2]);
	
			oz.sendToActionScript("odi.odinames", "weeklyReport");
			oz.sendToActionScript("odi.weeklyReport.pcount", "1");
			oz.sendToActionScript("odi.weeklyReport.args1", "userNum="+userNum);
			
			return true;
		}
		start_ozjs("OZViewer","http://serverComputer:8888/oz80/ozhviewer/");
	
		//input (string,string,string)
		//return json
		//오즈내의 버튼이 클릭되면 실행된다. 오즈에서 일률적으로 뿌려주는 데이터를 정리하는 함수
		function OZUserEvent_OZViewer(param1, param2, param3) {
			if(param3=="save"){
				$('#tempJson').val(param1);
				$('#week1').val(period[0]);
				$('#week2').val(period[1]);
				$('#week3').val(period[2]);
				console.log($('#tempJson').val());
				document.getElementById('saveOZD').submit();
			}else if(param3=="submit"){
				var jsonSet=makeJsonForSubmit(JSON.parse(param1));
				$('#submitJsonReport').val(JSON.stringify(jsonSet[0]));
				$('#submitJsonContents').val(JSON.stringify(jsonSet[1]));
				document.getElementById('submitReport').submit();
			}else if(param3=="cancel"){
				location.href="../main/mainMenu";
			}
		}
	</script>

	<form id="saveOZD" action="saveOZD">
		<input id="tempJson" type="hidden" name="tempJson" value="">
		<input id="week1" type="hidden" name="week" value="">
		<input id="week2" type="hidden" name="week" value="">
		<input id="week3" type="hidden" name="week" value="">
	</form>
	<form id="submitReport" action="submitReport">
		<input id="submitJsonReport" type="hidden" name="submitJsonReport" value="">
		<input id="submitJsonContents" type="hidden" name="submitJsonContents" value="">
	</form>
</body>
</html>
