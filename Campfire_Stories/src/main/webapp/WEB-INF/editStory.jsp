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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css%22/%3E">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/create-and-edit.css">
    <link rel="stylesheet" href="/css/logReg.css">
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
<div class="d-flex container flex-column text-center justify-content-center align-items-center">
<h2>Edit a story:</h2>
</div>
    <div class="d-flex container flex-column text-center justify-content-center align-items-center">
    <form:form action="/stories/${story.id}/edit" method="put" modelAttribute="story">

        <p class="createtext1">
            <form:label path="storyTitle">Story Title: </form:label>
            <form:errors path="storyTitle" class="error"/>
            <form:input path="storyTitle"/>
        </p>

        <p class="createtext2">
            <form:select path="storyGenre">
            	<form:label path="storyGenre">Genre: </form:label>
                <form:option value="Urban" label="Urban Legends"/>
				<form:option value="Psychological" label="Psychological"/>
				<form:option value="Creepypasta" label="Creepypastas"/>
				<form:option value="Spiritual" label="Spiritual"/>
				<form:option value="Paranormal" label="Paranormal"/>
            </form:select>
        </p>

        <p class="createtext3">
            <form:label path="storyContent">Tell your tale: </form:label>
            <form:errors path="storyContent" class="error"/>
            <form:textarea rows="3" path="storyContent"/>
        </p>

        <p>
            <input type="submit" value="Submit" class="btn btn-danger my-2"/>
        </p>

    </form:form>
    </div>
</body>
</html>