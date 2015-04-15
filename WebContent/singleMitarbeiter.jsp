<!DOCTYPE html>

<%@page import="at.jku.semtech.miniprojekt1.services.MitarbeiterSevice"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.hp.hpl.jena.query.*"%>

<html>
<head>
<title>Mitarbeiter-Datenbank</title>

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

<%
    String update = request.getParameter("update");
    MitarbeiterSevice mitarbeiterSevice = new MitarbeiterSevice();
    if (update.equalsIgnoreCase("true")) {

		mitarbeiterSevice.createMitarbeiter(
			request.getParameter("vnameInput"),
			request.getParameter("nnameInput"),
			request.getParameter("strasseInput"),
			Integer.parseInt(request.getParameter("plzInput")),
			request.getParameter("ortInput"),
			request.getParameter("landInput"),
			request.getParameter("gebdatInput"),
			request.getParameter("abteilungInput"),
			request.getParameter("geschlechtInput"));
    }
%>

</head>

<body>
	<div class="container">
		<div class="row header">
			<div class="col-md-12">
				<h1>Mitarbeiter-Datenbank - einzelner Mitarbeiter</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="menu.html" />
			</div>
			<div class="row">
				<div class="col-md-12">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>