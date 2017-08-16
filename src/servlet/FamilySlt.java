package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("all")
public class FamilySlt extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		String operation = request.getParameter("operation");
		System.out.println(operation);
		switch (operation) {
		case "add":
			add();
			break;
		case "delete":
			delete();
			break;
		case "query":
			query();
			break;
		case "update":
			update();
			break;

		}
		out.flush();
		out.close();
	}

	public static void add() {

	}

	public void delete() {

	}

	public void query() {

	}

	public void update() {

	}
}
