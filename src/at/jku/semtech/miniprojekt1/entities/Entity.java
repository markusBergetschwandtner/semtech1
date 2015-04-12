package at.jku.semtech.miniprojekt1.entities;

import java.util.ArrayList;
import java.util.List;

import com.hp.hpl.jena.rdf.model.Resource;

public class Entity {
    private String uri;
    private Resource type;
    private List<Relation> relations;
    private List<Label> properties;

    public Entity(String uri, Resource type) {
	this.uri = uri;
	this.type = type;
	this.relations = new ArrayList<Relation>();
    }

    public String getUri() {
	return uri;
    }

    public void setUri(String uri) {
	this.uri = uri;
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

    public List<Label> getProperties() {
	return properties;
    }

    public void addProperties(List<Label> properties) {
	this.properties.addAll(properties);
    }

    public void addProperty(Label property) {
	this.properties.add(property);
    }

    @Override
    public String toString() {
	return "Entity [uri=" + uri + ", type=" + type + ", relations="
		+ relations + ", properties=" + properties + "]";
    }
}
