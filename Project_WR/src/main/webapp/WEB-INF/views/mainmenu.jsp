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
margin: 100px auto;
width: fit-content;
}

#menu_Admin{
margin: 100px auto;
width: fit-content;
}

span a,p a{
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

#menu_User p,#menu_Admin p{
margin: 20px 0px 20px 25px;
}

#menu_User > p.User_writeReport{
margin: 40px 0px 20px 25px; 
}

#menu_Admin > p.Admin_registerUser{
margin: 40px 0px 20px 25px; 
}

#mainmenu_a_img{
    width: fit-content;
    margin: 100px auto 0px;
}
</style>

<body>

<div id="mainmenu_a_img"><a href="/report/main/mainMenu">
<img src="../resources/img/interline_weeklyreport.png" id="mainMenu_logo">
</a></div>

<c:if test='${sessionScope.user_inform.authority == "u"}'>
<div id="menu_User">
<span class="Main_userName">${sessionScope.user_inform.userName}さん</span>
<span class="Main_logOut"><a href="../logout">ログアウト</a></span>
<p class="User_writeReport"><a href="../user/writeReport">報告書作成</a></p>
<p class="User_writeContinue"><a href="../user/keepWriting">作成続き</a></p>
<p class="User_reportList"><a href="../user/myReportList">報告書閲覧</a></p>
<p class="User_profile"><a href="../user/profile">Myプロフィール</a></p>
</div>
</c:if>

<c:if test='${sessionScope.user_inform.authority == "a"}'>
<div id="menu_Admin">
<span class="Main_userName">管理者</span>
<span class="Main_logOut"><a href="../logout">ログアウト</a></span>
<p class="Admin_registerUser"><a href="../admin/registerUser">社員登録</a></p>
<p class="Admin_userList"><a href="../admin/userList">社員リスト</a></p>
<p class="Admin_reportList"><a href="../admin/reportList">報告書リスト</a></p>
</div>
</c:if>

</body>
</html>