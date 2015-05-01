<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mitarbeiter-Datenbank Suche</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap-ics.css">
<link rel="stylesheet" href="css/style.css">

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script>
	var divIds = [ "allDiv", "genderDiv", "nameDiv", "zipDiv", "locDiv",
			"countryDiv", "divDiv" ];

	function toggleView(divId) {
		for (i = 0; i < divIds.length; i++) {
			if (divIds[i] != divId)
				$("#" + divIds[i]).hide();
		}

		$('input[name="searchMode"]').val(divId);
		$("#" + divId).show();
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row header">
			<div class="col-md-12">
				<h1>Mitarbeiter-Datenbank Suche</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="menu.html" />
			</div>
			<form action="showMitarbeiter.jsp" method="get" name="formSearch">
				<div class="row">
					<input type="hidden" name="searchMode" value="" />
					<div class="col-md-6">
						<div class="btn-group">
							<button onclick="toggleView('allDiv')" type="button"
								class="btn btn-default">Alle</button>
							<button onclick="toggleView('genderDiv')" type="button"
								class="btn btn-default">Geschlecht</button>
							<button onclick="toggleView('nameDiv')" type="button"
								class="btn btn-default">Name</button>
							<button onclick="toggleView('zipDiv')" type="button"
								class="btn btn-default">PLZ</button>
							<button onclick="toggleView('locDiv')" type="button"
								class="btn btn-default">Ort</button>
							<button onclick="toggleView('countryDiv')" type="button"
								class="btn btn-default">Land</button>
							<button onclick="toggleView('divDiv')" type="button"
								class="btn btn-default">Abteilung</button>
						</div>
					</div>
				</div>
				<br> <br>
				<div class="col-md6">
					<div class="row">
						<div id="allDiv" style="display: none;" class="col-md-6">

							<p>
								<b>Alle Einträge ansehen</b>
							</p>
							<button type="submit" class="btn btn-default">Go</button>
						</div>
						<div id="genderDiv" style="display: none;" class="col-md-6">
							<div class="form-group">
								<label for="geschlechtInput">Geschlecht</label> <select
									class="form-control" name="geschlechtInput">
									<option value="m">männlich</option>
									<option value="w">weiblich</option>
								</select>
							</div>
							<button type="submit" class="btn btn-default">Go</button>
						</div>
						<div id="nameDiv" style="display: none;" class="col-md-6">
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
							<button type="submit" class="btn btn-default">Go</button>
						</div>
						<div id="zipDiv" style="display: none;" class="col-md-6">
							<div class="form-group">
								<label for="plzInput">PLZ</label> <input type="text"
									class="form-control" name="plzInput" placeholder="PLZ eingeben">
							</div>
							<button type="submit" class="btn btn-default">Go</button>
						</div>
						<div id="locDiv" style="display: none;" class="col-md-6">
							<div class="form-group">
								<label for="ortInput">Ort</label> <input type="text"
									class="form-control" name="ortInput" placeholder="Ort eingeben">
							</div>
							<button type="submit" class="btn btn-default">Go</button>
						</div>
						<div id="countryDiv" style="display: none;" class="col-md-6">
							<div class="form-group">
								<label for="landInput">Land</label> <input type="text"
									class="form-control" name="landInput"
									placeholder="Land eingeben">
							</div>
							<button type="submit" class="btn btn-default">Go</button>
						</div>
						<div id="divDiv" style="display: none;" class="col-md-6">
							<div class="form-group">
								<label for="abteilungInput">Abteilung</label> <input type="text"
									class="form-control" name="abteilungInput"
									placeholder="Abteilung eingeben">
							</div>
							<button type="submit" class="btn btn-default">Go</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>