<!DOCTYPE html>

<%@page import="at.jku.semtech.miniprojekt1.entities.Person"%>
<%@page import="at.jku.semtech.miniprojekt1.services.MitarbeiterSevice"%>
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
				<form action="singleMitarbeiter.jsp" method="get"
					name="formMitarbeiter">
					<div class="col-md-6">
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
								class="form-control" name="landInput"
								placeholder="Land eingeben">
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
						<button type="submit" class="btn btn-default">Speichern</button>
					</div>
					<div class="col-md-6">
						<div class="row">
							<h3>Beziehungen</h3>
						</div>
						<div class="row">
							<table class="table table-striped table-bordered table-hover">
								<tr>
									<th style="width: 40%">Mitarbeiter</th>
									<th style="width: 15%; text-align: center">Arbeitskollege</th>
									<th style="width: 15%; text-align: center">Freund</th>
									<th style="width: 15%; text-align: center">Bekannte</th>
									<th style="width: 15%; text-align: center">Aff‰re</th>
								</tr>
								<%
								    MitarbeiterSevice mitarbeiterSevice = new MitarbeiterSevice();
								    List<Person> persons = mitarbeiterSevice
										    .getMitarbeiterListByNname("");

								    for (Person p : persons) {
										out.print("<tr><td>" + p.getVname() + " " + p.getNname()
											+ "</td>");
										out.print("<td style='text-align: center'><input type='checkbox' name='coworker' value='"
											+ p.getVname() + "_" + p.getNname() + "'/></td>");
										out.print("<td style='text-align: center'><input type='checkbox' name='friend' value='"
											+ p.getVname() + "_" + p.getNname() + "'/></td>");
										out.print("<td style='text-align: center'><input type='checkbox' name='knows' value='"
											+ p.getVname() + "_" + p.getNname() + "'/></td>");
										out.print("<td style='text-align: center'><input type='checkbox' name='sweetheart' value='"
											+ p.getVname() + "_" + p.getNname() + "'/></td>");
										out.print("</tr>");
								    }
								%>
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>