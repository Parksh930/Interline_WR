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

						if( user_pw != ""&& user_name != ""){
							$("#profileUpdate").submit();
							alert("修正完了");
						} 

		
		if(user_name == ""){
			alert("名前を入力してください。");
			$("#UserName").focus();
		}else if(user_pw == ""){
			alert("PWを入力してください。");
			$("#Password").focus();
		}
		return false;
	});
	
});



 function pageBack(){
 	location.href = "../main/mainMenu";
 }
 function logout(){
 	location.href = "../logout";
 }

 function formSubmit(page){
 	var pp = document.getElementById('page');
 	
 	pp.value=page;
 							
 	document.location.href = "myReportList?page=" + pp.value;
 }
 
</script>
<style type="text/css">

body{
text-align:center;
}

#profileUd{
margin: 100px auto;
width: fit-content;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.udbtn{
border: solid 2px rgb(0, 112, 192);
border-radius: 9px;
padding: 2px 5px;
background-color: rgb(0, 112, 192);
color: white;
cursor: pointer;
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
<td colspan="2"  id="ubtn"><button id ="udbtn" class="udbtn">修正</button>
<div align="right">

<button class="udbtn" type="button" onclick="pageBack()">メインメニューへ</button>
<input type = "hidden" name="page" id="page" value="1"/>
</div>
</td>
</tr>

</table>
</form>
</div>
</body>
</html>

