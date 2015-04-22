package at.jku.semtech.miniprojekt1.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.twinkql.context.TwinkqlContextFactory;
import org.twinkql.template.TwinkqlTemplate;
import org.twinkql.template.TwinkqlTemplateFactory;

import at.jku.semtech.miniprojekt1.entities.Entity;
import at.jku.semtech.miniprojekt1.entities.Label;
import at.jku.semtech.miniprojekt1.entities.Person;
import at.jku.semtech.miniprojekt1.utils.Static;
import at.jku.semtech.miniprojekt1.utils.TwinkqlConfig;

import com.hp.hpl.jena.sparql.vocabulary.FOAF;
import com.hp.hpl.jena.update.UpdateExecutionFactory;
import com.hp.hpl.jena.update.UpdateFactory;
import com.hp.hpl.jena.update.UpdateProcessor;
import com.hp.hpl.jena.update.UpdateRequest;
import com.hp.hpl.jena.vocabulary.VCARD;

public class MitarbeiterSevice {
    private TwinkqlContextFactory factory;
    private TwinkqlTemplate template = null;

    public MitarbeiterSevice() {
	factory = new TwinkqlContextFactory(Static.FUSEKI_ENDPOINT_QUERY,
		"classpath:at/jku/semtech/miniprojekt1/mapping/*.xml");
	TwinkqlConfig.configure(factory);

	try {
	    template = new TwinkqlTemplateFactory(factory.getTwinkqlContext())
		    .getTwinkqlTemplate();
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    public int createMitarbeiter(String vname, String nname, String strasse,
	    String plz, String ort, String land, String gebdat,
	    String abteilung, String geschlecht, String graph) {
	// create person object
	String name = vname + "_" + nname;
	Label l_vname = new Label(FOAF.firstName, vname, "de");
	Label l_nname = new Label(FOAF.surname, nname, "de");
	Label l_strasse = new Label(VCARD.Street, strasse, "de");
	Label l_plz = new Label(VCARD.Pcode, plz, "de");
	Label l_ort = new Label(VCARD.Locality, ort, "de");
	Label l_land = new Label(VCARD.Country, land, "de");
	Label l_gebdat = new Label(FOAF.birthday, gebdat, "de");
	Label l_abteilung = new Label(VCARD.Orgunit, abteilung, "de");
	Label l_geschlecht = new Label(FOAF.gender, geschlecht, "de");
	Entity mitarbeiter = new Entity(Static.NS + name + "#me", FOAF.Person);
	mitarbeiter.addProperty(l_vname);
	mitarbeiter.addProperty(l_nname);
	mitarbeiter.addProperty(l_strasse);
	mitarbeiter.addProperty(l_plz);
	mitarbeiter.addProperty(l_ort);
	mitarbeiter.addProperty(l_land);
	mitarbeiter.addProperty(l_gebdat);
	mitarbeiter.addProperty(l_abteilung);
	mitarbeiter.addProperty(l_geschlecht);

	// updating the remote model using a query string
	String updateSparql = Static.PREFIX_RDF + Static.PREFIX;
	updateSparql += " INSERT DATA { ";
	if (!graph.equals("")) {
	    updateSparql += " GRAPH <http://example.org/" + graph + "/> { ";
	}

	updateSparql += Static.PREFIX_SHORT + name + " a " + "<"
		+ mitarbeiter.getType().getURI() + ">; ";
	List<Label> props = mitarbeiter.getProperties();
	for (int i = 0; i < props.size(); i++) {
	    updateSparql += "<" + props.get(i).getProperty().getURI() + "> '"
		    + props.get(i).getValue();
	    if (i == props.size() - 1) {
		updateSparql += "'. ";
	    } else {
		updateSparql += "'; ";
	    }
	}
	if (!graph.equals("")) {
	    updateSparql += "}";
	}
	updateSparql += "};";

	System.out.println("begin update: " + updateSparql);

	UpdateRequest queryObj = UpdateFactory.create(updateSparql);
	UpdateProcessor qexec = UpdateExecutionFactory.createRemoteForm(
		queryObj, Static.FUSEKI_ENDPOINT_UPDATE);
	qexec.execute();
	System.out.println("end update");

	return 1;
    }

    public int deleteMitarbeiter(String vname, String nname) {
	String updateSparql = Static.PREFIX_RDF + Static.PREFIX
		+ Static.PREFIX_FOAF + Static.PREFIX_VCARD;
	updateSparql += " DELETE WHERE { ?person ?pred ?obj. ?person foaf:firstName '";
	updateSparql += vname + "'. ?person foaf:surname '" + nname + "'.} ";

	System.out.println("begin delete: " + updateSparql);

	UpdateRequest queryObj = UpdateFactory.create(updateSparql);
	UpdateProcessor qexec = UpdateExecutionFactory.createRemoteForm(
		queryObj, Static.FUSEKI_ENDPOINT_UPDATE);
	qexec.execute();
	System.out.println("end delete");
	return 1;
    }

    public Person getMitarbeiterByNname(String nname) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("nname", nname);
	System.out.println("getPersonByName: " + nname);
	Person person = template.selectForObject("param", "getPersonByNname",
		params, Person.class);
	return person;
    }

    public int moveMitarbeiter(String vname, String nname) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("nname", nname);
	params.put("vname", vname);
	System.out.println("getPersonByName: " + nname);
	Person person = template.selectForObject("param",
		"getPersonByNnameVname", params, Person.class);
	deleteMitarbeiter(vname, nname);
	createMitarbeiter(person.getVname(), person.getNname(),
		person.getStrasse(), person.getPlz(), person.getOrt(),
		person.getLand(), person.getGebDat(), person.getAbteilung(),
		person.getGeschlecht(), "gr_mitarbeiter_delete");
	return 1;
    }

    public List<Person> getMitarbeiterByAbteilung(String abteilung) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("abteilung", abteilung);
	System.out.println("getPersonByAbteilung: " + abteilung);
	List<Person> persons = template.selectForList("param",
		"getPersonByAbteilung", params, Person.class);
	return persons;
    }
}
