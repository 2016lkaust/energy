package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.StudentService;
import service.UserService;
import bean.User;

import com.google.gson.Gson;

@SuppressWarnings("all")
public class StudentSlt extends HttpServlet {
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
		case "update":
			update(request, response);
			break;
		case "studentDes":
			queryDes(request, response);
			break;
		}
		out.flush();
		out.close();
	}

	public static void add(HttpServletRequest request,
			HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userTel = request.getParameter("userTel");
		String userPw = request.getParameter("userPw");
		UserService userService = new UserService();
		boolean success = userService.addUser(userId, userName, userTel,
				"student", userPw, 0);
		try {
			PrintWriter out = response.getWriter();
			out.print(success);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		UserService userService = new UserService();
		StudentService studentService = new StudentService();
		boolean success = userService.deleteUser(userId,"student");
		try {
			PrintWriter out = response.getWriter();
			out.print(success);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 动态组合条件查询
	 * 
	 * @param request
	 * @param response
	 */
	public void query(HttpServletRequest request, HttpServletResponse response) {
		int offset = (Integer.parseInt(request.getParameter("offset")) - 1) * 15;
		response.setContentType("application/json");
		String param = request.getParameter("param");
		String stuMajor = request.getParameter("stuMajor");
		String stuClassno = request.getParameter("stuClassno");
		String stuSex = request.getParameter("stuSex");
		String stuJob = request.getParameter("stuJob");
		// System.out.println(stuSex + stuClassno + stuJob + stuMajor);

		StudentService studentService = new StudentService();

		List<Map<String, Object>> stuList = studentService.getStudents(param,
				stuMajor, stuClassno, stuSex, stuJob, offset, 15);
		Map<String, Object> count = new HashMap<String, Object>();
		int length = studentService.count(param, stuMajor, stuClassno, stuSex,
				stuJob);
		count.put("count", length);
		stuList.add(count);
		try {
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String list = gson.toJson(stuList);
			out.print(list);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void queryDes(HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("application/json");
		String param = request.getParameter("param");

		String userId = request.getParameter("userId");
		String type = request.getParameter("type");
		StudentService studentService = new StudentService();
		List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<>();
		switch (type) {
		case "studentInfo":
			lists = studentService.getInfo(userId, "student");
			break;
		case "studentFamily":
			lists = studentService.getInfo(userId, "family");
			break;
		case "studentActivity":
			lists = studentService.getInfo(userId, "activity");
			break;
		}
		try {
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String list = gson.toJson(lists);
			out.print(list);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("userId");
		System.out.println(id);
	}
}
