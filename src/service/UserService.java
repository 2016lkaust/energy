package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.UserDao;

import util.DataUtil;
import bean.Teacher;
import bean.User;

/**
 * 
 * @author LOOK
 * 
 */
public class UserService {
	private UserDao userDao = new UserDao();

	public User login(String userId, String password, String type) {
		try {
			return userDao.login(userId, password, type);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int countStu() {
		try {
			return userDao.countStu();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int countMajor() {
		try {
			return userDao.countMajor();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public boolean deleteUser(String userId, String string) {
		return false;
	}

	public boolean addUser(String userId, String userName, String userTel,
			String string, String userPw, int i) {
		return false;
	}


}
