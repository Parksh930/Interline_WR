<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainMenu</title>
</head>
<body>
<div>${sessionScope.login_id}</div>

<c:if test='${sessionScope.user_inform.authority == "u"}'>
<a>報告書作成</a><br>
<a>作成続き</a><br>
<a>報告書閲覧</a>	
</c:if>

<c:if test='${sessionScope.user_inform.authority == "a"}'>
<a href=./ReportList>全報告書閲覧</a>
</c:if>
</body>
</html>