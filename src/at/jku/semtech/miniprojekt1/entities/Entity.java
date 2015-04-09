package at.jku.semtech.miniprojekt1.entities;

import java.util.ArrayList;
import java.util.List;

public class Entity {
    private String uri;
    private Label label;
    private String type;
    private List<Relation> relations;

    public Entity(String uri, Label label, String type) {
	this.uri = uri;
	this.label = label;
	this.type = type;
	this.relations = new ArrayList<Relation>();
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

    public String getType() {
	return type;
    }

    public void setType(String type) {
	this.type = type;
    }

    public List<Relation> getRelations() {
	return relations;
    }

    public void addRelations(List<Relation> relations) {
	this.relations.addAll(relations);
    }

    public void addRelation(Relation relation) {
	this.relations.add(relation);
    }
}
