package at.jku.semtech.miniprojekt1.utils;

import java.util.HashMap;
import java.util.Map;

import at.jku.semtech.miniprojekt1.services.MitarbeiterSevice;

public class Test {

    public static void main(String[] args) {
	MitarbeiterSevice mitarbeiterSevice = new MitarbeiterSevice();
	Map<String, String> map = new HashMap<String, String>();
	// foaf:knows = kennt
	// vcard:coworker = arbeitet mit
	// vcard:friend = befreundet mit
	// vcard:sweetheart = hat Affäre mit
	// map.put("foaf:knows", "Markus_Bergetschwandtner");
	// mitarbeiterSevice.createMitarbeiter("Markus", "Bergetschwandtner5",
	// "Sonnenhang 1", "5310", "Mondsee", "Austria", "1991-07-29",
	// "ICS480-SW.ext", "m", map, "");
	// mitarbeiterSevice.addRelation("Markus_Bergetschwandtner4",
	// "foaf:knows", "Markus_Bergetschwandtner2");
	// mitarbeiterSevice.moveMitarbeiter("Markus", "Bergetschwandtner1");
	// System.out.println(mitarbeiterSevice
	// .getMitarbeiterByAbteilung("ICS480-SW.ext"));
	System.out.println(mitarbeiterSevice
		.getMitarbeiterByNname("Bergetschwandtner4"));
    }
}
