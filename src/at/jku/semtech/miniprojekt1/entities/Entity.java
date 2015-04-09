package at.jku.semtech.miniprojekt1.entities;

import java.util.ArrayList;
import java.util.List;

import com.hp.hpl.jena.rdf.model.Resource;

public class Entity {
    private String uri;
    private Label label;
    private Resource type;
    private List<Relation> relations;

    public Entity(String uri, Label label, Resource type) {
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

    public Resource getType() {
	return type;
    }

    public void setType(Resource type) {
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

    @Override
    public String toString() {
	return "Entity [uri=" + uri + ", label=" + label + ", type=" + type
		+ ", relations=" + relations + "]";
    }
}
