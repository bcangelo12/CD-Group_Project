<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>User Feed</title>
</head>
<body>
	<div class="d-flex justify-content-end">
		<a href="/dashboard" class="btn btn-danger my-2 me-2">Back to the Fire</a>
	</div>
	<div class="d-flex container flex-column text-center justify-content-center align-items-center">
		<h1>Hello <c:out value="${user.userName}"></c:out>, welcome to your feed.</h1>
	</div>
	<div class="d-flex container flex-column justify-content-center align-items-center">
		<h3>Your Stories</h3>
		<c:forEach var="userStory" items="${userStories}">
		<c:if test="${userStory.user.getId().equals(user.id)}">
			<div class="card mb-3" style="max-width: 540px;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="/" class="card-img" alt="...">			
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">${userStory.storyTitle}</h5>
							<p class="card-text">${userStory.storyContent}</p>
							<p class="card-text"><small class="text-muted">Last updated</small></p>
							<a href="/edit" class="btn btn-warning my-2">Edit</a>
							<a href="/delete" class="btn btn-danger my-2">Delete</a>
						</div>
					</div>
				
				</div>
				
			</div>
		</c:if>
		</c:forEach>
	</div>
	<div class="d-flex container flex-column justify-content-center align-items-center">
		<h3>Favorited Stories</h3>
		<c:forEach var="favorite" items="${favorites}">
			<div class="card mb-3" style="max-width: 540px;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="/" class="card-img" alt="...">			
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">${story.storyTitle}</h5>
							<p class="card-text">${story.storyContent}</p>
							<p class="card-text"><small class="text-muted">Last updated</small></p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>