<!DOCTYPE html>

<%@page import="at.jku.semtech.miniprojekt1.entities.Person"%>
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
			request.getParameter("plzInput"),
			request.getParameter("ortInput"),
			request.getParameter("landInput"),
			request.getParameter("gebdatInput"),
			request.getParameter("abteilungInput"),
			request.getParameter("geschlechtInput"), null, null);
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
		</div>
		<div class="row">
			<table class="table table-striped table-bordered table-hover">
				<%
				    String name = request.getParameter("name");
				    if (name == null) {
						name = request.getParameter("vnameInput") + "_"
							+ request.getParameter("nnameInput");
				    }
				    Person person = mitarbeiterSevice.getMitarbeiterByUri(name);
				%>
				<thead>
					<tr>
						<th>
							<%
							    out.write(person.getVname() + " " + person.getNname());
							%>
						</th>
					</tr>
				</thead>
				<tbody>
					<%
					    out.write("<tr><td>Straﬂe</td><td>" + person.getStrasse()
							    + "</td></tr>");
					    out.write("<tr><td>PLZ</td><td>" + person.getPlz() + "</td></tr>");
					    out.write("<tr><td>Ort</td><td>" + person.getOrt() + "</td></tr>");
					    out.write("<tr><td>Land</td><td>" + person.getLand() + "</td></tr>");
					    out.write("<tr><td>Abteilung</td><td>" + person.getAbteilung()
							    + "</td></tr>");
					    out.write("<tr><td>Geschlecht</td><td>" + person.getGeschlecht()
							    + "</td></tr>");
					    out.write("<tr><td></td><td></td></tr>");

					    List<String> coworker = person.getCoworker();
					    List<String> friend = person.getFriend();
					    List<String> sweetheart = person.getSweetheart();
					    List<String> knows = person.getKnows();
					    String before = "";

					    int counter = 0;
					    for (String co : coworker) {
							if (before.equalsIgnoreCase(co)) {

							} else if (co != null) {
							    if (counter == 0) {
								//erster
								out.write("<tr><td>Arbeitskollegen</td><td><a href='singleMitarbeiter.jsp?update=false&name="
									+ co
									+ "'>"
									+ co.replace("_", " ")
									+ "</a></td>");
								out.write("</tr>");
							    } else {
								//andere
								out.write("<tr><td></td><td><a href='singleMitarbeiter.jsp?update=false&name="
									+ co
									+ "'>"
									+ co.replace("_", " ")
									+ "</a></td>");
								out.write("</tr>");
							    }
							} else if (counter == 0) {
							    //keine
							    out.write("<tr><td>Arbeitskollegen</td><td>--- keine ---</td></tr>");
							}
							counter++;
					    }

					    out.write("<tr><td></td><td></td></tr>");
					    counter = 0;

					    for (String fr : friend) {
							if (before.equalsIgnoreCase(fr)) {

							} else if (fr != null) {
							    if (counter == 0) {
								//erster
								out.write("<tr><td>Freunde</td><td><a href='singleMitarbeiter.jsp?update=false&name="
									+ fr
									+ "'>"
									+ fr.replace("_", " ")
									+ "</a></td>");
								out.write("</tr>");
							    } else {
								//andere
								out.write("<tr><td></td><td><a href='singleMitarbeiter.jsp?update=false&name="
									+ fr
									+ "'>"
									+ fr.replace("_", " ")
									+ "</a></td>");
								out.write("</tr>");
							    }
							} else if (counter == 0) {
							    //keine
							    out.write("<tr><td>Freunde</td><td>--- keine ---</td></tr>");
							}
							counter++;
					    }

					    out.write("<tr><td></td><td></td></tr>");
					    counter = 0;

					    for (String kn : knows) {
							if (before.equalsIgnoreCase(kn)) {

							} else if (kn != null) {
							    if (counter == 0) {
								//erster
								out.write("<tr><td>Bekannte</td><td><a href='singleMitarbeiter.jsp?update=false&name="
									+ kn
									+ "'>"
									+ kn.replace("_", " ")
									+ "</a></td>");
								out.write("</tr>");
							    } else {
								//andere
								out.write("<tr><td></td><td><a href='singleMitarbeiter.jsp?update=false&name="
									+ kn
									+ "'>"
									+ kn.replace("_", " ")
									+ "</a></td>");
								out.write("</tr>");
							    }
							} else if (counter == 0) {
							    //keine
							    out.write("<tr><td>Bekannte</td><td>--- keine ---</td></tr>");
							}
							counter++;
					    }

					    out.write("<tr><td></td><td></td></tr>");
					    counter = 0;

					    for (String sw : sweetheart) {
							if (before.equalsIgnoreCase(sw)) {

							} else if (sw != null) {
							    if (counter == 0) {
								//erster
								out.write("<tr><td>Aff‰ren</td><td><a href='singleMitarbeiter.jsp?update=false&name="
									+ sw
									+ "'>"
									+ sw.replace("_", " ")
									+ "</a></td>");
								out.write("</tr>");
							    } else {
								//andere
								out.write("<tr><td></td><td><a href='singleMitarbeiter.jsp?update=false&name="
									+ sw
									+ "'>"
									+ sw.replace("_", " ")
									+ "</a></td>");
								out.write("</tr>");
							    }
							} else if (counter == 0) {
							    //keine
							    out.write("<tr><td>Aff‰ren</td><td>--- keine ---</td></tr>");
							}
							counter++;
							before = sw;
					    }
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>