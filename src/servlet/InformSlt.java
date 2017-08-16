package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.InformService;

@SuppressWarnings("all")
public class InformSlt extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String operation = request.getParameter("operation");
		switch (operation) {
		case "add":
			add(request, response);
			break;
		case "delete":
			delete(request, response);
			break;
		case "query":
			query(request, response);
			break;
		case "queryPart":
			queryPart(request, response);
			break;
		case "update":
			update(request, response);
			break;

		}
		out.flush();
		out.close();
	}

	public static void add(HttpServletRequest request,
			HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date date=new Date();
		InformService informService=new InformService();
		informService.insertInform(title,content,0,0,date,"1");
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) {

	}

	public void query(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json");
		List<Map<String, Object>> list=new ArrayList<>();
		InformService informService=new InformService();
		list=informService.getAllInforms();
		PrintWriter out=response.getWriter();
		Gson gson=new Gson();
		String informs=gson.toJson(list);
		out.print(informs);
	}
	public void queryPart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json");
		List<Map<String, Object>> list=new ArrayList<>();
		InformService informService=new InformService();
		list=informService.getInforms(0,8);
		PrintWriter out=response.getWriter();
		Gson gson=new Gson();
		String informs=gson.toJson(list);
		out.print(informs);
	}
	public void update(HttpServletRequest request, HttpServletResponse response) {

	}
}
