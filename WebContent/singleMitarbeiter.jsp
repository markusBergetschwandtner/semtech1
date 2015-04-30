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
    String name = request.getParameter("name");
    if (name == null) {
		name = request.getParameter("vnameInput") + "_"
			+ request.getParameter("nnameInput");
    }
    String update = request.getParameter("update");
    String change = request.getParameter("change");
    if (update == null) {
		update = "false";
    }
    if (change == null) {
		change = "false";
    }
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

		String co_values[] = request.getParameterValues("coworker");
		String fr_values[] = request.getParameterValues("friend");
		String kn_values[] = request.getParameterValues("knows");
		String sw_values[] = request.getParameterValues("sweetheart");

		if (co_values != null) {
		    for (int i = 0; i < co_values.length; i++) {
			mitarbeiterSevice.addRelation(name, "vcard:coworker",
				co_values[i]);
		    }
		}

		if (fr_values != null) {
		    for (int i = 0; i < fr_values.length; i++) {
			mitarbeiterSevice.addRelation(name, "vcard:friend",
				fr_values[i]);
		    }
		}

		if (kn_values != null) {
		    for (int i = 0; i < kn_values.length; i++) {
			mitarbeiterSevice.addRelation(name, "foaf:knows",
				kn_values[i]);
		    }
		}

		if (sw_values != null) {
		    for (int i = 0; i < sw_values.length; i++) {
			mitarbeiterSevice.addRelation(name, "vcard:sweetheart",
				sw_values[i]);
		    }
		}
    }

    if (change.equalsIgnoreCase("true")) {
		mitarbeiterSevice.updateMitarbeiter(
			request.getParameter("vnameInput"),
			request.getParameter("nnameInput"),
			request.getParameter("strasseInput"),
			request.getParameter("plzInput"),
			request.getParameter("ortInput"),
			request.getParameter("landInput"),
			request.getParameter("gebdatInput"),
			request.getParameter("abteilungInput"),
			request.getParameter("geschlechtInput"), null);
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
				    Person person = mitarbeiterSevice.getMitarbeiterByUri(name);
				%>
				<thead>
					<tr>
						<th style="width: 40%; text-align: right">
							<h3>
								<%
								    out.write(person.getVname() + " " + person.getNname());
								%>
							</h3>
						</th>
						<th style="width: 60%; text-align: right"><a
							href="createMitarbeiter.jsp?change=true&name=<%out.write(name);%>"><button
									type="button" class="btn btn-primary
								aria-label="LeftAlign">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									Bearbeiten
								</button></a>
							<button type="button" class="btn btn-danger"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								Löschen
							</button></th>
					</tr>
				</thead>
				<tbody>
					<%
					    out.write("<tr><td style='text-align: right'>Straße</td><td>" + person.getStrasse()
							    + "</td></tr>");
					    out.write("<tr><td style='text-align: right'>PLZ</td><td>" + person.getPlz() + "</td></tr>");
					    out.write("<tr><td style='text-align: right'>Ort</td><td>" + person.getOrt() + "</td></tr>");
					    out.write("<tr><td style='text-align: right'>Land</td><td>" + person.getLand() + "</td></tr>");
					    out.write("<tr><td style='text-align: right'>Abteilung</td><td>" + person.getAbteilung()
							    + "</td></tr>");
					    out.write("<tr><td style='text-align: right'>Geschlecht</td><td>" + person.getGeschlecht()
							    + "</td></tr>");
					    out.write("<tr><td></td><td></td></tr>");

					    List<String> coworker = person.getCoworker();
					    List<String> show_co = new ArrayList<String>();
					    List<String> friend = person.getFriend();
					    List<String> show_fr = new ArrayList<String>();
					    List<String> sweetheart = person.getSweetheart();
					    List<String> show_sw = new ArrayList<String>();
					    List<String> knows = person.getKnows();
					    List<String> show_kn = new ArrayList<String>();

					    int counter = 0;
					    for (String co : coworker) {
							if (show_co.contains(co)) {

							} else if (co != null) {
							    if (counter == 0) {
								//erster
								out.write("<tr><td style='text-align: right'>Arbeitskollegen</td><td><a href='singleMitarbeiter.jsp?update=false&name="
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
							    show_co.add(co);
							} else if (counter == 0) {
							    //keine
							    out.write("<tr><td style='text-align: right'>Arbeitskollegen</td><td>--- keine ---</td></tr>");
							}
							counter++;
					    }

					    out.write("<tr><td></td><td></td></tr>");
					    counter = 0;

					    for (String fr : friend) {
							if (show_fr.contains(fr)) {

							} else if (fr != null) {
							    if (counter == 0) {
								//erster
								out.write("<tr><td style='text-align: right'>Freunde</td><td><a href='singleMitarbeiter.jsp?update=false&name="
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
							    show_fr.add(fr);
							} else if (counter == 0) {
							    //keine
							    out.write("<tr><td style='text-align: right'>Freunde</td><td>--- keine ---</td></tr>");
							}
							counter++;
					    }

					    out.write("<tr><td></td><td></td></tr>");
					    counter = 0;

					    for (String kn : knows) {
							if (show_kn.contains(kn)) {

							} else if (kn != null) {
							    if (counter == 0) {
								//erster
								out.write("<tr><td style='text-align: right'>Bekannte</td><td><a href='singleMitarbeiter.jsp?update=false&name="
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
							    show_kn.add(kn);
							} else if (counter == 0) {
							    //keine
							    out.write("<tr><td style='text-align: right'>Bekannte</td><td>--- keine ---</td></tr>");
							}
							counter++;
					    }

					    out.write("<tr><td></td><td></td></tr>");
					    counter = 0;

					    for (String sw : sweetheart) {
							if (show_sw.contains(sw)) {

							} else if (sw != null) {
							    if (counter == 0) {
								//erster
								out.write("<tr><td style='text-align: right'>Affären</td><td><a href='singleMitarbeiter.jsp?update=false&name="
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
							    show_sw.add(sw);
							} else if (counter == 0) {
							    //keine
							    out.write("<tr><td style='text-align: right'>Affären</td><td>--- keine ---</td></tr>");
							}
							counter++;
					    }
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>