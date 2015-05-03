<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="at.jku.semtech.miniprojekt1.entities.Person"%>
<%@page import="at.jku.semtech.miniprojekt1.services.MitarbeiterSevice"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.hp.hpl.jena.query.*"%>

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
	<%
		String mode = request.getParameter("searchMode");
		String h2Value = "Keine Einträge gefunden";
		MitarbeiterSevice mitarbeiterService = new MitarbeiterSevice();
		List<Person> pList = null;
		String input = "";

		if (mode.equals("allDiv")) {
			h2Value = "Alle Mitarbeiter";
			pList = mitarbeiterService.getMitarbeiterListByNname("");
		}
		
		if (mode.equals("genderDiv")) {
			String gender = request.getParameter("geschlechtInput");
			input = gender;
			if(gender.equals("m")){
				gender = "männlichen";
			}else{
				gender = "weiblichen";
			}
			h2Value = "Alle "+gender+" Mitarbeiter";
			pList = mitarbeiterService.getMitarbeiterListByGeschlecht(input);
		}
		
		if (mode.equals("nameDiv")) {
			input = request.getParameter("nnameInput");
			String input2 = request.getParameter("vnameInput");
			
			h2Value = "Mitarbeiter nach Vorname "+"'"+input2+"'"+" und Nachname "+"'"+input+"'"+" gefiltert";
			pList = mitarbeiterService.getMitarbeiterListByNnameVname(input,input2);
		}
		
		if (mode.equals("zipDiv")) {
			input = request.getParameter("plzInput");
			h2Value = "Alle Mitarbeiter mit der PLZ "+input;
			pList = mitarbeiterService.getMitarbeiterListByPlz(input);
		}
		
		if (mode.equals("locDiv")) {
			input = request.getParameter("ortInput");
			h2Value = "Alle Mitarbeiter wohnhaft in "+input;
			pList = mitarbeiterService.getMitarbeiterListByOrt(input);
		}
		
		if (mode.equals("countryDiv")) {
			input = request.getParameter("landInput");
			h2Value = "Alle Mitarbeiter wohnhaft in "+input;
			pList = mitarbeiterService.getMitarbeiterListByLand(input);
		}
		
		if (mode.equals("divDiv")) {
			input = request.getParameter("abteilungInput");
			h2Value = "Alle Mitarbeiter der Abteilung "+input;
			pList = mitarbeiterService.getMitarbeiterListByAbteilung(input);
		}
		
	%>

	<div class="container">
		<div class="row header">
			<div class="col-md-12">
				<h1>Mitarbeiter-Datenbank</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="menu.html" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h2>
					<%
						out.write(h2Value);
					%>
				</h2>
			</div>
		</div>

		<div class="row details">
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Option</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Person p : pList) {
								out.write("<tr>");
								out.write("<td><a href='singleMitarbeiter.jsp?update=false&name="
										+ p.getVname() + "_" + p.getNname() + "'>"
										+ p.getVname() + " " + p.getNname() + "</a></td>");
								out.write("<td>  <a href='deleteMitarbeiter.jsp?name="+p.getVname()+"_"+p.getNname()+"'_parent'><button type='button' onClick='deletePerson()' id='deleteButton' class='btn btn-default'> Löschen</button></a> </td>");
								out.write("</tr>");
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>