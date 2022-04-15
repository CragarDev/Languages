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
						<title>Craig Burke - Languages - dashboard</title>
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
						<div class="container w-75">
							<!-- == Delete button == -->
							<!-- <p class="w-100"></p>
							<a class="btn btn-danger float-end mb-3 me-3" href="/languages/delete">Delete</a>
							<p class="w-100"></p> -->
							<!-- == Update button == -->
							<!-- <p class="w-100"></p>
							<a class="btn btn-warning float-end mb-3 me-3" href="/languages/update">Update</a>
							<p class="w-100"></p> -->
							<!-- == ShowOne button == -->
							<!-- <p class="w-100"></p>
							<a class="btn btn-success float-end mb-3 me-3" href="/languages/showOne">ShowOne</a>
							<p class="w-100"></p> -->
							<!-- == Dashboard button == -->
							<!-- <p class="w-100"></p>
							<a class="btn btn-primary float-end mb-3 me-3" href="/languages">Dashboard</a>
							<p class="w-100"></p> -->

						</div>

						<!-- Beginning of Container -->
						<div class="container">

							<p class="w-100"></p>
							<h1 class="bg-primary text-light ps-3">Languages Dashboard</h1>
							<p class="w-100"></p>

							<!-- Table of Languages -->
							<div class="container w-75">
								<h2 class="bg-primary text-light ps-3">Languages</h2>
								<table class="table table-striped p-5 border border-2" id="fruit_table">
									<thead>
										<tr>
											<th scope="col" class="h4 text-center">Name</th>
											<th scope="col" class="h4 text-center">Creator</th>
											<th scope="col" class="h4 text-center">Version</th>
											<th scope="col" class="h4 text-center">Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="language" items="${languages}">
											<tr>
												<td scope="row">
													<a href="/languages/showOne/${language.id}">
														<p class="text-center">
															<c:out value="${language.name}"></c:out>
														</p>
													</a>
												</td>
												<td scope="row">
													<p class="text-center">
														<c:out value="${language.creator}"></c:out>
													</p>
												</td>
												<td scope="row">
													<p class="text-center">
														<c:out value="${language.version}"></c:out>
														<!-- <fmt:formatNumber value="${language.version}" /> -->
													</p>
												</td>
												<td scope="row">
													<p class="text-center">
														<a href="/languages/showOne/${language.id}">view</a>
														<span> | </span>
														<a href="/languages/update/${language.id}">edit</a>
														<span> | </span>
														<a href="/languages/delete/${language.id}">delete</a>
													</p>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<!-- Create Language form -->
							<div
								class="container bg-secondary text-light rounded-3 w-50 mt-5 border border-info border-5 pb-5 p-3">
								<form:form action="/languages/create" method="post" modelAttribute="language">

									<div class="mb-3">
										<p>
											<form:label path="name">Language</form:label>
											<form:errors path="name" class="text-danger h5" />
											<form:input path="name" class="form-control text-dark" placeholder="name" />
										</p>
									</div>

									<div class="mb-3">
										<p>
											<form:label path="creator">Creator</form:label>
											<form:errors path="creator" class="text-danger h5" />
											<form:input path="creator" class="form-control" placeholder="creator" />
										</p>
									</div>

									<div class="mb-3">
										<p>
											<form:label path="version">Version</form:label>
											<form:errors path="version" class="text-danger h5" />
											<form:input type="number" step="0.01" path="version"
												class="form-control w-25" placeholder="version" />
										</p>
									</div>


									<input type="submit" value="Add New Language" class="btn btn-warning float-start" />
									<!-- == Cancel button == -->
								<p class="w-100"></p>
								<a class="btn btn-info float-end mb-3" href="/languages">Cancel</a>
								<p class="w-100"></p>

								</form:form>

							</div>

							<p class="w-100"></p>


							<p class="w-100"></p>
						</div>
						<!-- End of Container -->

					</body>

					</html>