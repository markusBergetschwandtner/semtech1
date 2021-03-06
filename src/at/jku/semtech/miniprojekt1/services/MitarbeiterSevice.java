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

    public void createMitarbeiter(String vname, String nname, String strasse,
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
	if (graph != null) {
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
	if (graph != null) {
	    updateSparql += "}";
	}
	updateSparql += "};";

	System.out.println("begin update: " + updateSparql);
	updateRequest(updateSparql);
	System.out.println("end update");
    }

    public void addRelation(String fromUri, String property, String toUri,
	    String graph) {
	String updateSparql = Static.PREFIX_RDF + Static.PREFIX
		+ Static.PREFIX_FOAF + Static.PREFIX_VCARD;
	updateSparql += " INSERT DATA { ";
	if (graph != null) {
	    updateSparql += " GRAPH <http://example.org/" + graph + "/> { ";
	}
	updateSparql += ":" + fromUri + " " + property + " :" + toUri + ".";
	if (graph != null) {
	    updateSparql += "}";
	}
	updateSparql += "};";

	System.out.println("begin update: " + updateSparql);
	updateRequest(updateSparql);
	System.out.println("end update");
    }

    public void deleteMitarbeiter(String vname, String nname) {
	String updateSparql = Static.PREFIX_RDF + Static.PREFIX
		+ Static.PREFIX_FOAF + Static.PREFIX_VCARD;
	updateSparql += " DELETE WHERE { ?person ?pred ?obj. ?person foaf:firstName '";
	updateSparql += vname + "'. ?person foaf:surname '" + nname + "'.} ";

	System.out.println("begin delete: " + updateSparql);
	updateRequest(updateSparql);
	// deleteRelations(vname + "_" + nname);
	System.out.println("end delete");
    }

    public void moveMitarbeiter(String vname, String nname) {
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
	for (String co : person.getCoworker()) {
	    if (co != null) {
		addRelation(vname + "_" + nname, "vcard:coworker", co,
			"gr_mitarbeiter_delete");
	    }
	}

	for (String fr : person.getFriend()) {
	    if (fr != null) {
		addRelation(vname + "_" + nname, "vcard:friend", fr,
			"gr_mitarbeiter_delete");
	    }
	}

	for (String kn : person.getKnows()) {
	    if (kn != null) {
		addRelation(vname + "_" + nname, "foaf:knows", kn,
			"gr_mitarbeiter_delete");
	    }
	}

	for (String sw : person.getSweetheart()) {
	    if (sw != null) {
		addRelation(vname + "_" + nname, "vcard:sweetheart", sw,
			"gr_mitarbeiter_delete");
	    }
	}
    }

    public int updateMitarbeiter(String vname, String nname, String strasse,
	    String plz, String ort, String land, String gebdat,
	    String abteilung, String geschlecht) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("nname", nname);
	params.put("vname", vname);
	deleteMitarbeiter(vname, nname);
	createMitarbeiter(vname, nname, strasse, plz, ort, land, gebdat,
		abteilung, geschlecht, null);
	return 1;
    }

    public List<Person> getMitarbeiterListByNname(String nname) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("nname", nname);
	System.out.println("getPersonByName: " + nname);
	List<Person> persons = template.selectForList("param",
		"getPersonByNname", params, Person.class);
	return persons;
    }

    public List<Person> getMitarbeiterListByNnameVname(String nname,
	    String vname) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("nname", nname);
	params.put("vname", vname);
	System.out.println("getPersonByNameVname: " + nname + " " + vname);
	List<Person> persons = template.selectForList("param",
		"getPersonByNnameVname", params, Person.class);
	return persons;
    }

    public List<Person> getMitarbeiterListByGeschlecht(String geschlecht) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("geschlecht", geschlecht);
	System.out.println("getPersonByGeschlecht: " + geschlecht);
	List<Person> persons = template.selectForList("param",
		"getPersonByGeschlecht", params, Person.class);
	return persons;
    }

    public List<Person> getMitarbeiterListByPlz(String plz) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("plz", plz);
	System.out.println("getPersonByPlz: " + plz);
	List<Person> persons = template.selectForList("param",
		"getPersonByPlz", params, Person.class);
	return persons;
    }

    public List<Person> getMitarbeiterListByOrt(String ort) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("ort", ort);
	System.out.println("getPersonByOrt: " + ort);
	List<Person> persons = template.selectForList("param",
		"getPersonByOrt", params, Person.class);
	return persons;
    }

    public List<Person> getMitarbeiterListByLand(String land) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("land", land);
	System.out.println("getPersonByLand: " + land);
	List<Person> persons = template.selectForList("param",
		"getPersonByLand", params, Person.class);
	return persons;
    }

    public List<Person> getMitarbeiterListByAbteilung(String abteilung) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("abteilung", abteilung);
	System.out.println("getPersonByAbteilung: " + abteilung);
	List<Person> persons = template.selectForList("param",
		"getPersonByAbteilung", params, Person.class);
	return persons;
    }

    public Person getMitarbeiterByUri(String uri) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("person", uri);
	System.out.println("getPersonByUri: " + uri);
	Person person = template.selectForObject("param", "getPersonByUri",
		params, Person.class);
	return person;
    }

    private void updateRequest(String update) {
	UpdateRequest queryObj = UpdateFactory.create(update);
	UpdateProcessor qexec = UpdateExecutionFactory.createRemoteForm(
		queryObj, Static.FUSEKI_ENDPOINT_UPDATE);
	qexec.execute();
    }
}
