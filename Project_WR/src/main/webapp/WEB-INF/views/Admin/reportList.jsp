<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReportList</title>
</head>
<script>

function pageBack(){

	location.href = "mainMenu";
	
}

function formSubmit(page){
	var p = document.getElementById('page');
	
	p.value=page;
							
	document.location.href = "reportList?page=" + p.value;
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
}

a{
text-decoration: none;


}
</style>

<body>
<h1>報告書リスト</h1>

<div id="report_List">
<table>
<tr>
<th class="Reportlist_userNum">社員番号</th><th class="Reportlist_userName">名前</th>
<th class="Reportlist_Location">現場</th><th class="Reportlist_Days">日付</th>
</tr>
<c:forEach var = "report_List" items="${report_all}">
<tr>
<td class="Reportlist_userNum">${report_List.user_Num}</td>
<td class="Reportlist_userName">${report_List.user_Name}</td>
<td class="Reportlist_Location">${report_List.location}</td>
<td class="Reportlist_Days"><fmt:formatDate pattern="yyyy.MM.dd" value="${report_List.startWeek}"/>
~
<fmt:formatDate pattern="MM.dd" value="${report_List.endWeek}"/></td>
<td class="Reportlist_reportNum"><a class="Read_Btn" href="readReport?reportNum=${report_List.reportNum}">閲覧</a></td>
</tr>
</c:forEach>
</table>
<div id = "navigator">
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
<div align="right">
<button class="Read_Btn" type="button" onclick="pageBack()">メインメニューへ</button>
</div>
<input type = "hidden" name="page" id="page" value="1"/>
</div>
</body>
</html>