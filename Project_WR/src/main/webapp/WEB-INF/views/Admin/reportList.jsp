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
<body>

<table border=1>
<tr>
<th>社員番号</th><th>名前</th><th>現場</th><th>日付</th>
</tr>
<c:forEach var = "report_List" items="${report_all}">
<tr>
<td>${report_List.user_Num}</td><td>${report_List.user_Name}</td>
<td>${report_List.location}</td>
<td><fmt:formatDate pattern="yyyy.MM.dd" value="${report_List.startWeek}"/>
~
<fmt:formatDate pattern="MM.dd" value="${report_List.endWeek}"/></td>
<td><a href="ReadReport?reportNum=${report_List.reportNum}">閲覧</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>