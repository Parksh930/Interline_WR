<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterUser</title>
</head>
<body>
<form action="registerUser" method="post">
<table>
<tr>
<td>社員番号</td>
<td><input type="text" id="UserNum" name="UserNum"></td>
</tr>
<tr>
<td>ID</td>
<td><input type="text" id="UserId" name="UserId"></td>
</tr>
<tr>
<td>PW</td>
<td><input type="password" id="Password" name="Password"></td>
</tr>
<tr>
<td>社員名</td>
<td><input type="text" id="UserName" name="UserName"></td>
</tr>
<tr>
<td>権限</td>
<td><select name="Authority">
	<option value="a">管理者</option>
	<option value="u">社員</option>
</select></td>
</tr>
<tr>
<td colspan="2"><input type="submit" value="社員登録"></td>
</tr>
</table>
</form>
</body>
</html>

