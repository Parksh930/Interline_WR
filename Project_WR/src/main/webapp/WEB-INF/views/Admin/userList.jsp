<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userList</title>
<script>
function formSubmit(page){
	var p = document.getElementById('page');
	p.value=page;
	document.location.href = "userList?page=" + p.value;
}
</script>
<style>
body{
text-align:center;
}

a{
text-decoration: none;
}

table {
  border-collapse: collapse;
}

tr{
height: 45px;
}

th,td{
border: 1px solid black;
}

#navigator{
text-align: center;
margin: 20px 0px 0px 0px;
}

#user_List{
margin: 50px auto;
width: fit-content;
}

.Userlist_updateBtn{
border-style: none;
width:50px;
}

.Update_Btn{
border: solid 2px rgb(0, 112, 192);
border-radius: 9px;
padding: 2px 5px;
background-color: rgb(0, 112, 192);
color: white;
cursor: pointer;
}

.Userlist_userNum,.Userlist_userId,.Userlist_userName{
width: 100px;
}

.return_Btn{
border: solid 2px rgb(0, 112, 192);
border-radius: 9px;
padding: 2px 5px;
background-color: rgb(0, 112, 192);
color: white;
cursor: pointer;
}

#div_Return_Btn{
text-align: right;
margin: 20px 0px 0px 0px;
}

</style>
</head>
<body>
<h1>社員リスト</h1>
<div id ="user_List">
<table>
<tr>
<th class="Userlist_userNum">社員番号</th><th class="Userlist_userId">社員ID</th>
<th class="Userlist_userName">社員名</th>
</tr>
<c:forEach var = "user_List" items="${user_all}">
<tr>
<td class="Userlist_userNum">${user_List.userNum}</td>
<td class="Userlist_userId">${user_List.userId}</td>
<td class="Userlist_userName">${user_List.userName}</td>
<td class="Userlist_updateBtn"><a class="Update_Btn" href="updateUser?Num=${user_List.userNum}">修正</a></td>
</tr>
</c:forEach>
</table>
<div id = "navigator">
<input type = "hidden" name="page" id="page" value="1"/>
<a href="javascript:formSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁</a>&nbsp;
<a href="javascript:formSubmit(${navi.currentPage-1})">◀</a> &nbsp;&nbsp;

<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
<c:if test="${counter == navi.currentPage}"><b></c:if>
<a href="javascript:formSubmit(${counter})">${counter}</a>&nbsp;
<c:if test="${counter == navi.currentPage}"></b></c:if>
</c:forEach>
&nbsp;&nbsp;
<a href="javascript:formSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
<a href="javascript:formSubmit(	${navi.currentPage + navi.pagePerGroup})">▷▷</a>
</div>
<div id="div_Return_Btn">
<a href="../main/mainMenu" class="return_Btn">メインメニューへ</a>
</div>
</div>
</body>
</html>