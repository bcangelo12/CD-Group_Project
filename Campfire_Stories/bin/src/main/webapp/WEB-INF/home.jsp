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
	<p> Home Page </p>
	<p>CSS is linked - try to make background the forest image </p>
	<p>Testing an image as link here: </p>
	<a href="/stories/test"><img src='<c:url value="/img/zombie.jpg"/>' alt="test2"/></a>
	<a href="/stories/Paranomal">Paranormal</a>
	<a href="/stories/Psychological">Psychological</a>
	<a href="/stories/Spiritual">Spiritual</a>
	<a href="/stories/Urbanlegend">Urban Legend</a>
	<a href="/stories/Creepypasta">Creepypasta</a>
</body>
</html>