package shu.mike.jena;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;

import com.hp.hpl.jena.ontology.OntClass;
import com.hp.hpl.jena.ontology.OntDocumentManager;
import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.ontology.OntModelSpec;
import com.hp.hpl.jena.rdf.model.ModelFactory;

import shu.mike.file.FilePathUtil;

public class OntoManagerUtil
{
	private String SOURCE = "http://www.owl-ontologies.com/unnamed.owl#";
	private OntModel base;
	public OntoManagerUtil()
	{
		base = ModelFactory.createOntologyModel(OntModelSpec.OWL_MEM);
		OntDocumentManager dm = base.getDocumentManager();
		dm.addAltEntry(SOURCE, "file:///" + FilePathUtil.LIBOWL_PATH);
		base.read(SOURCE, "RDF/XML");// 创建基本模型
	}
	public   boolean addSubClass(String className, String subClassName)
	{
		OntClass superClass = base.getOntClass(SOURCE + className);
		OntClass subClass = base.createClass(SOURCE + subClassName);
		superClass.addSubClass(subClass);
		File f = new File(FilePathUtil.LIBOWL_PATH);
		OutputStream output;
		try
		{
			output = new FileOutputStream(f);
			base.write(output);
			return true;
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
			return false;
		}

	}
	public  boolean removeClass(String className)
	{
		OntClass superClass = base.getOntClass(SOURCE + className);
		superClass.remove();
		File f = new File(FilePathUtil.LIBOWL_PATH);
		OutputStream output;
		try
		{
			output = new FileOutputStream(f);
			base.write(output);
			return true;
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
			return false;
		}
	}

}
