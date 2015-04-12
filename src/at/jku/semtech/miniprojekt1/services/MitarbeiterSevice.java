package at.jku.semtech.miniprojekt1.services;

import at.jku.semtech.miniprojekt1.entities.Entity;
import at.jku.semtech.miniprojekt1.entities.Label;
import at.jku.semtech.miniprojekt1.utils.Static;

import com.hp.hpl.jena.sparql.vocabulary.FOAF;
import com.hp.hpl.jena.update.UpdateExecutionFactory;
import com.hp.hpl.jena.update.UpdateFactory;
import com.hp.hpl.jena.update.UpdateProcessor;
import com.hp.hpl.jena.update.UpdateRequest;
import com.hp.hpl.jena.vocabulary.VCARD;

public class MitarbeiterSevice {

    public MitarbeiterSevice() {

    }

    public int createMitarbeiter(String vname, String nname, String strasse,
	    int plz, String land, String gebdat, String abteilung,
	    String geschlecht) {
	// create person object
	Label l_vname = new Label(FOAF.firstName, vname, "de");
	Label l_nname = new Label(FOAF.surname, nname, "de");
	Label l_strasse = new Label(VCARD.Street, strasse, "de");
	Label l_plz = new Label(VCARD.Pcode, plz, "de");
	Label l_land = new Label(VCARD.Country, land, "de");
	Label l_gebdat = new Label(FOAF.birthday, gebdat, "de");
	Label l_abteilung = new Label(VCARD.Orgunit, abteilung, "de");
	Label l_geschlecht = new Label(FOAF.gender, geschlecht, "de");
	Entity mitarbeiter = new Entity(
		Static.NS + vname + "_" + nname + "#me", FOAF.Person);
	mitarbeiter.addProperty(l_vname);
	mitarbeiter.addProperty(l_nname);
	mitarbeiter.addProperty(l_strasse);
	mitarbeiter.addProperty(l_plz);
	mitarbeiter.addProperty(l_land);
	mitarbeiter.addProperty(l_gebdat);
	mitarbeiter.addProperty(l_abteilung);
	mitarbeiter.addProperty(l_geschlecht);

	// updating the remote model using a query string
	// TODO
	String updateSparql = "DROP ALL;";

	System.out.println("begin update: " + updateSparql);

	UpdateRequest queryObj = UpdateFactory.create(updateSparql);
	UpdateProcessor qexec = UpdateExecutionFactory.createRemoteForm(
		queryObj, Static.FUSEKI_ENDPOINT_UPDATE);
	// qexec.execute();
	System.out.println("end update");

	return 1;
    }

}
