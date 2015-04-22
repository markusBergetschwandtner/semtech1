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
import com.hp.hpl.jena.update.UpdateFactory;
import com.hp.hpl.jena.update.UpdateRequest;
import com.hp.hpl.jena.vocabulary.VCARD;

public class MitarbeiterSevice {
    private TwinkqlContextFactory factory;
    private TwinkqlTemplate template = null;

    public MitarbeiterSevice() {
	factory = new TwinkqlContextFactory(Static.FUSEKI_ENDPOINT_QUERY,
		"classpath:at/jku/semtech/miniprojekt1/mapping/*.xml");
	TwinkqlConfig.configure(factory);
    }

    public int createMitarbeiter(String vname, String nname, String strasse,
	    int plz, String ort, String land, String gebdat, String abteilung,
	    String geschlecht) {
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
	// TODO
	String updateSparql = Static.PREFIX_RDF + Static.PREFIX;
	updateSparql += " INSERT DATA { ";
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
	updateSparql += "};";

	System.out.println("begin update: " + updateSparql);

	UpdateRequest queryObj = UpdateFactory.create(updateSparql);
	// UpdateProcessor qexec = UpdateExecutionFactory.createRemoteForm(
	// queryObj, Static.FUSEKI_ENDPOINT_UPDATE);
	// qexec.execute();
	System.out.println("end update");

	return 1;
    }

    public void getMitarbeiter() {
	try {
	    template = new TwinkqlTemplateFactory(factory.getTwinkqlContext())
		    .getTwinkqlTemplate();
	} catch (Exception e) {
	    e.printStackTrace();
	}

	Map<String, Object> params = new HashMap<String, Object>();
	params.put("vorname", "Markus");
	Person person = template.selectForObject("param", "getPerson", params,
		Person.class);
	// System.out.println(person.toString());
    }
}
