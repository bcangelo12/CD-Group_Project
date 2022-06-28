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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<h2>Add a story:</h2>
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
			<a href="/home" class="btn btn-primary">Cancel</a>
		</p>
				
	</form:form>
	
</body>
</html>