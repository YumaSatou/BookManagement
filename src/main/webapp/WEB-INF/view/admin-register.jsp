<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/admin-register.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>図書登録</title>
</head>
<body>

	<% 
		String error = request.getParameter("error");
		if(error != null){
			
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
            <li><a class="dropdown-item" href="LogoutServlet">管理者ログアウト</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            図書管理
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
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
		
		<p style="color:red">登録に失敗しました。</p>
		<h1>図書登録</h1>
		<form action="RegisterLibraryExecuteServlet" method="post">
			図書名：<input type="text" name="book_name" value="<%=request.getParameter("book_name") %>"><br><br>
			出版社：<input type="text" name="publisher" value="<%=request.getParameter("company") %>"><br><br>
			ISBN：<input type="text" name="isbn"><br><br>
			著者：<input type="text" name="author"><br><br>
			新旧：<input type="radio" name="new_oid" value="新">新
				　<input type="radio" name="new_old" value="旧">旧<br><br>
			格納エリア：<input type="text" name="house"><br><br>
		
			<input type="submit" value="登録">
		
		</form>
	<%	
		} else {
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
            <li><a class="dropdown-item" href="LogoutServlet">管理者ログアウト</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            図書管理
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
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
<br><br>
	
	<h1>図書登録</h1>
	<form action="RegisterLibraryExecuteServlet" method="post">
		図書名：<input type="text" name="name"><br><br>
		出版社：<input type="text" name="publisher"><br><br>
		ISBN：<input type="text" name="isbn"><br><br>
		著者：<input type="text" name="author"><br><br>
		新旧：<input type="radio" name="new_old" value="新">新
				　<input type="radio" name="new_old" value="旧">旧<br><br>
		格納エリア：<input type="text" name="house"><br><br>
		
		<input type="submit" value="登録">
	
	</form>
	<% } %>
	<br><h3><a href="TopServlet" style="color:black">戻る</a></h3>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>