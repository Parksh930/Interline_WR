<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="test.interline.report.util.getProperties"%>
<%@page import="java.util.Properties"%>
<%@ page session="false" %>
<% getProperties properties= new getProperties(); %>
<html style="height:100%">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<script src="../resources/js/reportControl.js"></script>
<script src="http://<%out.print(properties.getOzIP());%>/oz80/ozhviewer/jquery-2.0.3.min.js"></script>
<link rel="stylesheet" href="http://<%out.print(properties.getOzIP());%>/oz80/jquery-ui.css" type="text/css"/>
<script src="http://<%out.print(properties.getOzIP());%>/oz80/ozhviewer/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://<%out.print(properties.getOzIP());%>/oz80/ozhviewer/ui.dynatree.css" type="text/css"/>
<script type="text/javascript" src="http://<%out.print(properties.getOzIP());%>/oz80/ozhviewer/jquery.dynatree.js" charset="utf-8"></script>
<script type="text/javascript" src="http://<%out.print(properties.getOzIP());%>/oz80/ozhviewer/OZJSViewer.js" charset="utf-8"></script>
<!-- If you want to run the HTML5SVG viewer please change the OZJSViewer.js to OZJSSVGViewer.js.
<script type="text/javascript" src="http://<%out.print(properties.getOzIP());%>/oz80/ozhviewer/OZJSSVGViewer.js" charset="utf-8"></script>
-->
</head>


<body style="width:98%;height:98%">
	<%@ page import="java.util.*"%>
	<%@page import="test.interline.report.vo.userVO"%>
	<%request.setCharacterEncoding("UTF-8");%>
	<%userVO user=(userVO)request.getSession().getAttribute("user_inform"); %>
	<div id='userNum' ><%out.println(user.getUserId()); %></div>
	<div id="OZViewer" style="width:98%;height:98%"></div>
	<script type="text/javascript" >
		function SetOZParamters_OZViewer(){
			var userId=$('#userNum').html();
			var oz;
			oz = document.getElementById("OZViewer");
			oz.sendToActionScript("connection.servlet","http://<%out.print(properties.getOzIP());%>/oz80/server");
			oz.sendToActionScript("connection.clientcachetype","none");
			oz.sendToActionScript("connection.openfile","http://<%out.print(properties.getOzIP());%>/ozsch80/Repository/ozd/"+userId+".ozd");
			return true;
		}
		start_ozjs("OZViewer","http://<%out.print(properties.getOzIP());%>/oz80/ozhviewer/");
	
		function OZUserEvent_OZViewer(param1, param2, param3) {
			if(param3=="save"){
				$('#tempJson').val(param1);
				var weeks=JSON.parse(param2);
	
				$('#week1').val(weeks.week1);
				$('#week2').val(weeks.week2);
				$('#week3').val(weeks.week3);
				//console.log($('#tempJson').val());
				document.getElementById('saveOZD').submit();
			}else if(param3=="submit"){
				var jsonSet=makeJsonForSubmit(JSON.parse(param1));
				$('#submitJsonReport').val(JSON.stringify(jsonSet[0]));
				$('#submitJsonContents').val(JSON.stringify(jsonSet[1]));
				var submitConfirm=confirm("提出しまｓか？");
				if(submitConfirm==true){
					document.getElementById('submitReport').submit();
				}
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