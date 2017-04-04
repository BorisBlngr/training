<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pagination" uri="/WEB-INF/tld/pagination.tld"%>
<%@ taglib prefix="link" uri="/WEB-INF/tld/link.tld"%>

<!DOCTYPE html>
<html>
<head>
<title>Computer Database</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<!-- Bootstrap -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="resources/css/font-awesome.css" rel="stylesheet"
	media="screen">
<link href="resources/css/main.css" rel="stylesheet" media="screen">
</head>
<body>
	<header class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<a class="navbar-brand" href="dashboard"> Application - Computer
				Database </a>
		</div>
	</header>

	<section id="main">
		<div class="container">
			<h1 id="homeTitle">${nbComputer}&nbsp;Computers&nbsp;found</h1>
			<div id="actions" class="form-horizontal">
				<div class="pull-left">
					<form id="searchForm" action="#" method="GET" class="form-inline"
						name="searchForm">
						<input type="search" id="searchbox" name="search"
							class="form-control" placeholder="Search name" value="${search}" />
						<input type="hidden" id="maxInPage" name="maxInPage"
							value="${maxInPage}" /> <label> Search by </label> <select
							class="form-control" id="searchBy" name="searchBy">
							<option value="computers"
								<c:if test="${searchBy == 'computers'}"> selected="selected"</c:if>>Computers</option>
							<option value="companies"
								<c:if test="${searchBy == 'companies'}"> selected="selected"</c:if>>Companies</option>
						</select> <input type="submit" id="searchsubmit" value="Filter by name"
							class="btn btn-primary" />
					</form>
				</div>
				<div class="pull-right">
					<a class="btn btn-success" id="addComputer" href="addcomputer">Add
						Computer</a> <a class="btn btn-default" id="editcomputer" href="#"
						onclick="$.fn.toggleEditMode();">Edit</a>
				</div>
			</div>
		</div>
		<input type="hidden" name="pageIndex" id="pageIndex"
			value="${pageIndex}" />

		<form id="deleteForm"
			action="?page=${pageIndex}&maxInPage=${maxInPage}" method="POST">
			<input type="hidden" name="selection" value="">
		</form>
		<div class="container" style="margin-top: 10px;">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<!-- Variable declarations for passing labels as parameters -->
						<!-- Table header for Computer Name -->

						<th class="editMode" style="width: 60px; height: 22px;"><input
							type="checkbox" id="selectall" /> <span
							style="vertical-align: top;"> - <a href="#"
								id="deleteSelected" onclick="$.fn.deleteSelected();"> <i
									class="fa fa-trash-o fa-lg"></i>
							</a>
						</span></th>
						<th>Computer name <c:choose>
								<c:when test="${filterBy == 'computers' && order == 'ASC'}">
									<a
										href="	?page=${pageIndex}&maxInPage=${maxInPage}&search=${search}&searchBy=${searchBy}&filterBy=computers&order=DESC">
										<span class="glyphicon glyphicon-chevron-down"> </span>
									</a>
								</c:when>
								<c:when test="${(filterBy == 'computers') && (order == 'DESC')}">
									<a
										href="?page=${pageIndex}&maxInPage=${maxInPage}&search=${search}&searchBy=${searchBy}&filterBy=computers&order=ASC">
										<span class="glyphicon glyphicon-chevron-up"> </span>
									</a>
								</c:when>
								<c:otherwise>
									<a
										href="?page=${pageIndex}&maxInPage=${maxInPage}&search=${search}&searchBy=${searchBy}&filterBy=computers&order=ASC">
										<span class="glyphicon glyphicon-chevron-up"> </span>
									</a>
									<a
										href="?page=${pageIndex}&maxInPage=${maxInPage}&search=${search}&searchBy=${searchBy}&filterBy=computers&order=DESC">
										<span class="glyphicon glyphicon-chevron-down"> </span>
									</a>
								</c:otherwise>
							</c:choose>
						</th>
						<th>Introduced date</th>
						<!-- Table header for Discontinued Date -->
						<th>Discontinued date</th>
						<!-- Table header for Company -->
						<th>Company <c:choose>
								<c:when test="${(filterBy == 'companies') && (order == 'ASC')}">
									<a
										href="?page=${pageIndex}&maxInPage=${maxInPage}&search=${search}&searchBy=${searchBy}&filterBy=companies&order=DESC">
										<span class="glyphicon glyphicon-chevron-down"> </span>
									</a>
								</c:when>
								<c:when test="${(filterBy == 'companies') && (order == 'DESC')}">
									<a
										href="?page=${pageIndex}&maxInPage=${maxInPage}&search=${search}&searchBy=${searchBy}&filterBy=companies&order=ASC">
										<span class="glyphicon glyphicon-chevron-up"> </span>
									</a>
								</c:when>
								<c:otherwise>
									<a
										href="?page=${pageIndex}&maxInPage=${maxInPage}&search=${search}&searchBy=${searchBy}&filterBy=companies&order=ASC">
										<span class="glyphicon glyphicon-chevron-up"></span>
									</a>
									<a
										href="?page=${pageIndex}&maxInPage=${maxInPage}&search=${search}&searchBy=${searchBy}&filterBy=companies&order=DESC">
										<span class="glyphicon glyphicon-chevron-down"> </span>
									</a>
								</c:otherwise>
							</c:choose>
						</th>

					</tr>
				</thead>
				<!-- Browse attribute computers -->
				<tbody id="results">
					<c:forEach items="${computerDtoList}" var="computerDtoList">
						<tr>
							<td class="editMode"><input type="checkbox" name="cb"
								class="cb" value="${computerDtoList.id}"></td>
							<td><a href="editcomputer?id=${computerDtoList.id}"
								onclick=""><c:out value="${computerDtoList.name}" /></a></td>
							<td>${computerDtoList.introduced}</td>
							<td>${computerDtoList.discontinued}</td>
							<td>${computerDtoList.company.name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>

	<footer class="navbar-fixed-bottom">
		<div class="container text-center">
			<ul class="pagination">
				<pagination:page pageIndex="${pageIndex}" maxPage="${maxPage}"
					maxInPage="${maxInPage}" pageList="${pageList}" search="${search}"
					searchBy="${searchBy}" filterBy="${filterBy}" order="${order}" />
			</ul>

			<div class="btn-group btn-group-sm pull-right" role="group">
				<a href="?page=${pageIndex}&maxInPage=10&search=${search}"
					class="btn btn-default<c:if test="${maxInPage == 10}"> active</c:if>">10</a>
				<a href="?page=${pageIndex}&maxInPage=50&search=${search}"
					class="btn btn-default<c:if test="${maxInPage == 50}"> active</c:if>">50</a>
				<a href="?page=${pageIndex}&maxInPage=100&search=${search}"
					class="btn btn-default<c:if test="${maxInPage == 100}"> active</c:if>">100</a>
			</div>
		</div>
	</footer>
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/dashboard.js"></script>

</body>
</html>