<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create a New Story</title>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<div class="d-flex justify-content-end">
	<a href="/home" class="btn btn-danger my-2 me-2">Back to the Fire</a>
</div>
<div class="d-flex container flex-column text-center justify-content-center align-items-center">	
<h2>Add a story:</h2>
</div>
	<div class="d-flex container flex-column text-center justify-content-center align-items-center">		
	<form:form action="/stories/new" method="post" modelAttribute="story">
	
		<p>
			<form:label path="storyTitle">Story Title: </form:label>
			<form:errors path="storyTitle" class="error"/>
			<form:input path="storyTitle"/>
		</p>
	
		<p>
			<form:select path="storyGenre">
				<form:option value="Paranormal" label="Paranormal"/>
				<form:option value="Psychological" label="Psychological"/>
				<form:option value="Spiritual" label="Spiritual"/>
				<form:option value="Urban" label="Urban Legend"/>
				<form:option value="Creepypasta" label="Creepypasta"/>
			</form:select>
		</p>
				
		<p>
			<form:label path="storyContent">Tell your tale: </form:label>
			<form:errors path="storyContent" class="error"/>
			<form:textarea rows="3" path="storyContent"/>
		</p>
		
		<p>
			<input type="submit" value="Submit" class="btn btn-primary"/>
		</p>
				
	</form:form>
	</div>
</body>
</html>