<!DOCTYPE html>

<%@page import="java.util.Map"%>
<%@page import="at.jku.semtech.miniprojekt1.utils.Utils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.hp.hpl.jena.query.*"%>
<%@ page import="com.hp.hpl.jena.rdf.model.*"%>

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

<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
	
</script>

<script>
	var map;
	function initialize() {

		map = new google.maps.Map(document.getElementById("googleMap"), {
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});

		var markers = new Array();
		var infowindows = new Array();
		var pos = new Array();
		var markerBounds = new google.maps.LatLngBounds();
<%String strasse = request.getParameter("strasse");
	    String plz = request.getParameter("plz");
	    String ort = request.getParameter("ort");
	    String land = request.getParameter("land");

	    Utils utils = new Utils();
	    Map<String, String> lngLat = utils.getLongLat(strasse, plz, ort,
		    land);

	    double lon = Double.parseDouble(lngLat.get("lng"));
	    double lat = Double.parseDouble(lngLat.get("lat"));

	    String text = strasse + ", " + plz + ", " + ort + ", " + land;

	    out.print("infowindows[1] = new google.maps.InfoWindow({content:'"
		    + text + "'});");
	    out.print("pos[1] = new google.maps.LatLng(" + lat + ", " + lon
		    + ");");
	    out.print("markers[1] = new google.maps.Marker({position : pos[1], map : map});");
	    out.print("google.maps.event.addListener(markers[1], 'mouseover', function() { infowindows[1].open(map,markers[1]); });");
	    out.print("google.maps.event.addListener(markers[1], 'mouseout', function() { infowindows[1].close(map,markers[1]); });");
	    //out.print("google.maps.event.addListener(markers[1], 'click', function() { window.location.href='laureatesCountry.jsp?country="+countryCode+"'; });");			
	    out.print("markerBounds.extend(pos[1]);");%>
		map.setCenter(markerBounds.getCenter());
		map.fitBounds(markerBounds);
		var listener = google.maps.event.addListener(map, "idle", function() {
				map.setZoom(8);
			google.maps.event.removeListener(listener);
		});
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Mitarbeiter-Datenbank - zeige Adresse</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="menu.html" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h2>Adresse von Mitarbeiter</h2>
			</div>
		</div>
		<div class="row details">
			<div id="googleMap" style="width: 1000px; height: 760px;"></div>
		</div>
	</div>
</body>
</html>