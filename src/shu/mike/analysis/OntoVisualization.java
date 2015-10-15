package shu.mike.analysis;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.json.JSONArray;
import org.json.JSONObject;

import com.hp.hpl.jena.ontology.OntClass;
import com.hp.hpl.jena.ontology.OntDocumentManager;
import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.ontology.OntModelSpec;
import com.hp.hpl.jena.rdf.model.ModelFactory;

import shu.mike.file.FilePathUtil;

/**
 * Servlet implementation class OntoVisualization
 */
public class OntoVisualization extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OntoVisualization() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//设置编码字符集为utf-8
        PrintWriter outs = response.getWriter(); 
        outs.print(getJson().toString());
        outs.flush();
        outs.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	private   JSONObject  getJson( )
	{
		String SOURCE = "http://www.owl-ontologies.com/unnamed.owl";
        //创建基本模型
        OntModel base = ModelFactory.createOntologyModel(OntModelSpec.OWL_MEM);
        OntDocumentManager dm = base.getDocumentManager();
		dm.addAltEntry(SOURCE,"file:///" + FilePathUtil.LIBOWL_PATH);
		base.read(SOURCE,"RDF/XML");
		JSONObject jsonRoot = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(Iterator<OntClass> i = base.listClasses(); i.hasNext();){
			OntClass c = i.next();
			if(c.getLocalName() != null && c.listSuperClasses().hasNext()==false){
				JSONObject jsonObj = createJson(c);
				jsonArray.put(jsonObj);
			}
	    }
		jsonRoot.put("name","Thing");
		jsonRoot.put("children", jsonArray);
		return jsonRoot;
	}
	private   JSONObject createJson(OntClass className)
	{
		JSONObject jsonRoot = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		jsonRoot.put("name", className.getLocalName());
		for(Iterator<OntClass> i = className.listSubClasses(); i.hasNext(); )
		{
			OntClass c = i.next();
			if(c.getLocalName() != null)
			{
				if(c.listSubClasses().hasNext())
				{
					JSONObject json = createJson(c);
					jsonArray.put(json);
				}
				else
				{
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("name", c.getLocalName());
					jsonArray.put(jsonObj);
				}
			}
		}
		jsonRoot.put("children", jsonArray);
		return jsonRoot;
	}

}
