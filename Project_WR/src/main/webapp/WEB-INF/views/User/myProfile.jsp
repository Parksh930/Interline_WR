<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyProfile</title>
</head>
<script src="<c:url value = '../resources/js/jquery-2.0.3.min.js'/>"></script>
<script>
 $(function(){
	$("#udbtn").click(function(){
		var user_name = $("#UserName").val();
		var user_pw = $("#Password").val();

						$('#profileUpdate').submit();	
		

		
		}else if(name == ""){
			alert("名前を入力してください。");
			$("#UserName").focus();
		}else if(pw == ""){
			alert("PWを入力してください。");
			$("#Password").focus();
		}
		return false;
	});
	
});
 
</script>
<style type="text/css">

body{
text-align:center;
}

#registerUser_contents{
margin: 100px auto;
width: fit-content;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

</style>
<body>
<h1>Myプロフィール</h1>

<div id = "profileUd">
<form action="../user/profile" method="post" id="profileUpdate">
<table>
<tr>
<td>名前</td>
<td><input type="text" id="UserName" name="UserName"></td>
</tr>

<tr>
<td>PW</td>
<td><input type="password" id="Password" name="Password"></td>
</tr>

<tr>
<td colspan="2"><button id="udbtn">修正</button>
</td>
</tr>

</table>
</form>
</div>
</body>
</html>

