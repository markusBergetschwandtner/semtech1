package at.jku.semtech.miniprojekt1.entities;

public class Label {
    private Object value;
    private String language;

    public Label(Object value, String language) {
	this.value = value;
	this.language = language;
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
}
