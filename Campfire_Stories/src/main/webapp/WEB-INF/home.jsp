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
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="d-flex justify-content-around">
		<img src='<c:url value="/img/.jpg"/>' alt="tree pic" class="tree"/>
		<a href="/users/${user.id}"><img src='<c:url value="/img/.jpg"/>' alt="user profile page" class="user"/></a>
		<img src='<c:url value="/img/.jpg"/>' alt="tree pic" class="tree"/>		
	</div>
	<div class="d-flex justify-content-around">
		<img src='<c:url value="/img/.jpg"/>' alt="tree pic" class="tree"/>
		<img src='<c:url value="/img/.jpg"/>' alt="tree pic" class="tree"/>
	</div>
	<div class="d-flex justify-content-around">
		<a href="/stories/Paranormal"><img src='<c:url value="/img/.jpg"/>' alt="paranormal pic" class="paranormal"/></a>
	</div>
	<div class="d-flex justify-content-around">
		<a href="/stories/Psychological"><img src='<c:url value="/img/.jpg"/>' alt="psychological pic" class="psychological"/></a>
		<a href="/stories/new"><img src='<c:url value="/img/.jpg"/>' alt="create page pic" class="campfire"/></a>
		<a href="/stories/Spiritual"><img src='<c:url value="/img/.jpg"/>' alt="spiritual pic" class="spiritual"/></a>
	</div>
	<div class="d-flex justify-content-between">
		<a href="/stories/urban"><img src='<c:url value="/img/.jpg"/>' alt="urban legend pic" class="urban"/></a>
		<a href="/stories/creepypasta"><img src='<c:url value="/img/.jpg"/>' alt="creepypasta pic" class="creepy"/></a>
	</div>
</body>
</html>