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
	<link rel="stylesheet" href="/css/style.css">
<meta charset="UTF-8">
<title>User Feed</title>
</head>
<body>
	<div class="d-flex justify-content-end">
		<a href="/home" class="btn btn-danger my-2 me-2">Back to the Fire</a>
	</div>
	<div class="d-flex container flex-column text-center justify-content-center align-items-center text-light">
		<h1>Hello <c:out value="${loadedUser.userName}"></c:out>, welcome to your feed.</h1>
	</div>
	<div class="d-flex container flex-column justify-content-center align-items-center my-4">
		<c:choose>
		<c:when test="${loadedUser.stories.isEmpty()}">
			<h3 class="text-light my-2">You don't have any stories posted yet!</h3>
		</c:when>
		<c:otherwise>
			<h3 class="text-light my-2">Your Stories</h3>
		<c:forEach var="userStory" items="${stories}">
		<c:if test="${userStory.user.getId().equals(loadedUser.id)}">
			<div class="card text-center my-3" style="width: 36rem;">
				<div class="card-body">
					<h5 class="card-title">${userStory.storyTitle}</h5>
					<p class="card-text">${userStory.storyContent}</p>
					<p class="card-text"><small class="text-muted">Story Genre: ${userStory.storyGenre}</small></p>
					<a href="/stories/${userStory.id}/edit" class="btn btn-warning my-2">Edit</a>
					<a href="/stories/${userStory.id}/delete" class="btn btn-danger my-2">Delete</a>
				</div>
			</div>
		</c:if>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</div>
	<div class="d-flex container flex-column justify-content-center align-items-center my-4">
		<c:choose>
		<c:when test="${loadedUser.storyFavorited.isEmpty()}">
			<h3 class="text-light my-2">No favorited stories yet!</h3>
		</c:when>
		<c:otherwise>
		<h3 class="text-light my-2">Favorited Stories</h3>
		<c:forEach var="favs" items="${stories}">
		<!-- need to add condition to remove user submitted stories from here (if time) -->
		<c:if test="${favs.favoriters.contains(loadedUser)}">
			<div class="card text-center my-3" style="width: 36rem;">
				<div class="card-body">
					<h5 class="card-title">${favs.storyTitle}</h5>
					<p class="card-text">${favs.storyContent}</p>
					<p class="card-text"><small class="text-muted">Story Genre: ${favs.storyGenre}</small></p>
				</div>
			</div>
		</c:if>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>