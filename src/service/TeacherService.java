package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.TeacherDao;
import dao.UserDao;

import bean.Teacher;

public class TeacherService {
	UserDao userDao = new UserDao();
	TeacherDao teaDao = new TeacherDao();

	public List<Map<String, Object>> listTeas() {
		try {
			return teaDao.getTeas(0, 10);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int countTea() {
		try {
			return teaDao.countTea();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Teacher desTea(String tid) {

		try {
			return teaDao.desTea(tid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean deleteTea(String tid) {
		boolean success = false;
		try {
			success = userDao.deleteUser(tid, "teacher");
			success = teaDao.delete(tid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}

	public boolean updateTea(Teacher teacher) {
		try {
			return teaDao.update(teacher);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
