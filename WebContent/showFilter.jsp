<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mitarbeiter-Datenbank</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap-ics.css">
<link rel="stylesheet" href="css/style.css">

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container">
		<div class="row header">
			<div class="col-md-12">
				<h1>Mitarbeiter-Datenbank - Übersicht</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<jsp:include page="menu.html" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h2>Mitarbeiter Suchen</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<!--  <form action="showMitarbeiter.jsp" method="get" name="formSearch">
					<input type="radio" name="sex" value="male">Male<br> <input
						type="radio" name="sex" value="female">Female<br>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>-->
				<form action="showMitarbeiter.jsp" method="get" name="formSearch">
				<div class="btn-group-vertical">
					<label class="btn btn-default"> <input type="radio"
						name="options">
					</label> <label class="btn btn-default"> <input type="radio"
						name="options">
					</label> <label class="btn btn-default"> <input type="radio"
						name="options">
					</label>
				</div>
				</form>
			</div>
		</div>
</body>
</html>