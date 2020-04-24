<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_updateUser</title>
<script src="<c:url value = '../resources/js/jquery-2.0.3.min.js'/>"></script>
<script>
$(function(){

	$("#insert_User_btn").click(update_user);
	$("#delete_User_btn").click(delete_user);
	option_selected();
	
});

function option_selected(){
	
	$("#Authority option[value="+"${get_user.authority}"+"]").prop('selected','selected');
	
}

function update_user(){
	if(confirm("修正しましか？")){
		return true;
	}else{
		return false;
	}
}

function delete_user(){
	
	var num = $("#UserNum").val();

	if(confirm("削除しましか？")){
		location.replace("../admin/deleteUser?UserNum="+num);
	}
	return false;
}
</script>
<style type="text/css">
body{
text-align:center;
}

a{
text-decoration: none;
}

#tr_btn{
height: 50px;
}

#registerUser_contents{
margin: 100px auto;
width: fit-content;
}

#UserNum, #UserId{
border: none;
cursor: context-menu;
}

#UserNum:focus, #UserId:focus,#insert_User_btn:focus,#delete_User_btn:focus { 
outline:none; 
}

.admin_update_btn{
text-align: right;
}

#insert_User_btn,#delete_User_btn{
border: solid 2px rgb(0, 112, 192);
border-radius: 9px;
padding: 2px 5px;
background-color: rgb(0, 112, 192);
color: white;
cursor: pointer;
}

.return_Btn{
border: solid 2px rgb(0, 0, 0);
border-radius: 9px;
padding: 2px 5px;
color: black;
cursor: pointer;
}

</style>
</head>
<body>
<h1>社員情報修正</h1>

<div id = "registerUser_contents">
<form action="../admin/updateUser" method="post" id="updateUser_Form">
<table>
<tr>
<td>社員番号</td>
<td><input type="number" id="UserNum" name="UserNum" value="${get_user.userNum}" readonly></td>
</tr>
<tr>
<td>ID</td>
<td><input type="text" id="UserId" name="UserId" value="${get_user.userId}" readonly></td>
</tr>
<tr>
<td>PW</td>
<td><input type="password" id="Password" name="Password"></td>
</tr>
<tr>
<td>社員名</td>
<td><input type="text" id="UserName" name="UserName" value="${get_user.userName}"></td>
</tr>
<tr>
<td>権限</td>
<td style="text-align: left;"><select name="Authority" id="Authority">
	<option value="a">管理者</option>
	<option value="u" selected="selected">社員</option>
</select></td>
</tr>
<tr id="tr_btn"><td colspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="insert_User_btn">修正</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="delete_User_btn">削除</button>
</td></tr>
<tr id="tr_btn"><td colspan="2" class="admin_update_btn">
<a href="../admin/userList" class="return_Btn">社員リストへ</a>&nbsp;&nbsp;
</td></tr>
</table>
</form>
</div>
</body>
</html>