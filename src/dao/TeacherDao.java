package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import bean.Teacher;

import util.DataUtil;

public class TeacherDao {
	public boolean delete(String tid) throws SQLException {
		boolean isSuccess = false;
		String sql = "delete from teacher where tid=?";
		isSuccess = DataUtil.update(sql, tid);
		return isSuccess;
	}

	public List<Map<String, Object>> getTeas(int offset, int length)
			throws SQLException {
		List<Map<String, Object>> teas = null;
		String sql = "select * from user where user_type='teacher' limit ?,?";
		teas = DataUtil.queryList(sql, offset, length);
		return teas;
	}

	public int countTea() throws SQLException {
		int count = 0;
		String sql = "select * from user where user_type='teacher'";
		List<Map<String, Object>> student;
		student = DataUtil.queryList(sql);
		count = student.size();
		return count;
	}

	public Teacher desTea(String tid) throws SQLException {
		String sql = "select * from teacher where tid=?";
		Teacher teacher = DataUtil.queryForBean(sql, Teacher.class, tid);
		return teacher;
	}

	public boolean update(Teacher teacher) throws SQLException {
		String sql = "update teacher set age=?, sex=?, email=?, title=?, university=?, achievement=?, course=? where tid=?";
		Object[] objects = { teacher.getAge(), teacher.getSex(),
				teacher.getEmail(), teacher.getTitle(),
				teacher.getUniversity(), teacher.getAchievement(),
				teacher.getCourse(), teacher.getTid() };
		return DataUtil.update(sql, objects);
	}
}
