<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Login</title>
</head>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
<c:if test="${error!=null && error!=''}">alert("${error}");</c:if>

$(function(){
	$("#login_form").submit(function(){
		var id = $("#login_id").val();
		var pw = $("#login_pw").val();

		if(id !="" && pw != ""){
			return true;
		}
		
		if(id == ""){
			alert("IDを入力してください。");
			$("#login_id").focus();
		}else if(pw == ""){
			alert("PWを入力してください。");
			$("#login_pw").focus();
		}
		return false;
	});
});
</script>
<body>
<form action="login" method="post" id="login_form">
id<input type="text" id="login_id" name="login_id"><br>
pw<input type="password" id="login_pw" name="login_pw">
<input type="submit" value="login" id="btn_login">
</form>
</body>
</html>
