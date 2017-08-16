package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import util.DataUtil;
import bean.Teacher;
import bean.User;

public class UserDao {
	public boolean addUser(Object...objects) throws Exception{
		boolean isSuccess = false;
		String sql = "insert into user values(?,?,?,?,?,?)";
		isSuccess = DataUtil.update(sql,objects);
		return isSuccess;
	}
	public int countStu() throws SQLException {
		int count=0;
		String sql = "select * from user where user_type='student'";
		List<Map<String, Object>> student;
			student = DataUtil.queryList(sql);
			count=student.size();
		return count;
	}
	
	public int countMajor() throws SQLException {
		int count=0;
		String sql = "select distinct stu_major from student";
		List<Map<String, Object>> major;
			major = DataUtil.queryList(sql);
			count=major.size();
		return count;
	}
	public boolean deleteUser(String userId,String type) throws SQLException {
		boolean isSuccess = false;
		String sql = "delete from user where user_id=? and user_type=?";
			isSuccess = DataUtil.update(sql,userId,type);
		return isSuccess;
	}
	public List<Map<String, Object>> getUsers(int offset, int length) throws SQLException {
		List<Map<String, Object>> users = null;
		String sql = "select * from user limit ?,?";
			users = DataUtil.queryList(sql, offset, length);
		return users;
	}
	
	public int count(String userId) throws SQLException{
		int count=0;
		List<Map<String, Object>> teas = null;
		String sql = "select * from user where user_id like '%"+userId+"%' and user_type='teacher' ";
			teas = DataUtil.queryList(sql);
		count=teas.size();
		return count;
	}
	public String check(String password,String type) throws SQLException {
		String userId = null;
		String sql = "select user_id from user where user_pw=? and user_type=?";
			userId = DataUtil.queryMap(sql, password,type).get("user_id").toString();
		return userId;
	}
	public User login(String userId,String password,String type) throws SQLException {
		User user = null;
		String sql = "select * from user where user_id=? and user_pw=? and user_type=?";
			user = DataUtil.queryForBean(sql, User.class, userId,password,type);
		return user;
	}
	public String getUserName(String userId) throws SQLException {
		String userName = null;
		String sql = "select user_name from user where user_id=?";
			userName = DataUtil.queryMap(sql,userId).get("user_name").toString();
		return userName;
	}
	
}
