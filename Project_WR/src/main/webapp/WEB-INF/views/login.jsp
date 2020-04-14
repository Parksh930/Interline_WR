<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
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
<style>
#login_div{
margin: 200px auto;
width: fit-content;
}
</style>
<body>
<div id="login_div">
<table>
<tr><th colspan="2" align="left">ログイン Weekly Report</th></tr>
<form action="login" method="post" id="login_form">
<tr>
<td>ID</td>
<td><input type="text" id="login_id" name="login_id"></td>
</tr><tr>
<td>PW</td><td><input type="password" id="login_pw" name="login_pw"></td>
</tr>
<tr><td colspan="2"><input type="submit" value="login" id="btn_login"></td></tr>
</form>
</table>
</div>
</body>
</html>
