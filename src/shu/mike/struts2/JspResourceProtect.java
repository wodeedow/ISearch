package shu.mike.struts2;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shu.mike.bean.User;

/**
 * Servlet Filter implementation class JspResourceProtect
 */
public class JspResourceProtect implements Filter {

	/**
	 * Default constructor.
	 */
	public JspResourceProtect() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		String url=req.getRequestURI();
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("USER_OBJ");
		if(url.indexOf("disk.jsp")>0||url.indexOf("disk.jsp")>0||url.indexOf("commonAdminCenter.jsp")>0||url.indexOf("commonUserCenter.jsp")>0||url.indexOf("superAdminCenter.jsp")>0)
		{
			if(user==null)
			{
				System.out.println("redirect-> login.html   url  "+url);
				resp.sendRedirect("login.html");
			}
			else
			{
				chain.doFilter(request, response);
			}
		}
		else
		{
			chain.doFilter(request, response);
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
