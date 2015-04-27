package at.jku.semtech.miniprojekt1.entities;

import java.net.URI;
import java.util.List;

public class Person {
    private URI uri;
    private String vname;
    private String nname;
    private String strasse;
    private String plz;
    private String ort;
    private String land;
    private String gebDat;
    private String abteilung;
    private String geschlecht;
    private List<String> knows;
    private List<String> friend;
    private List<String> coworker;
    private List<String> sweetheart;

    public URI getUri() {
	return uri;
    }

    public void setUri(URI uri) {
	this.uri = uri;
    }

    public String getVname() {
	return vname;
    }

    public void setVname(String vname) {
	this.vname = vname;
    }

    public String getNname() {
	return nname;
    }

    public void setNname(String nname) {
	this.nname = nname;
    }

    public String getStrasse() {
	return strasse;
    }

    public void setStrasse(String strasse) {
	this.strasse = strasse;
    }

    public String getPlz() {
	return plz;
    }

    public void setPlz(String plz) {
	this.plz = plz;
    }

    public String getOrt() {
	return ort;
    }

    public void setOrt(String ort) {
	this.ort = ort;
    }

    public String getLand() {
	return land;
    }

    public void setLand(String land) {
	this.land = land;
    }

    public String getGebDat() {
	return gebDat;
    }

    public void setGebDat(String gebDat) {
	this.gebDat = gebDat;
    }

    public String getAbteilung() {
	return abteilung;
    }

    public void setAbteilung(String abteilung) {
	this.abteilung = abteilung;
    }

    public String getGeschlecht() {
	return geschlecht;
    }

    public void setGeschlecht(String geschlecht) {
	this.geschlecht = geschlecht;
    }

    public List<String> getKnows() {
	return knows;
    }

    public void setKnows(List<String> knows) {
	this.knows = knows;
    }

    public List<String> getFriend() {
	return friend;
    }

    public void setFriend(List<String> friend) {
	this.friend = friend;
    }

    public List<String> getCoworker() {
	return coworker;
    }

    public void setCoworker(List<String> coworker) {
	this.coworker = coworker;
    }

    public List<String> getSweetheart() {
	return sweetheart;
    }

    public void setSweetheart(List<String> sweetheart) {
	this.sweetheart = sweetheart;
    }

    @Override
    public String toString() {
	return "Person [uri=" + uri + ", vname=" + vname + ", nname=" + nname
		+ ", strasse=" + strasse + ", plz=" + plz + ", ort=" + ort
		+ ", land=" + land + ", gebDat=" + gebDat + ", abteilung="
		+ abteilung + ", geschlecht=" + geschlecht + ", knows=" + knows
		+ ", friend=" + friend + ", coworker=" + coworker
		+ ", sweetheart=" + sweetheart + "]";
    }
}
