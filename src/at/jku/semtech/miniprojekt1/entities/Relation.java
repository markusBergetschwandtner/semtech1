package at.jku.semtech.miniprojekt1.entities;

public class Relation {
    private String uri;
    private Label label;
    private Entity entity;

    public Relation(String uri, Label label, Entity entity) {
	this.uri = uri;
	this.label = label;
	this.entity = entity;
    }

    public String getUri() {
	return uri;
    }

    public void setUri(String uri) {
	this.uri = uri;
    }

    public Label getLabel() {
	return label;
    }

    public void setLabel(Label label) {
	this.label = label;
    }

    public Entity getEntity() {
	return entity;
    }

    public void setEntity(Entity entity) {
	this.entity = entity;
    }
}
