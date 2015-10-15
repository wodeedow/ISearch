package shu.mike.ikanalyzer;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shu.mike.manage.ManageDAO;
import shu.mike.manage.ManageInfo;

/**
 * Servlet implementation class InitIKAnalyzer
 */
public class InitIKAnalyzer extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InitIKAnalyzer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	public void init(ServletConfig conf) throws ServletException {
		super.init();
		StopWordSetting.addWords();
		System.out.println("start up add stop words.....");
	}
	

}
