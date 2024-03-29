<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.UserMouth" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/book_mouthList.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>口コミ投稿一覧</title>

</head>
<body>

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
          <a class="nav-link active" aria-current="page" href="BookMouthListServlet">口コミ一覧</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<br><br>

	<h3>口コミ投稿一覧</h3><br>
	<table class="table table-dark table-hover">
		<thead>
    		<tr>
      			<th scope="col">図書名</th>
      			<th scope="col">姓</th>
      			<th scope="col">口コミ</th>
      			<th scope="col">評価</th>
      			<th scope="col">投稿日時</th>
    		</tr>
  		</thead>
	
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
		<h3><a href="TopServlet">戻る</a></h3>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>