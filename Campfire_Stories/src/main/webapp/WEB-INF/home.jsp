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
	<div class="d-flex justify-content-end">
		<a href="/logout" class="btn btn-danger my-2 me-2">Exit the Forest</a>
	</div>
	<div class="d-flex justify-content-around">
		<a href="/stories/creepypasta"><img src='<c:url value="/img/creepypasta.png"/>' alt="creepypasta pic" class="icontop" title="Creepypastas"/></a>
	</div>
	<div class="d-flex justify-content-around mt-3">
		<a href="/stories/Psychological"><img src='<c:url value="/img/psychological.png"/>' alt="psychological pic" class="icon" title="Paranormal Stories"/></a>
		<a href="/stories/Spiritual"><img src='<c:url value="/img/spiritual.png"/>' alt="spiritual pic" class="icon" title="Spiritual Stories"/></a>
	</div>
	<div class="d-flex justify-content-around mt-5">
		<a href="/stories/urban"><img src='<c:url value="/img/urban.png"/>' alt="urban legend pic" class="icon" title="Urban Legends"/></a>
		<div class="d-flex justify-content-center">
			<a href="/users/${user.id}"><img src='<c:url value="/img/user.png"/>' alt="user profile page" class="icon" title="My Stories"/></a>	
			<a href="/stories/new"><img src='<c:url value="/img/campfire.png"/>' alt="create page pic" class="campfire" title="Add a Story"/></a>
		</div>
		<a href="/stories/Paranormal"><img src='<c:url value="/img/paranormal.png"/>' alt="paranormal pic" class="icon" title="Paranormal Stories"/></a>
	</div>
</body>
</html>