<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userList</title>

<style>
body{
text-align:center;
}

#user_List{
margin: 50px auto;
width: fit-content;
}
</style>
</head>
<body>
<h1>社員リスト</h1>
<div id ="user_List">
<table>
<tr>
<th class="Userlist_userNum">社員番号</th><th class="Userlist_userName">社員ID</th>
<th class="Userlist_Location">社員名</th>
</tr>
<c:forEach var = "user_List" items="${user_all}">
<tr>
<td class="Userlist_userNum">${user_List.userNum}</td>
<td class="Userlist_userName">${user_List.userId}</td>
<td class="Userlist_Location">${user_List.userName}</td>
<td class="Userlist_reportNum"><a class="Read_Btn" href="updateUser?Num=${user_List.userNum}">修正</a></td>
</tr>
</c:forEach>
</table>
</div>
<div>
<a href="../main/mainMenu">戻し</a>
</div>
</body>
</html>