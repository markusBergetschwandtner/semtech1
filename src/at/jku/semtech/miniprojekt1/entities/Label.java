package at.jku.semtech.miniprojekt1.entities;

import com.hp.hpl.jena.rdf.model.Property;

public class Label {
    private Property property;
    private Object value;
    private String language;

    public Label(Property property, Object value, String language) {
	this.property = property;
	this.value = value;
	this.language = language;
    }

    public Property getProperty() {
	return property;
    }

    public void setProperty(Property property) {
	this.property = property;
    }

    public Object getValue() {
	return value;
    }

    public void setValue(Object value) {
	this.value = value;
    }

    public String getLanguage() {
	return language;
    }

    public void setLanguage(String language) {
	this.language = language;
    }

    @Override
    public String toString() {
	return "Label [property=" + property + ", value=" + value
		+ ", language=" + language + "]";
    }
}
