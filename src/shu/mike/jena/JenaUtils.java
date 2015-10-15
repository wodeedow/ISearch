package shu.mike.jena;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import shu.mike.file.FilePathUtil;

import com.hp.hpl.jena.ontology.OntDocumentManager;
import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.ontology.OntModelSpec;
import com.hp.hpl.jena.rdf.model.InfModel;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Property;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.rdf.model.Statement;
import com.hp.hpl.jena.rdf.model.StmtIterator;
import com.hp.hpl.jena.reasoner.Reasoner;
import com.hp.hpl.jena.reasoner.rulesys.GenericRuleReasoner;
import com.hp.hpl.jena.reasoner.rulesys.Rule;

public class JenaUtils {
	private static String SOURCE = "http://www.owl-ontologies.com/unnamed.owl#";
	private  static OntModel createModelFromFile(String filepath) throws FileNotFoundException, UnsupportedEncodingException 
	{
		OntModel model=null;
		model = ModelFactory.createOntologyModel(OntModelSpec.OWL_MEM);
		OntDocumentManager dm = model.getDocumentManager();
		dm.addAltEntry(SOURCE, "file:///" + FilePathUtil.LIBOWL_PATH);
		model.read(SOURCE, "RDF/XML");// 创建基本模型
		return model;
	}
	private static ArrayList<String> printStatements(String upstr, Model m, Resource s, Property p,
			Resource o) {
		ArrayList<String> l = new ArrayList<String>();
		for (StmtIterator i = m.listStatements(s, p, o); i.hasNext();) {
			Statement stmt = i.nextStatement();
			String str = stmt.getObject().toString();
			if (str.indexOf("#") > 0) {
				String cont = str.substring(str.lastIndexOf("#") + 1);
				if (!cont.equals("Class")) {
					System.out.println(cont);
					l.add(cont);
				}
			}
		}
		return l;
	}

	private  static ArrayList<String> search(OntModel data,String str) throws FileNotFoundException, UnsupportedEncodingException {
		String relstr = str;
		String rules = "[rule1:(?a rdfs:subClassOf ?b),(?b rdfs:subClassOf ?c)->(?a rdfs:subClassOf ?c)]";
		Reasoner reasoner = new GenericRuleReasoner(Rule.parseRules(rules));
		InfModel inf = ModelFactory.createInfModel(reasoner, data);
		Resource resource = inf.getResource(relstr);
		return printStatements(str, inf, resource, null, null);
	}
	public static ArrayList<String> getRecommendationList(String keyWords)
	{
		OntModel model;
		ArrayList<String> result=null;
		try {
			model = JenaUtils.createModelFromFile(FilePathUtil.LIBOWL_PATH);
			result=JenaUtils.search(model, "http://www.owl-ontologies.com/unnamed.owl#"+keyWords.trim());
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

}
