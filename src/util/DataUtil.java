package util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import bean.Student;
import bean.User;
import util.StringUtils;

@SuppressWarnings("all")
public class DataUtil {
	public static String username = "root";
	public static String password = "123456";
	public static String url = "jdbc:mysql://localhost:3306/energy";
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static void closeConnection(Connection connection,
			PreparedStatement statement, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		} catch (Exception e) {
			e.fillInStackTrace();
		}
	}

	/**
	 * DML操作
	 * 
	 * @param sql
	 * @param objects
	 * @throws SQLException 
	 */
	public static boolean update(String sql, Object... objects) throws SQLException {
		boolean isSuccess=false;
		Connection connection = getConnection();
		PreparedStatement pStatement = null;
		System.out.println("sql in update: "+sql);
			pStatement = (PreparedStatement) connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				pStatement.setObject(i + 1, objects[i]);
			}
			pStatement.executeUpdate();
			isSuccess=true;
			System.out.println("operation is success");
			closeConnection(connection, pStatement, null);
			return isSuccess;

	}

	/**
	 * list:形如[{password=123456, headerPic=null, id=001}, {password=123456,
	 * headerPic=null,id=002}]
	 * 
	 * map=list.get(index):形如{password=123456, headerPic=null, id=001}
	 * 
	 * id=map.get("id")
	 * 
	 * @param sql
	 * @param objects
	 * @return
	 * @throws SQLException 
	 */
	public static List<Map<String, Object>> queryList(String sql,
			Object... objects) throws SQLException {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection connection = getConnection();
		PreparedStatement pStatement = null;
		ResultSet rs = null;
			pStatement = connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				pStatement.setObject(i + 1, objects[i]);
				/*
				 * 本质 pStatement.set(1,value1); pStatement.set(2,value2);
				 */
			}
			rs = pStatement.executeQuery();
			while (rs.next()) {
				ResultSetMetaData resultSetMetaData = rs.getMetaData();
				// 获取属性总数
				int count = resultSetMetaData.getColumnCount();
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 0; i < count; i++) {
					// 将属性名和属性值作为键和值存入
					map.put(resultSetMetaData.getColumnName(i + 1), rs
							.getObject(resultSetMetaData.getColumnName(i + 1)));
				}
				list.add(map);
			}
			closeConnection(connection, pStatement, rs);
		return list;
	}

	/**
	 * map=list.get(index):形如{password=123456, headerPic=null, id=001}
	 * 
	 * @param sql
	 * @param objects
	 * @return
	 * @throws SQLException 
	 */
	public static Map<String, Object> queryMap(String sql, Object... objects) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = queryList(sql, objects);
		if (list.size() != 1) {
			return null;
		}
		map = list.get(0);
		return map;
	}

	/**
	 * 查询出数据，并且返回一个JavaBean
	 * 
	 * 设计思路：
	 * 
	 * 1.拿到map
	 * 
	 * 2.新建JavaBean。事先不知类型，所以要传进来一个class属性，返回值用泛型
	 * 
	 * 3.遍历map中所有key（属性名），由其生成set方法
	 * 
	 * 4.通过反射来调用set方法
	 * 
	 * 5.返回已经注入好的Javabean
	 * 
	 * @param sql
	 * @param clazz
	 * @param objects
	 * @return
	 * @throws SQLException 
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 */
	public static <T> T queryForBean(String sql, Class clazz, Object... objects) throws SQLException {
		T obj = null;
		Map<String, Object> map = null;
		Field field = null;
		try {
			// 创建一个新的Bean实例
			obj = (T) clazz.newInstance();
		} catch (InstantiationException e2) {
			e2.printStackTrace();
		} catch (IllegalAccessException e2) {
			e2.printStackTrace();
		}
		map = queryMap(sql, objects); // 先将结果集放在一个Map中
		if (map == null) {
			return null;
		}
		
//		Field[] fields=clazz.getDeclaredFields();
//		for (Field field2 : fields) {
//			System.out.println(field2.getName()+" test");
//			
//		}
		
//		System.out.println(map);
		// 遍历Map
		for (String columnName : map.keySet()) {
			Method method = null;
//			System.out.println("columnName " + columnName);
			String propertyName = StringUtils.columnToProperty(columnName); // 属性名称,形如userIdNum
//			System.out.println("propertyName " + propertyName);
			try {
				// field:like "private java.lang.String
				// package_name.class_name.paramter
				// 获取指定名称的属性
				field = clazz.getDeclaredField(propertyName);
			} catch (NoSuchFieldException e1) {
				e1.printStackTrace();
			} catch (SecurityException e1) {
				e1.printStackTrace();
			}
			// 获取JavaBean中的字段
			// fieldType:like "java.lang.String"
//			System.out.println("getname " + field.getName());
			String fieldType = field.toString().split(" ")[1]; // 获取该字段的类型
//			System.out.println("fieldType "+fieldType);
			Object value = map.get(columnName);
			if (value == null) {
				continue;
			}
			/**
			 * 获取set方法的名字 like "setUserIdNum"
			 * 
			 * */

			String setMethodName = "set"
					+ StringUtils.upperCaseFirstCharacter(propertyName);
			// System.out.println(setMethodName);
			try {
				/**
				 * 获取值的类型 like "java.lang.String"
				 * */
				String valueType = value.getClass().getName();
				/** 查看类型是否匹配* */
				if (!fieldType.equalsIgnoreCase(valueType)) {
					// System.out.println("类型不匹配");
					if (fieldType.equalsIgnoreCase("java.lang.Integer")) {
						value = Integer.parseInt(String.valueOf(value));
					} else if (fieldType.equalsIgnoreCase("java.lang.String")) {
						value = String.valueOf(value);
					} else if (fieldType.equalsIgnoreCase("java.util.Date")) {
						valueType = "java.util.Date";
						// 将value转换成java.util.Date
						String dateStr = String.valueOf(value);
						Timestamp ts = Timestamp.valueOf(dateStr);
						Date date = new Date(ts.getTime());
						value = date;
					}
				}

				/** 获取set方法* */
				// System.out.println(valueType);
				method = clazz.getDeclaredMethod(setMethodName,
						Class.forName(fieldType));
				/** 执行set方法* */
				method.invoke(obj, value);
			} catch (Exception e) {
				/** 如果报错，基本上是因为类型不匹配* */
				e.printStackTrace();
			}
		}
		// System.out.println(obj);
		return obj;
	}
public static String Uuid(){
	String id=UUID.randomUUID().toString();
	return id;
}
	public static void main(String[] args) throws SQLException {
		String sql = "insert into user values (?,?,?,?,?,?)";
		String id = "001";
		String name = "卢可";
		String tel = "123456677";
		String type = "student";
		String code = "123456";
		Integer isGraduate = 0;
		// update(sql, id, name, tel, type, code,isGraduate);
		// DateBaseUtils.queryList("select * from t_user");
		// Student user = DataUtil.queryForBean(
		// "select * from student where id='1'", Student.class);
//		User user = DataUtil.queryForBean(
//				"select * from user where user_id='001'", User.class);
//		System.out.println(user.getUserName());
//System.out.println(DataUtil.queryMap("select * from activity where user_id=?", "1"));

	}
}
