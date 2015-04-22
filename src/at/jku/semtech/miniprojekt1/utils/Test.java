package at.jku.semtech.miniprojekt1.utils;

import at.jku.semtech.miniprojekt1.services.MitarbeiterSevice;

public class Test {

    public static void main(String[] args) {
	// updating the remote model using a query file
	// UpdateRequest queryObj = UpdateFactory.read(Test.class.getResource(
	// "update").getPath()
	// + "/init.ru");
	// UpdateProcessor qexec = UpdateExecutionFactory.createRemoteForm(
	// queryObj, Static.FUSEKI_ENDPOINT_UPDATE);
	// qexec.execute();

	// updating the remote model using a query string
	// String updateSparql = "DROP ALL";
	//
	// queryObj = UpdateFactory.create(updateSparql);
	// qexec = UpdateExecutionFactory.createRemoteForm(queryObj,
	// Static.FUSEKI_ENDPOINT_UPDATE);
	// qexec.execute();

	MitarbeiterSevice mitarbeiterSevice = new MitarbeiterSevice();
	// mitarbeiterSevice.createMitarbeiter("Markus", "Bergetschwandtner1",
	// "Sonnenhang 1", "5310", "Mondsee", "Austria", "1991-07-29",
	// "ICS480-SW.ext", "m", "");
	mitarbeiterSevice.moveMitarbeiter("Markus", "Bergetschwandtner1");
	System.out.println(mitarbeiterSevice
		.getMitarbeiterByAbteilung("ICS480-SW.ext"));

    }
}
