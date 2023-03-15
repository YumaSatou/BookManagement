<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書登録</title>
</head>
<body>
	
	<% 
		String error = request.getParameter("error");
		if(error != null){
			
	%>
		<p style="color:red">登録に失敗しました。</p>
		<h1>図書登録</h1>
		<form action="RegisterLibraryExecuteServlet" method="post">
			図書名：<input type="text" name="book_name" value="<%=request.getParameter("book_name") %>"><br>
			出版社：<input type="text" name="publisher" value="<%=request.getParameter("company") %>"><br>
			ISBN：<input type="text" name="isbn"><br>
			著者：<input type="text" name="author"><br>
			新旧：<input type="radio" name="new_oid" value="新">新
				　<input type="radio" name="new_old" value="旧">旧<br>
			格納エリア：<input type="text" name="house"><br>
		
			<input type="submit" value="登録">
		
		</form>
	<%	
		} else {
	%>
	<h1>図書登録</h1>
	<form action="RegisterLibraryExecuteServlet" method="post">
		図書名：<input type="text" name="name"><br>
		出版社：<input type="text" name="publisher"><br>
		ISBN：<input type="text" name="isbn"><br>
		著者：<input type="text" name="author"><br>
		新旧：<input type="radio" name="new_old" value="新">新
				　<input type="radio" name="new_old" value="旧">旧<br>
		格納エリア：<input type="text" name="house"><br>
		
		<input type="submit" value="登録">
	
	</form>
	<% } %>
	<h2><a href="TopServlet" style="color:black">戻る</a></h2>
</body>
</html>