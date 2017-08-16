package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import service.BacklogService;
import service.InformService;
import service.TeacherService;
import service.UserService;
import util.BaseServlet;
import util.Traverse;
import bean.Teacher;
import bean.User;

import com.google.gson.Gson;

@SuppressWarnings("all")
public class UserSlt extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	BacklogService backlogService = new BacklogService();
	InformService informService = new InformService();
	TeacherService teaService = new TeacherService();

	public String login(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		User user = userService.login(userId, password, type);
		int stuCount = userService.countStu();
		int teaCount = teaService.countTea();
		int majorCount = userService.countMajor();
		if (user != null) {
			List<Map<String, Object>> backList = backlogService
					.getPartBacklogs(userId);
			List<Map<String, Object>> informList = informService.getInforms(0,
					8);
			request.setAttribute("userId", userId);
			request.setAttribute("user", user);
			request.setAttribute("backList", backList);
			request.setAttribute("informList", informList);
			request.setAttribute("stuCount", stuCount);
			request.setAttribute("teaCount", teaCount);
			request.setAttribute("majorCount", majorCount);
			return "/jsps/iframe.jsp";
		} else {
			request.setAttribute("error", "用户名或密码错误");
			return "index.jsp";
		}
	}

	public String listTeas(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println(teaService.listTeas());
		req.setAttribute("teachers", teaService.listTeas());
		return "/jsps/teacher/listTeas.jsp";
	}

	public String addTeas(HttpServletRequest req, HttpServletResponse resp) {
		return "/jsps/teacher/listTeas.jsp";
	}

	public String deleteTeas(HttpServletRequest req, HttpServletResponse resp) {
		String tid = req.getParameter("tid");
		boolean success = teaService.deleteTea(tid);
		if (success) {
			req.setAttribute("teachers", teaService.listTeas());
			return "/jsps/teacher/listTeas.jsp";
		}
		return "/jsps/error.jsp";
	}

	public String updateTea(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println(req.getParameterMap());
		Teacher teacher=new Teacher();
		try {
			BeanUtils.populate(teacher, req.getParameterMap());
			teaService.updateTea(teacher);
			req.setAttribute("teacher", teaService.desTea(teacher.getTid()));
//			Traverse.traverse(teacher);
			System.out.println(teacher);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace(); 
		}
		return "/jsps/teacher/desTea.jsp";
	}

	public String desTea(HttpServletRequest req, HttpServletResponse resp) {
		String tid = req.getParameter("tid");
		Teacher teacher = teaService.desTea(tid);
		req.setAttribute("teacher", teacher);
		String edit = req.getParameter("edit");
		if ("edit".equals(edit)) {
			return "/jsps/teacher/updateTea.jsp";
		}
		System.out.println(teacher);
		return "/jsps/teacher/desTea.jsp";
	}
}
