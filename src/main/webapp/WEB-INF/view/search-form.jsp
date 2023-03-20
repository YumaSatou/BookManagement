<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書検索</title>
</head>
<body>
	
	<form action="SearchBookServlet" method="post">
	<h2>検索する図書名を入力してください</h2>
	<h2 >図書名：<input type="text" name="name"></h2><br>
	<input type="submit" value="検索"><br>
	</form>
	<h2><a href="TopServlet">戻る</a></h2>
</body>
</html>