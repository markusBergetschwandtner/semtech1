package at.jku.semtech.miniprojekt1.utils;

import java.util.HashMap;
import java.util.Map;

import at.jku.semtech.miniprojekt1.services.MitarbeiterSevice;

public class Test {

    public static void main(String[] args) {
	MitarbeiterSevice mitarbeiterSevice = new MitarbeiterSevice();
	Map<String, String> map = new HashMap<String, String>();
	// mitarbeiterSevice.createMitarbeiter("Hans", "Huber", "Straﬂe 1",
	// "1010", "Wien", "÷sterreich", "01.03.1990", "Buchhaltung", "m",
	// null, null);
	// map.put("foaf:knows", "Hans_Huber");
	// mitarbeiterSevice.createMitarbeiter("Markus", "Bergetschwandtner",
	// "Sonnenhang 1", "5310", "Mondsee", "÷sterreich", "29.07.1991",
	// "ICS480-SW.ext", "m", null, null);
	// mitarbeiterSevice.createMitarbeiter("Nicola", "Schachinger",
	// "Nirgendwo 3", "4321", "Ampflwang", "÷sterreich", "12.05.1991",
	// "Softwareentwicklung", "w", null, null);
	// mitarbeiterSevice.createMitarbeiter("Alex", "Sch‰rfl",
	// "Landstraﬂe 3",
	// "4020", "Linz", "÷sterreich", "03.02.1992", "HR", "m", null,
	// null);
	// mitarbeiterSevice.addRelation("Nicola_Schachinger",
	// "vcard:sweetheart",
	// "Alex_Sch‰rfl");
	// mitarbeiterSevice.addRelation("Alex_Sch‰rfl", "vcard:sweetheart",
	// "Nicola_Schachinger");
	// mitarbeiterSevice.addRelation("Nicola_Schachinger", "vcard:coworker",
	// "Markus_Bergetschwandtner");
	// mitarbeiterSevice.addRelation("Markus_Bergetschwandtner",
	// "vcard:friend", "Alex_Sch‰rfl");
	// mitarbeiterSevice.moveMitarbeiter("Markus", "Bergetschwandtner1");
	// System.out.println(mitarbeiterSevice
	// .getMitarbeiterByAbteilung("ICS480-SW.ext"));
	System.out.println(mitarbeiterSevice
		.getMitarbeiterListByNname("Schmidt"));
    }
}
