<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
	<!-- Here we have to import the Date class. -->
	<!-- You will put the import in the first line of the jsp tag. Use the import attribute -->

	<!-- c:out ; c:forEach ; c:if -->
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!-- for using jstl functions -->
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!-- Formatting (like dates) -->
			<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<!-- form:form -->
				<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
					<!-- for rendering errors on PUT routes -->


					<!DOCTYPE html>

					<html>

					<head>
						<meta charset="UTF-8" />
						<title>Craig Burke - Ninja Gold Game</title>
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
						<link rel="stylesheet" href="/css/style.css" />
					</head>

					<body>
						<div class="container">
							<!-- Beginning of Container -->
							<h2 class="text-warning">Ninja GOLD....</h2>
							<a class="btn btn-success float-end mb-3" href="/reset">New Game</a>
							<br />
							<p>
								<c:out value="${ error }" />
							</p>
							<br />
							<h3 class="gold-number">Your Gold:
								<span class="text-warning">
									<c:out value="${ gold }" />
								</span>
							</h3>
							<p class="w-100"></p>

							<div class="container d-flex gap-2">

								<div class="container farm text-center border border-3 border-success">
									<h2>Farm</h2>
									<p class="w-100"></p>
									<h4>(earns 15-50 gold)</h4>
									<p class="w-100"></p>
									<!-- == button == -->
									<form action="/gold/process" method="post">
										<input type="hidden" name="place" value="farm">
										<input class="btn btn-success mb-3" type="submit" value="Find Gold!">
									</form>
									<p class="w-100"></p>
								</div>

								<div class="container farm text-center border border-3 border-primary">
									<h2>Cave</h2>
									<p class="w-100"></p>
									<h4>(earns 2-10 gold)</h4>
									<p class="w-100"></p>
									<!-- == button == -->
									<form action="/gold/process" method="post">
										<input type="hidden" name="place" value="cave">
										<input class="btn btn-primary mb-3" type="submit" value="Find Gold!">
									</form>
									<p class="w-100"></p>
								</div>
								<div class="container farm text-center border border-3 border-warning">
									<h2>Home</h2>
									<p class="w-100"></p>
									<h4>(earns 5-20 gold)</h4>
									<p class="w-100"></p>
									<!-- == button == -->
									<form action="/gold/process" method="post">
										<input type="hidden" name="place" value="home">
										<input class="btn btn-warning mb-3" type="submit" value="Find Gold!">
									</form>
									<p class="w-100"></p>
								</div>
								<div class="container farm text-center border border-3 border-danger">
									<h2>Quest</h2>
									<p class="w-100"></p>
									<h4>(earns/takes 0-100 gold)</h4>
									<p class="w-100"></p>
									<!-- == button == -->
									<form action="/gold/process" method="post">
										<input type="hidden" name="place" value="quest">
										<input class="btn btn-danger mb-3" type="submit" value="Find Gold!">
									</form>
									<p class="w-100"></p>
								</div>
							</div>

							<p class="w-100"></p>
							<!-- <h2>
							<c:out value="${ activityList }">
							</c:out>
						</h2> -->

							<div class="container border border-5 border-info w-75">
								<h2>Activity:</h2>
								<hr>
								<!-- <p class="w-100"></p> -->
								<div data-bs-spy="scroll" class="scrollspy-example">

									<c:forEach items="${ activityList }" var="activity">

										<c:choose>

											<c:when test="${fn:contains(activity, 'failed')}">

												<li class="string_output_neg list-group-item text-danger">
													<c:out value="${ activity }" />
												</li>
											</c:when>
											<c:otherwise>
												<li class="string_output_pos list-group-item text-success">
													<c:out value="${ activity }" />
												</li>
											</c:otherwise>
										</c:choose>

									</c:forEach>


									<!-- 
								<span class="text-success">You have entered a <span>Farm</span> and received <span
										class="text-warning">15
										gold</span>
									(September 3rd 2022 6:15
									pm)
								</span><br>

								<span class="text-danger">You have failed a <span>Quest</span> and lost -<span
										class="text-warning">50
										gold</span>
									(September 3rd 2022 6:15
									pm)
								</span><br> -->

								</div>
							</div>
							<p class="w-100"></p>

						</div>
						<!-- End of Container -->

						<!-- Custom css that makes this example work like it does: -->



						<script src="/js/app.js"></script>
					</body>

					</html>