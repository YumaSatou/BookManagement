<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.UserMouth" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>口コミ投稿一覧</title>

</head>
<body>

	<h2>口コミ投稿一覧</h2>
	<table border="1">
		<tr>
			<th>図書名</th>
			<th>姓</th>
			<th>口コミ</th>
			<th>評価</th>
			<th>投稿日時</th>
			<th></th>
		</tr>
	
		<%
		List<UserMouth> UserMouthList = (List<UserMouth>)request.getAttribute("UserMouthList");
		for(UserMouth mm : UserMouthList){
		%>
		
		<tr>
			<td ><%=mm.getBook_name() %></td>
			<td ><%=mm.getSurname() %></td>
			<td ><%=mm.getWord_mouth() %></td>
			<td ><%=mm.getAssessment() %></td>
			<td ><%=mm.getCreated_at() %></td>
			<td>
				<form action="MouthDeleteServlet" method="post">
					<input type="hidden" name="mouth_id" value="<%=mm.getMouth_id() %>">
					<input type="submit" value="投稿削除">
				</form>
			</td>
		</tr>
		<%
		}
		%>
		</table>
		<h2><a href="TopServlet">戻る</a></h2>
		
</body>
</html>