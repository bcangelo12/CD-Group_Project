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
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
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
	<c:forEach var="story" items="${stories}">
		<p>Title: ${story.storyTitle}</p>
		<p>Content: ${story.storyContent}</p>
		<p>Genre: ${story.storyGenre}</p>
	</c:forEach>
</body>
</html>