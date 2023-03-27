<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>ログイン画面</title>
</head>
<body>

<h2>モリジョビ図書館</h2>

<header>
	<h1>図書管理システム</h1><br><br>
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
	
		ログインID：<input type="text" name="mail"><br><br><br>
		PW：<input type="password" name="pw"><br><br>
		<input type="submit" value="ログイン"><br><br>
	<a href="RegisterFormServlet">新規登録はこちら</a>
		
	</form>
	
	<%
		}
	%>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>