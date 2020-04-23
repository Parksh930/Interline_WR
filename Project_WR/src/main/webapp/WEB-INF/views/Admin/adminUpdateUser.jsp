<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_updateUser</title>
<style type="text/css">
body{
text-align:center;
}

#UserNum, #UserId{
border: none;
cursor: context-menu;
}

#UserNum:focus, #UserId:focus { 
outline:none; 
}
</style>
</head>
<body>
<h1>社員情報修正</h1>

<div id = "registerUser_contents">
<form action="" method="post" id="registerUser_Form">
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
<td style="text-align: left;"><select name="Authority">
	<option value="a">管理者</option>
	<option value="u" selected="selected">社員</option>
</select></td>
</tr>
<tr>
<td colspan="2"><button id="insert_User_btn">社員登録</button>
<a href="../admin/userList">戻し</a>
</td>
</tr>
</table>
</form>
</div>
</body>
</html>