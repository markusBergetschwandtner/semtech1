package at.jku.semtech.miniprojekt1.utils;

import com.hp.hpl.jena.update.UpdateExecutionFactory;
import com.hp.hpl.jena.update.UpdateFactory;
import com.hp.hpl.jena.update.UpdateProcessor;
import com.hp.hpl.jena.update.UpdateRequest;

public class Test {

    public static void main(String[] args) {
	// updating the remote model using a query file
	System.out.println("begin update");

	UpdateRequest queryObj = UpdateFactory.read(Test.class.getResource(
		"update").getPath()
		+ "/init.ru");
	UpdateProcessor qexec = UpdateExecutionFactory.createRemoteForm(
		queryObj, Static.FUSEKI_ENDPOINT_UPDATE);
	qexec.execute();
	System.out.println("end update");

	// updating the remote model using a query string
	String updateSparql = "DROP ALL";

	System.out.println("begin update: " + updateSparql);

	queryObj = UpdateFactory.create(updateSparql);
	qexec = UpdateExecutionFactory.createRemoteForm(queryObj,
		Static.FUSEKI_ENDPOINT_UPDATE);
	// qexec.execute();
	System.out.println("end update");

	// creating model with Java objects
	// Label lBob = new Label("Bob", "de");
	// Entity bob = new Entity(Static.NS + "bob#me", lBob, FOAF.Person);
	//
	// Label lJane = new Label("Jane", "en");
	// Entity jane = new Entity(Static.NS + "jane#me", lJane, FOAF.Person);
	//
	// bob.addRelation(new Relation(FOAF.knows, new Label("kennt", "de"),
	// jane));

	// System.out.println(bob.toString());
    }
}
