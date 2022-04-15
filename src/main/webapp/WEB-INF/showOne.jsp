<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
	<!-- Here we have to import the Date class. -->
	<!-- You will put the import in the first line of the jsp tag. Use the import attribute -->

	<!-- c:out ; c:forEach ; c:if -->
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!-- Formatting (like dates) -->
		<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!-- form:form -->
			<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
				<!-- for rendering errors on PUT routes -->
				<%@ page isErrorPage="true" %>

					<!DOCTYPE html>

					<html>

					<head>
						<meta charset="UTF-8" />
						<title>Craig Burke - Languages - Show One</title>
						<!-- Bootstrap -->
						<!-- CSS only -->
						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
							rel="stylesheet"
							integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
							crossorigin="anonymous" />
						<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
							integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
							crossorigin="anonymous"></script>
						<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
							integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
							crossorigin="anonymous"></script>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
						<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
					</head>

					<body>
						<!-- Buttons -->
						<div class="container w-25">
							<!-- == Delete button == -->
							<p class="w-100"></p>
							<a class="btn btn-danger float-end mb-3 me-3"
								href="/languages/delete/${language.id}">Delete</a>
							<p class="w-100"></p>
							<!-- == Update button == -->
							<p class="w-100"></p>
							<a class="btn btn-warning float-end mb-3 me-3"
								href="/languages/update/${language.id}">Update</a>
							<p class="w-100"></p>
							<!-- == ShowOne button == -->
							<!-- <p class="w-100"></p>
							<a class="btn btn-success float-end mb-3 me-3" href="/languages/showOne">ShowOne</a>
							<p class="w-100"></p> -->
							<!-- == Dashboard button == -->
							<p class="w-100"></p>
							<a class="btn btn-primary float-end mb-3 me-3" href="/languages">Dashboard</a>
							<p class="w-100"></p>

						</div>

						<!-- Beginning of Container -->
						<div class="container w-50">

							<p class="w-100"></p>
							<h1 class="bg-primary text-light ps-3">Languages Show One</h1>
							<p class="w-100"></p>

							<div class="container w-50">

								<ul class="list-inline">
									<li class="list-inline-item">Languages:</li>
									<li class="list-inline-item h1 text-warning">
										<c:out value="${language.name}"></c:out>
									</li>
								</ul>

								<ul class="list-inline">
									<li class="list-inline-item">Creator:</li>
									<li class="list-inline-item fs-3 text-info">
										<c:out value="${language.creator}"></c:out>
									</li>
								</ul>

								<ul class="list-inline">
									<li class="list-inline-item">Version:</li>
									<li class="list-inline-item fs-3 text-warning">
										<c:out value="${language.version}"></c:out>
									</li>
								</ul>
							</div>
							<!-- End of Container -->

					</body>

					</html>