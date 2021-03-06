<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <title>블로그</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="/home">블로그</a>

  <!-- Links -->
  <ul class="navbar-nav">
		<c:choose>
			<c:when test="${sessionScope.principal.username == null}">
				<li class="nav-item"><a class="nav-link" href="/loginForm">
						로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="/joinForm">회원가입</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="nav-item"><a class="nav-link" href="#">글쓰기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">회원정보</a></li>
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
			</c:otherwise>
		</c:choose>

			<!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Dropdown link
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>
  </ul>
</nav>
<br>