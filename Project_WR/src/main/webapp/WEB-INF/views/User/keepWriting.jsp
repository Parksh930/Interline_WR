<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html style="height:100%">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<script src="http://serverComputer:8888/oz80/ozhviewer/jquery-2.0.3.min.js"></script>
<link rel="stylesheet" href="http://serverComputer:8888/oz80/jquery-ui.css" type="text/css"/>
<script src="http://serverComputer:8888/oz80/ozhviewer/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://serverComputer:8888/oz80/ozhviewer/ui.dynatree.css" type="text/css"/>
<script type="text/javascript" src="http://serverComputer:8888/oz80/ozhviewer/jquery.dynatree.js" charset="utf-8"></script>
<script type="text/javascript" src="http://serverComputer:8888/oz80/ozhviewer/OZJSViewer.js" charset="utf-8"></script>
<!-- If you want to run the HTML5SVG viewer please change the OZJSViewer.js to OZJSSVGViewer.js.
<script type="text/javascript" src="http://serverComputer:8888/oz80/ozhviewer/OZJSSVGViewer.js" charset="utf-8"></script>
-->
</head>
<body style="width:98%;height:98%">
<%@ page import="java.util.*"%>
<%@page import="test.interline.report.vo.userVO"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%userVO user=(userVO)request.getSession().getAttribute("user_inform"); %>
<div id='userNum' ><%out.println(user.getUserId()); %></div>
<div id="OZViewer" style="width:98%;height:98%"></div>
<script type="text/javascript" >
	function SetOZParamters_OZViewer(){
		var userId=$('#userNum').html();
		var oz;
		oz = document.getElementById("OZViewer");
		oz.sendToActionScript("connection.servlet","http://serverComputer:8888/oz80/server");
		oz.sendToActionScript("connection.openfile","http://serverComputer:8888/ozsch80/Repository/ozd/"+userId+".ozd");
		return true;
	}
	start_ozjs("OZViewer","http://serverComputer:8888/oz80/ozhviewer/");
</script>
</body>
</html>