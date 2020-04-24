<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterUser</title>
</head>
<script src="<c:url value = '../resources/js/jquery-2.0.3.min.js'/>"></script>
<script>
 $(function(){
	$("#insert_User_btn").click(function(){
		var user_num = $("#UserNum").val();
		var user_id = $("#UserId").val();
		var user_pw = $("#Password").val();
		var user_name = $("#UserName").val();

 		if(user_num !="" && user_id != ""&& user_pw != ""&& user_name != ""){

			$.ajax({
				type:"post",
				url:"check_multiple",
				data:{userNum:user_num,userId:user_id},
				dataType:"text",
				success:function(result){


					if(result != "成功"){
						alert(result);						
					}else if(confirm("登録しましか？")){
							$('#registerUser_Form').submit();			
					} 
				}
			});
		} 

		if(user_num == ""){
			alert("社員番号を入力してください。");
			$("#UserNum").focus();
		}else if(user_id == ""){
			alert("IDを入力してください。");
			$("#UserId").focus();
		}else if(user_pw == ""){
			alert("PASSWORDを入力してください。");
			$("#Password").focus();
		}else if(user_name == ""){
			alert("社員名を入力してください。");
			$("#UserName").focus();
		}
		return false;
	});
	
});
 
</script>
<style type="text/css">

body{
text-align:center;
}

a{
text-decoration: none;
}

#insert_User_btn{
border: solid 2px rgb(0, 112, 192);
border-radius: 9px;
padding: 2px 5px;
background-color: rgb(0, 112, 192);
color: white;
cursor: pointer;
}

.return_Btn{
border: solid 2px rgb(0, 0, 0);
border-radius: 9px;
padding: 2px 5px;
color: black;
cursor: pointer;
}

#registerUser_contents{
margin: 100px auto;
width: fit-content;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#tr_btn{
height: 50px;
}

</style>
<body>
<h1>社員登録</h1>

<div id = "registerUser_contents">
<form action="../admin/registerUser" method="post" id="registerUser_Form">
<table>
<tr>
<td>社員番号</td>
<td><input type="number" id="UserNum" name="UserNum"></td>
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
<td style="text-align: left;"><select name="Authority">
	<option value="a">管理者</option>
	<option value="u" selected="selected">社員</option>
</select></td>
</tr>
<tr>
<td colspan="2" id="tr_btn"><button id="insert_User_btn">社員登録</button>
<a href="../main/mainMenu" class="return_Btn">メインメニューへ</a>
</td>
</tr>
</table>
</form>
</div>
</body>
</html>

