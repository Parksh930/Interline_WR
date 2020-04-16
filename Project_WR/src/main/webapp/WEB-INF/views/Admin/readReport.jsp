<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html style="height: 100%">
<script>
	function pagechange() {

		location.href = "ReportList";

	}
</script>

<meta charset="utf8" http-equiv="X-UA-Compatible" content="IE=edge"/>
<script src="http://serverComputer:8888/oz80/ozhviewer/jquery-2.0.3.min.js"></script>
<link rel="stylesheet" href="http://serverComputer:8888/oz80/ozhviewer/jquery-ui.css" type="text/css"/>
<script src="http://serverComputer:8888/oz80/ozhviewer/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://serverComputer:8888/oz80/ozhviewer/ui.dynatree.css" type="text/css"/>
<script type="text/javascript" src="http://serverComputer:8888/oz80/ozhviewer/jquery.dynatree.js" charset="utf-8"></script>
<script type="text/javascript" src="http://serverComputer:8888/oz80/ozhviewer/OZJSViewer.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="http://192.168.0.103:8888/ozrviewer/OZJSSVGViewer.js" charset="utf-8"></script> -->

<head>
<title>ReadReport</title>
</head>
<body style="width: 98%; height: 98%">
	<div id="OZViewer" style="width: 98%; height: 98%"></div>

	<script>

	var ReportdataVO = "Reportdata="+"${ReportNumValue}";
	
		function SetOZParamters_OZViewer() {
			var oz;
			oz = document.getElementById("OZViewer");
			oz.sendToActionScript("connection.servlet",
					"http://serverComputer:8888/oz80/server");
			oz.sendToActionScript("connection.reportname", "OSA/report3.ozr");
			oz.sendToActionScript("odi.odinames", "TestProject2");
			oz.sendToActionScript("odi.TestProject2.pcount","1");
			oz.sendToActionScript("odi.TestProject2.args1",ReportdataVO);
			return true;
		}
		start_ozjs("OZViewer", "http://serverComputer:8888/oz80/ozrviewer/");
	</script>


</body>
</html>
