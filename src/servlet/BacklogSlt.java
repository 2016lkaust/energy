package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.BacklogService;

@SuppressWarnings("all")
public class BacklogSlt extends HttpServlet {
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
			add(request,response);
			break;
		case "delete":
			delete(request,response);
			break;
		case "query":
			query(request,response);
			break;
		case "update":
			update(request,response);
			break;

		}
		out.flush();
		out.close();
	}

	public static void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("bac_content");
		Date date=new Date();
		BacklogService backlogService=new BacklogService();
		
		boolean flag=backlogService.insertBacklog(title,content,0,0,date,"1");
		PrintWriter out=response.getWriter();
		if (flag) {
			out.print("添加成功");
		}else {
			out.print("添加失败");
		}
		
	}

	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		BacklogService backlogService=new BacklogService();
		List<Map<String, Object>> list=new ArrayList<>();
		list=backlogService.getBacklogs("1");
		PrintWriter out=response.getWriter();
		Gson gson=new Gson();
		String bac=gson.toJson(list);
		out.print(bac);
	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}