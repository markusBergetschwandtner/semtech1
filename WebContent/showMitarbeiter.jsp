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
				<h2>Mitarbeiter</h2>
			</div>
		</div>

		<div class="row details">
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Aktion</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href='blubb'>asdf</a></td>
							<td>
								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle" type="button"
										id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
										Option <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="dropdownMenu1">
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">Bearbeiten</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1"
											href="#">Löschen</a></li>
									</ul>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>