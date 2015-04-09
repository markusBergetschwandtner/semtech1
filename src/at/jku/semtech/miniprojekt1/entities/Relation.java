package at.jku.semtech.miniprojekt1.entities;

import com.hp.hpl.jena.rdf.model.Property;

public class Relation {
    private Property property;
    private Label label;
    private Entity entity;

    public Relation(Property property, Label label, Entity entity) {
	this.property = property;
	this.label = label;
	this.entity = entity;
    }

    public Property getProperty() {
	return property;
    }

    public void setProperty(Property property) {
	this.property = property;
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

    @Override
    public String toString() {
	return "Relation [property=" + property + ", label=" + label
		+ ", entity=" + entity + "]";
    }
}
