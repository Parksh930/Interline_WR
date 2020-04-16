<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainMenu</title>
</head>

<style>
#menu_User{
margin: 200px auto;
width: fit-content;
}

#menu_Admin{
margin: 200px auto;
width: fit-content;
}

a{
border: solid 2px rgb(0, 112, 192);
border-radius: 9px;
padding: 2px 5px;
background-color: rgb(0, 112, 192);
color: white;
text-decoration: none;
}

.Main_userName{
font-size: 25px;
}

.Main_logOut{
margin: 0px 0px 0px 20px;
}

.Admin_reportList{
margin: 40px 0px 20px 25px;
}

#menu_User p{
margin: 20px 0px 20px 25px;
}

#menu_User > p.User_writeReport{
margin: 40px 0px 20px 25px; 
}

</style>
<body>

<c:if test='${sessionScope.user_inform.authority == "u"}'>
<div id="menu_User">
<span class="Main_userName">${sessionScope.user_inform.userName}さん</span>
<span class="Main_logOut"><a href=./logout>ログアウト</a></span>
<p class="User_writeReport"><a href="./writeReport">報告書作成</a></p>
<p class="User_writeContinue"><a>作成続き</a></p>
<p class="User_reportList"><a href="./myReportList">報告書閲覧</a></p>
</div>
</c:if>

<c:if test='${sessionScope.user_inform.authority == "a"}'>
<div id="menu_Admin">
<span class="Main_userName">管理者</span>
<span class="Main_logOut"><a href=./logout>ログアウト</a></span>
<p class="Admin_reportList"><a href=./ReportList>報告書リスト</a></p>
</div>
</c:if>

</body>
</html>