package at.jku.semtech.miniprojekt1.utils;

import org.twinkql.context.ConfigBuilder;
import org.twinkql.context.TwinkqlContextFactory;
import org.twinkql.model.NamespaceDefinition;

public class TwinkqlConfig {

    public static void configure(TwinkqlContextFactory factory) {
	factory.setConfigBuilder(createPrefixes());

    }

    private static ConfigBuilder createPrefixes() {
	ConfigBuilder builder = new ConfigBuilder();
	builder.addNamespace(getDefinition("rdfs",
		"http://www.w3.org/2000/01/rdf-schema#"));
	builder.addNamespace(getDefinition("foaf", "http://xmlns.com/foaf/0.1"));
	builder.addNamespace(getDefinition("vcard",
		"http://www.w3.org/2001/vcard-rdf/3.0/"));
	builder.addNamespace(getDefinition("semtech",
		"http://www.jku.at/semtech/miniprojekt1"));
	return builder;
    }

    private static NamespaceDefinition getDefinition(String prefix, String uri) {
	NamespaceDefinition nsDef = new NamespaceDefinition();
	nsDef.setPrefix(prefix);
	nsDef.setUri(uri);
	return nsDef;
    }

}
