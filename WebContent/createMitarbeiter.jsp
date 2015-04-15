<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.hp.hpl.jena.query.*"%>

<html>
<head>
<title>neuer Mitarbeiter</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap-ics.css">
<link rel="stylesheet" href="css/style.css">

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/es5-shim/2.0.8/es5-shim.min.js"></script>
	<![endif]-->

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="row header">
			<div class="col-md-12">
				<h1>Mitarbeiter-Datenbank - neuer Mitarbeiter</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="menu.html" />
			</div>
			<div class="row">
				<div class="col-md-12">
					<form action="singleMitarbeiter.jsp" method="get" name="formMitarbeiter">
						<input type="hidden" name="update" value="true">
						<div class="form-group">
							<label for="vnameInput">Vorname</label> <input type="text"
								class="form-control" name="vnameInput"
								placeholder="Vorname eingeben">
						</div>
						<div class="form-group">
							<label for="nnameInput">Nachname</label> <input type="text"
								class="form-control" name="nnameInput"
								placeholder="Nachname eingeben">
						</div>
						<div class="form-group">
							<label for="strasseInput">Straﬂe</label> <input type="text"
								class="form-control" name="strasseInput"
								placeholder="Straﬂe und Hausnummer eingeben">
						</div>
						<div class="form-group">
							<label for="plzInput">PLZ</label> <input type="text"
								class="form-control" name="plzInput" placeholder="PLZ eingeben">
						</div>
						<div class="form-group">
							<label for="ortInput">Ort</label> <input type="text"
								class="form-control" name="ortInput" placeholder="Ort eingeben">
						</div>
						<div class="form-group">
							<label for="landInput">Land</label> <input type="text"
								class="form-control" name="landInput" placeholder="Land eingeben">
						</div>
						<div class="form-group">
							<label for="gebdatInput">Geburtsdatum</label> <input type="text"
								class="form-control" name="gebdatInput"
								placeholder="Geburtsdatum eingeben">
						</div>
						<div class="form-group">
							<label for="abteilungInput">Abteilung</label> <input type="text"
								class="form-control" name="abteilungInput"
								placeholder="Abteilung eingeben">
						</div>
						<div class="form-group">
							<label for="geschlechtInput">Geschlecht</label> <select
								class="form-control" name="geschlechtInput">
								<option value="m">m‰nnlich</option>
								<option value="w">weiblich</option>
							</select>
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>