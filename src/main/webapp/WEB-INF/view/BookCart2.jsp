<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.* ,java.util.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.UserList" %>
<%
BookCart bookcart = (BookCart)session.getAttribute("bookcart");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/BookCart2.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>貸出候補画面</title>
</head>
<body>
	<%
	UserList user_account = (UserList)session.getAttribute("user_account");
	%>

	<h2>モリジョビ図書館</h2>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class ="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
      <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            管理者管理
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="RegisterFormServlet">管理者登録</a></li>
            <li><a class="dropdown-item" href="LogoutServlet">管理者ログアウト</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            図書管理
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="RegisterLibraryServlet">図書登録</a></li>
            <li><a class="dropdown-item" href="SearchServlet">図書検索</a></li>
            <li><a class="dropdown-item" href="UpdateLibraryServlet">新→旧更新</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="BookLendinListServlet">貸出中図書一覧</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="BookHistoryServlet">図書貸出履歴</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">口コミ一覧</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<br><br><br>
	
	<p><%=user_account.getName() %>さんのカート</p>
	<form action="CartBookSearchServlet" method="post">
	図書検索　　図書名　<input type="text" name="name"><br><br>
	<input type="submit" value="検索"><br>
	</form>
	
	
	<table class="table table-striped mt-4">
    <tr><th>ID</th><th>図書名</th><th>ISBN</th></tr>
	<%for(Cart v:bookcart.getList()) {%>
	<tr>
		<td><%=v.getBook_id() %></td>
		<td><%=v.getName() %></td>
		<td><%=v.getIsbn() %></td>
	</tr>
	<%} %>
	
	<form action="CartBookRegisterServlet" method="post">
	<input type="submit" value="貸出"><br>
	</form>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>