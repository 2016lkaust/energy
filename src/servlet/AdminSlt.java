package servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.BaseServlet;

public class AdminSlt extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public String listTeas(HttpServletRequest req, HttpServletResponse resp) { 
		
		
		return "/jsps/teacher/listTeas.jsp";
	}
}
