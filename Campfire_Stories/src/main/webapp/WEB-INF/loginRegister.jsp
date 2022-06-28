<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/logReg.css" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LogInReg</title>
</head>
<body id="page">

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

	<p>Register </p>
	<form:form action="/register" method="post" modelAttribute="newUser">
	
	<div class="form-group">
    <form:label path="userName" class="label">Enter Username:</form:label>
    <form:errors path="userName"/>
    <form:input type="text" path="userName" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Welcome story teller" />
    
  </div>
	
  <div class="form-group">
    <form:label path="email" for="exampleInputEmail1" class="label">Email address:</form:label>
    <form:errors path="email"/>
    <form:input type="email" path="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"/>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  <div class="form-group">
    <form:label path="password" for="exampleInputPassword1" class="label">Password:</form:label>
    <form:errors path="password"/>
    <form:input type="text" path="password" class="form-control" id="exampleInputPassword1" placeholder="Password"/>
  </div>
  
  <div class="form-group">
    <form:label path="confirm" for="exampleInputPassword1" class="label">Confirm Password:</form:label>
    <form:errors path="confirm"/>
    <form:input type="password" path="confirm" class="form-control" id="exampleInputPassword1" placeholder="Password"/>
  </div>
  
  <input type="submit" value="Submit" class="btn btn-primary" />
</form:form>

	<p>Log In</p>
	
   <form:form action="/login" method="post" modelAttribute="newLogin"> 
   
   <div class="form-group">
    <form:label path="email" for="exampleInputEmail1" class="label">Email address:</form:label>
    <form:errors path="email"/>
    <form:input type="email" path="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"/>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  <div class="form-group">
    <form:label path="password" for="exampleInputPassword1" class="label">Password:</form:label>
    <form:errors path="password"/>
    <form:input type="password" path="password" class="form-control" id="exampleInputPassword1" placeholder="Password"/>
  </div>
  
    <button type="submit" value="Login" class="btn btn-primary">Login</button>
  
   
   </form:form>

</body>
</html>