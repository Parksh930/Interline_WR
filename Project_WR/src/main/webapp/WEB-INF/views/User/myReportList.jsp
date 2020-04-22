<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyReportList</title>
</head>


<script>

function pageBack(){

	location.href = "../main/mainMenu";
	
}

function formSubmit(pg){
	var pp = document.getElementById('pg');
	
	pp.value=pg;
							
	document.location.href = "myReport?pg=" + pp.value;
}
</script>

<style>
body{
text-align:center;
}

#report_List{
margin: 50px auto;
width: fit-content;
}

#navigator{
text-align: center;
margin: 20px 0px 0px 0px;
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

.Reportlist_userNum,.Reportlist_userName,.Reportlist_Location{
width: 100px;
}

.Reportlist_Days{
width: 150px;
}

.Reportlist_reportNum{
border-style: none;
width:50px;
}

.Read_Btn{
border: solid 2px rgb(0, 112, 192);
border-radius: 9px;
padding: 2px 5px;
background-color: rgb(0, 112, 192);
color: white;
cursor: pointer;
}

a{
text-decoration: none;
}
</style>


<body>
<h1>My報告書リスト</h1>

<div id="report_List">
<table>
<tr>
<th class="Reportlist_userNum">社員番号</th><th class="Reportlist_userName">名前</th>
<th class="Reportlist_Location">現場</th><th class="Reportlist_Days">日付</th>
</tr>
<c:forEach var = "report_List" items="${report_my}">
<tr>
<td class="Reportlist_userNum">${report_List.user_Num}</td>
<td class="Reportlist_userName">${report_List.user_Name}</td>
<td class="Reportlist_Location">${report_List.location}</td>
<td class="Reportlist_Days"><fmt:formatDate pattern="yyyy.MM.dd" value="${report_List.startWeek}"/>
~
<fmt:formatDate pattern="MM.dd" value="${report_List.endWeek}"/></td>
<td class="Reportlist_reportNum"><a class="Read_Btn" href="myReport?reportNum=${report_List.reportNum}">閲覧</a></td>
</tr>
</c:forEach>
</table>
<div id = "navigator">
<a href="javascript:formSubmit(${pn.currentPage - pn.pagePerGroup})">◁◁</a>&nbsp;
<a href="javascript:formSubmit(${pn.currentPage-1})">◀</a> &nbsp;&nbsp;

<c:forEach var="counter" begin="${pn.startPageGroup}" end="${pn.endPageGroup}">
<c:if test="${counter == pn.currentPage}"><b></c:if>
<a href="javascript:formSubmit(${counter})">${counter}</a>&nbsp;
<c:if test="${counter == pn.currentPage}"></b></c:if>
</c:forEach>
&nbsp;&nbsp;
<a href="javascript:formSubmit(${pn.currentPage + 1})">▶</a> &nbsp;&nbsp;
<a href="javascript:formSubmit(	${pn.currentPage + pn.pagePerGroup})">▷▷</a>
</div>
<div align="right">
<button class="Read_Btn" type="button" onclick="pageBack()">メインメニューへ</button>
<input type = "hidden" name="page" id="pg" value="1"/>
</div>


</body>
</html>