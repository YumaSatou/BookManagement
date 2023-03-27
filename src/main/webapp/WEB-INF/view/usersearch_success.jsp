<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
    <%@ page import="dto.UserList" %>
    <%@ page import="dto.Tosho" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/usersearch_success.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>管理者画面</title>
</head>
<body>
	<%
	Tosho ac = (Tosho)session.getAttribute("user");
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
	
	<h3>検索結果</h3><br>
	<table class="table table-dark table-hover">
		<thead>
    		<tr>
      			<th scope="col">UserID</th>
      			<th scope="col">メール</th>
      			<th scope="col">姓</th>
      			<th scope="col">名</th>
      			<th scope="col">住所</th>
    		</tr>
  		</thead>
	 <tbody>
		<%
		List<UserList> list = (List<UserList>)request.getAttribute("userlist");
		for(UserList uu : list){
		%>
		
		<tr>
			<form action="BookCartServlet" method="post">
			<td><%=uu.getUser_id() %></td>
			<td ><%=uu.getMail() %></td>
			<td ><%=uu.getSurname()%></td>
			<td><%=uu.getName() %></td>
			<td ><%=uu.getAddress()%></td>
			<td><input type="hidden" name="user_id" value="<%=uu.getUser_id() %>">
			<input type="hidden" name="mail" value="<%=uu.getMail() %>">
			<input type="hidden" name="surname" value="<%=uu.getSurname() %>">
			<input type="hidden" name="name" value="<%=uu.getName() %>">
			<input type="hidden" name="address" value="<%=uu.getAddress() %>">
			<input type="submit" value="貸出処理へ"></td>
			</form>
		</tr>
		<%
		}
		%>
	 </tbody>
	</table>
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
</body>
</html>