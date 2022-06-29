<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${storyGenre}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/logReg.css" /> 
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
	<c:choose>
		<c:when test="${storyGenre == 'urban'}">
			<h1 class="text-center">Urban Legends</h1>
		</c:when>
		<c:when test="${storyGenre == 'creepypasta'}">
			<h1 class="text-center">Creepypastas</h1>
		</c:when>
		<c:otherwise>
			<h1 class="text-center">${storyGenre} Stories</h1>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${stories.isEmpty()}">
			<div class="container">
				<h3 class="text-center mt-5">There have been no stories passed down... Perhaps those who knew some have inexplicably disappeared...</h3>
				<p class="text-center mt-5 text-danger">Anyways... want to add one?</p>
				<div class="d-flex justify-content-center">
					<a href="/stories/new"><img src='<c:url value="/img/campfire.png"/>' alt="create page pic" class="campfire2" title="Add a Story"/></a>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="story" items="${stories}">
				<div class="card text-center my-3 bg-secondary d-flex justify-content-center container mt-5" style="width: 36rem;">
					<div class="card-body">
						<c:if test="${story.user.id == user.id}">
							<div class="d-flex justify-content-between">
								<a href="/stories/${story.id}/edit" class="btn btn-success">Edit</a>
								<a href="/stories/${storyGenre}/${story.id}/delete" class="btn btn-danger">Delete</a>
							</div>
						</c:if>
						<h5 class="card-title">${story.storyTitle}</h5>
						<p class="card-text">${story.storyContent}</p>
						<c:choose>
							<c:when test="${story.updatedAt!=null}">
								<p class="card-text"><small>Last updated on: <fmt:formatDate pattern="MMM dd, yy @ h:m a" value="${story.updatedAt}"></fmt:formatDate></small></p>
							</c:when>
							<c:otherwise>
								<p class="card-text"><small>Created on: <fmt:formatDate pattern="MMM dd, yy @ h:m a" value="${story.createdAt}"></fmt:formatDate></small></p>
							</c:otherwise>
						</c:choose>
						<c:forEach var="favoriteUser" items="${story.favoriters}">
						<c:if test="${favoriteUser.id == user.id}">
							<c:set var="favorited" value="true"/>
						</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${favorited == true}">
								<p class="fst-italic text-center">This story is one of your favorites. Did a ghost add it without your knowledge?</p>
								<a href="/stories/${storyGenre}/${story.id}/unfavorite" class="btn btn-danger">Unfavorite</a>
							</c:when>
							<c:otherwise>
								<a href="/stories/${storyGenre}/${story.id}/favorite" class="btn btn-primary">Add to Favorites</a>
							</c:otherwise>
						</c:choose>
					</div>
					<c:set var="favorited" value="false"/>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>