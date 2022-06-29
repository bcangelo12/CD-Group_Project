<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/logReg.css" /> 
<meta charset="UTF-8">
<title>User Feed</title>
</head>
<body>
	<div id="foglayer_01" class="fog">
  	<div class="image01"></div>
  	<div class="image02"></div>
	</div>
	<div id="foglayer_02" class="fog">
  	<div class="image01"></div>
  	<div class="image02"></div>
	</div>
	<div id="foglayer_03" class="fog">
  	<div class="image01"></div>
  	<div class="image02"></div>
	</div>
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
			<div class="card text-center my-3 bg-secondary" style="width: 36rem;">
				<div class="card-body">
					<div class="d-flex justify-content-between">
						<a href="/stories/${userStory.id}/edit" class="btn btn-success">Edit</a>
						<a href="/stories/${userStory.id}/delete" class="btn btn-danger">Delete</a>
					</div>
					<h5 class="card-title">${userStory.storyTitle}</h5>
					<p class="card-text">${userStory.storyContent}</p>
					<c:choose>
						<c:when test="${userStory.updatedAt!=null}">
							<p class="card-text"><small>Last updated on: <fmt:formatDate pattern="MMM dd, yy @ h:m a" value="${userStory.updatedAt}"></fmt:formatDate></small></p>
						</c:when>
						<c:otherwise>
							<p class="card-text"><small>Created on: <fmt:formatDate pattern="MMM dd, yy @ h:m a" value="${userStory.createdAt}"></fmt:formatDate></small></p>
						</c:otherwise>
					</c:choose>
					<p class="card-text"><small>Story Genre: ${userStory.storyGenre}</small></p>
				</div>
			</div>
		</c:if>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</div>
	<div class="d-flex container flex-column justify-content-center align-items-center my-4">
		<c:choose>
		<c:when test="${loadedUser.favorites.isEmpty()}">
			<h3 class="text-light my-2">No favorited stories yet!</h3>
		</c:when>
		<c:otherwise>
		<h3 class="text-light my-2">Favorited Stories</h3>
		<c:set var="notCreator" value="false"/>
		<c:forEach var="favorite" items="${favoriteStories}">
		<c:choose>
		<c:when test="${loadedUser.id!=favorite.user.id}">
			<c:set var="notCreator" value="true"/>
			<div class="card text-center my-3 bg-secondary" style="width: 36rem;">
				<div class="card-body">
					<h5 class="card-title">${favorite.storyTitle}</h5>
					<p class="card-text">${favorite.storyContent}</p>
					<c:choose>
						<c:when test="${favorite.updatedAt!=null}">
							<p class="card-text"><small>Last updated on: <fmt:formatDate pattern="MMM dd, yy @ h:m a" value="${favorite.updatedAt}"></fmt:formatDate></small></p>
						</c:when>
						<c:otherwise>
							<p class="card-text"><small>Created on: <fmt:formatDate pattern="MMM dd, yy @ h:m a" value="${favorite.createdAt}"></fmt:formatDate></small></p>
						</c:otherwise>
					</c:choose>
					<p class="card-text"><small>Story Genre: ${favorite.storyGenre}</small></p>
					<p class="fst-italic text-center">This story is one of your favorites. Did a ghost add it without your knowledge?</p>
					<a href="/users/${loadedUser.id}/${favorite.id}/unfavorite" class="btn btn-danger">Unfavorite</a>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:set var="creator" value="true"/>
		</c:otherwise>
		</c:choose>
		</c:forEach>
		<c:if test="${notCreator == false && creator == true}">
			<h3>No favorited stories that aren't your own!</h3>
		</c:if>
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>