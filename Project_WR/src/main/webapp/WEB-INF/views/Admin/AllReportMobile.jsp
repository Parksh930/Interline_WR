<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html style="height: 100%">
<script>
	function pagechange() {

		location.href = "reportList";

	}
</script>

<head>
	<title>ReadReport</title>
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
	<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"/>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://dev.jtsage.com/cdn/simpledialog/latest/jquery.mobile.simpledialog.min.css"/>
	<script type="text/javascript" src="http://dev.jtsage.com/cdn/simpledialog/latest/jquery.mobile.simpledialog2.min.js"></script>
	
	<link rel="stylesheet" href="http://192.168.1.79:8888/oz80/ozhviewer/ui.dynatree.css" type="text/css"/>
	<script type="text/javascript" src="http://192.168.1.79:8888/oz80/ozhviewer/jquery.dynatree.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://192.168.1.79:8888/oz80/ozhviewer/OZJSViewer.js" charset="utf-8"></script>
	<!-- <script type="text/javascript" src="http://192.168.0.103:8888/ozrviewer/OZJSSVGViewer.js" charset="utf-8"></script> -->

	<script src="http://192.168.1.79:8888/oz80/ozhviewer/jquery.mouseSwipe.js" type="text/javascript"></script>
</head>


<body style="width: 98%; height: 98%">
	<div id="OZViewer" style="width: 98%; height: 98%"></div>

	<script> 

	
		function SetOZParamters_OZViewer() {
			var oz;
			oz = document.getElementById("OZViewer");
			oz.sendToActionScript("connection.servlet",
					"http://192.168.1.79:8888/oz80/server");
			oz.sendToActionScript("connection.reportname", "OSA/interlineTest2.ozr");
			oz.sendToActionScript("global.language", "ja");
			oz.sendToActionScript("odi.odinames", "interlineTest2");
			return true;
		}
		start_ozjs("OZViewer", "http://192.168.1.79:8888/oz80/ozhviewer/", true);
	</script>


</body>
</html>
