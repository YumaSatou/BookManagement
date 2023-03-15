<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>

<header>
	<h1>図書管理システム</h1>
</header>
	<%
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("error") != null){	
	%>
		<h2 style="color:red">ログイン失敗</h2>
	<form action="LoginServlet" method="post">
	
		ログインID：<input type="text" name="mail" value="<%=request.getParameter("mail") %>"><br>
		PW：<input type="password" name="pw"><br>
		<input type="submit" value="ログイン"><br>
	<a href="RegisterFormServlet">新規登録はこちら</a>
	</form>
	<%
		} else {
	%>
	<form action="LoginServlet" method="post">
	
		ログインID：<input type="text" name="mail"><br>
		PW：<input type="password" name="pw"><br>
		<input type="submit" value="ログイン"><br>
	<a href="RegisterFormServlet">新規登録はこちら</a>
		
	</form>
	
	<%
		}
	%>
</body>
</html>