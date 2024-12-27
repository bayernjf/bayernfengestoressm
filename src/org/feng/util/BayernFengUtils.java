/**
 * 
 */
package org.feng.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;
import java.util.UUID;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.alibaba.fastjson.JSONObject;
import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * @author 姜峰
 *
 */
public class BayernFengUtils {

	private static final String URL = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "123456";
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	
	private static String URL2 = "";
	private static String USER2 = "";
	private static String PASSWORD2 = "";
	private static String DRIVER2 = "";
	
	private static DataSource dataSourceByC3P0;
	private static DataSource dataSourceByDBCP;
	
	static {
		Properties pro = new Properties();
		try {
			pro.load(BayernFengUtils.class.getClassLoader().getResourceAsStream("db.properties"));
			URL2 = pro.getProperty("url");
			USER2 = pro.getProperty("user");
			PASSWORD2 = pro.getProperty("pass");
			DRIVER2 = pro.getProperty("driver");
//			System.out.println("URL2 : " + URL2);
//			System.out.println("USER2 : " + USER2);
//			System.out.println("PASSWORD2 : " + PASSWORD2);
//			System.out.println("DRIVER2 : " + DRIVER2);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	static {
		dataSourceByC3P0 = new ComboPooledDataSource();
	}
	
	static {
		try {
//			BayernFengUtils.class.getClassLoader();
//			InputStream is = ClassLoader.getSystemResourceAsStream("dbcp.properties");
			
			InputStream is = BayernFengUtils.class.getClassLoader()
					.getResourceAsStream("dbcp.properties");
			Properties pro = new Properties();
			pro.load(is);
			dataSourceByDBCP = BasicDataSourceFactory.createDataSource(pro);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		try {
			Class.forName(DRIVER2);
			return DriverManager.getConnection(URL2, USER2, PASSWORD2);
//			Class.forName(DRIVER);
//			return DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static DataSource getDataSourceByC3P0() {
		try {
			return dataSourceByC3P0;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static Connection getConnectionByC3P0() {
		try {
			return dataSourceByC3P0.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static DataSource getDataSourceByDBCP() {
		try {
			return dataSourceByDBCP;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static Connection getConnectionByDBCP() {
		try {
			return dataSourceByDBCP.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String input(String msg) {
		Scanner sc = new Scanner(System.in);
		int count = 0;
//		String validateMsg = "";
		String result = "";
		while (result.trim() == "" || result.trim() == null) {
			System.out.println(msg + "（输入内容不能为空）");
			result = sc.next();
			count++;
//			System.out.println(count == 1 ? "" : "输入不能为空！请重新输入~");
//			if (count > 0)
//				System.out.println("输入不能为空！请重新输入~");
		}
		return result;
	}
	
	// 验证码
	public static void generateVerificationCode(BufferedImage image, HttpServletRequest request, HttpServletResponse response) {
		Graphics pen = image.getGraphics();
		
		pen.setColor(Color.WHITE);
		pen.fillRect(0, 0, image.getWidth(), image.getHeight());
		
		pen.setColor(Color.BLUE);
		pen.drawRect(0, 0, image.getWidth() - 1, image.getHeight() - 1);
		
		// 随机字母
		String data = "ABCDEFGHIJKLMNOPQISTUVWXYZ0123456789" + "ABCDEFGHIJKLMNOPQISTUVWXYZ".toLowerCase();
		Random ran = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 4; i++) {
			sb.append(data.charAt(ran.nextInt(data.length())));
		}
		String code = sb.toString();
		for (int i = 0; i < 4; i++) {
			// 0~255
			pen.setColor(new Color(ran.nextInt(255), ran.nextInt(255), ran.nextInt(255)));
			pen.setFont(new Font("黑体", Font.ITALIC, 25));
			pen.drawString(code.charAt(i) + "", 10 + 20 * i, 25);
		}
		for (int i = 0; i < 10; i++) {
			pen.drawLine(ran.nextInt(image.getWidth()), ran.nextInt(image.getHeight()), ran.nextInt(image.getWidth()), ran.nextInt(image.getHeight()));
		}
		
		try {
			ImageIO.write(image, "jpg", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("VerificationCode---verificationCode -> " + code);
		request.setAttribute("requestVerificationCode", code);
		request.getSession().setAttribute("verificationCode", code);
	}

	/**
	 * 
	 */
	public static void saveIntoCookie(Map<String, String> map, int age, String path, HttpServletResponse response) {
		for (String key : map.keySet()) {
			Cookie cookie = new Cookie(key, map.get(key));
			cookie.setMaxAge(age);
			cookie.setPath(path);
			response.addCookie(cookie);
		}
	}
	
	public static String getFormattedDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return sdf.format(date);
	}
	
	/**
	 * @param logintime
	 * @return
	 */
	public static Timestamp getTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
	
	/**
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return an array contains two values that can be used for select * from tableName limit ?, ?
	 */
	public static Integer[] twoValuesForMySQLLimit(Integer pageNo, Integer pageSize) {
		/*
		 * select * from tb_user limit ?, ? 
		 * pstm.setInt(1, (pageNo - 1) * pageSize);
			pstm.setInt(2, pageSize);
		 */
		Integer[] result = new Integer[2];
		result[0] = (pageNo - 1) * pageSize;
		result[1] = pageSize;
		return result;
	}
	
	/**
	 * @return PageModel
	 */
	public static PageModel getPageModelInstance() {
		PageModel result = new PageModel() {
			
			private Integer pageNo;
			private Integer pageSize;
			private Integer count;
			private Integer totalPages;
			
			@Override
			public void setTotalPages(Integer totalPages) {
				this.totalPages = totalPages;
			}
			
			@Override
			public void setPageSize(Integer pageSize) {
				this.pageSize = pageSize;
			}
			
			@Override
			public void setPageNo(Integer pageNo) {
				this.pageNo = pageNo;
			}
			
			@Override
			public void setCount(Integer count) {
				this.count = count;
			}
			
			@Override
			public Integer getTotalPages() {
				return this.count % this.pageSize == 0 ? this.count / this.pageSize : this.count / this.pageSize + 1;
			}
			
			@Override
			public Integer getPageSize() {
				return this.pageSize;
			}
			
			@Override
			public Integer getPageNo() {
				return this.pageNo;
			}
			
			@Override
			public Integer getCount() {
				return this.count;
			}
			
			@Override
			public int hashCode() {
				final int prime = 31;
				int result = 1;
				result = prime * result + ((count == null) ? 0 : count.hashCode());
				result = prime * result + ((pageNo == null) ? 0 : pageNo.hashCode());
				result = prime * result + ((pageSize == null) ? 0 : pageSize.hashCode());
				result = prime * result + ((totalPages == null) ? 0 : totalPages.hashCode());
				return result;
			}

			@Override
			public boolean equals(Object obj) {
				if (this == obj)
					return true;
				if (obj == null)
					return false;
				if (getClass() != obj.getClass())
					return false;
				PageModel other = (PageModel) obj;
				if (count == null) {
					if (other.getCount() != null)
						return false;
				} else if (!count.equals(other.getCount()))
					return false;
				if (pageNo == null) {
					if (other.getPageNo() != null)
						return false;
				} else if (!pageNo.equals(other.getPageNo()))
					return false;
				if (pageSize == null) {
					if (other.getPageSize() != null)
						return false;
				} else if (!pageSize.equals(other.getPageSize()))
					return false;
				if (totalPages == null) {
					if (other.getTotalPages() != null)
						return false;
				} else if (!totalPages.equals(other.getTotalPages()))
					return false;
				return true;
			}

			@Override
			public String toString() {
				return "PageModel [pageNo=" + pageNo + ", pageSize=" + pageSize + ", count=" + count + ", totalPages="
						+ totalPages + "]";
			}
		};
		return result;
	}
	
	/**
	 * @param clazz
	 * @return Integer
	 */
	/*public static Integer getBeanCountOfTableOf(Class<?> clazz) {
		String tableName = "bayernfeng_" + clazz.getSimpleName().toLowerCase();
		System.out.println("tableName : " + tableName);
		String sql = "select count(*) from " + tableName;
		System.out.println("sql -> " + sql);
		QueryRunner qr = new QueryRunner(BayernFengUtils.getDataSourceByC3P0());
		Integer result = 0;
		try {
			result = qr.query(sql, new ResultSetHandler<Integer>() {

				@Override
				public Integer handle(ResultSet arg0) throws SQLException {
					// TODO Auto-generated method stub
//					return arg0.getInt(1);
					return arg0.getInt("count(*)");
//					System.out.println("arg0 -> " + arg0);
//					System.out.println("arg0.next() -> " + arg0.next());
//					return null;
				}
			});
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return result;
		}
		
	}*/
	public static Integer getBeanCountOfTableOf(Class<?> clazz) {
		String tableName = clazz.getSimpleName().toLowerCase();
//		System.out.println("tableName : " + tableName);
		String sql = "select id from " + tableName;
//		System.out.println("sql -> " + sql);
		QueryRunner qr = new QueryRunner(BayernFengUtils.getDataSourceByC3P0());
		Integer result = 0;
		try {
//			List ids = (List) qr.query(sql, new BeanListHandler(clazz));
//			List ids = qr.query(sql, new BeanListHandler<>(clazz));
			List<?> ids = qr.query(sql, new BeanListHandler<>(clazz));
			return ids.size();
		} catch (SQLException e) {
			e.printStackTrace();
			return result;
		}
	}
	
	public static Integer getBeanCountOfTableOfByParam(Class<?> clazz, String argName, Object... args) {
		String tableName = clazz.getSimpleName().toLowerCase();
//		System.out.println("tableName : " + tableName);
		//===============
		String sql = "";
		if (argName.equals("category_id")) {
			sql = "select id from " + tableName + " where category_id = ?";
		}
		if (argName.equals("category_ids")) {
//			sql = "select id from " + tableName + " where category_id = ?";
		}
		if (argName.equals("keyWords")) {
			String likekey = "%"+args+"%";
			sql = "select id from " + tableName + " where name like ? or description like ?";
//			System.out.println("sql -> " + sql);
			QueryRunner qr = new QueryRunner(BayernFengUtils.getDataSourceByC3P0());
			Integer result = 0;
			try {
				List<?> ids = qr.query(sql, new BeanListHandler<>(clazz), likekey, likekey);
				return ids.size();
			} catch (SQLException e) {
				e.printStackTrace();
				return result;
			}
		}
//		System.out.println("sql -> " + sql);
		QueryRunner qr = new QueryRunner(BayernFengUtils.getDataSourceByC3P0());
		Integer result = 0;
		try {
//			List ids = (List) qr.query(sql, new BeanListHandler(clazz));
//			List ids = qr.query(sql, new BeanListHandler<>(clazz));
			List<?> ids = qr.query(sql, new BeanListHandler<>(clazz), args);
			return ids.size();
		} catch (SQLException e) {
			e.printStackTrace();
			return result;
		}
	}
	
	/**
	 * 
	 * @param msgs
	 */
	public static void println(Object obj) {
//		String name = "feng";
//		System.out.println("name -> " + name);
		// 利用反射？-------前提是类的field！
		// 没有类似C#的nameof，
		// variable也没有名字，在编译器里只是个序号。。。。。。。。。。
		// 所以此方法失败
		Class<?> clazz = obj.getClass();
		
		String nameOfValue = clazz.getTypeName();
		System.out.println(nameOfValue + " -> " + obj);
	}
	
	/**
	 * @param clazz
	 * @param pageNo
	 * @param pageSize
	 * @return mapOfPageInfo<br>
	 * 	map of four values of this pagemodel's information which are count, pageNo, pageSize, showPageNum<br>
	 *  and the last one is the list of pageNos should be shown on the bottom of the table
	 */
	public static Map<String, Object> setPageModel(PageModel pm, Class<?> clazz, Integer pageNo, Integer pageSize, Integer showPageNum) {
//		pm.setCount(BayernFengUtils.getBeanCountOfTableOf(clazz));
		pm.setPageNo(pageNo);
		pm.setPageSize(pageSize);
		Integer totalPages = pm.getTotalPages();
//		System.out.println("totalPages -> " + totalPages);
		Map<String, Object> map = new HashMap<>();
		
		map.put("count", pm.getCount());
		map.put("pageNo", pm.getPageNo());
		map.put("pageSize", pageSize);
		map.put("totalPages", totalPages);
		map.put("showPageNum", showPageNum);
		// 需要显示的页码	上一页 第一页 第二页 。。。下一页
		// 根据当前页码，返回一个所需要显示的效果，有不同的情况
		List<Integer> listOfPageNo = BayernFengUtils.getListOfPageNo(pageNo, showPageNum, totalPages);
//		System.out.println("listOfPageNo -> " + listOfPageNo);
		map.put("listOfPageNo", listOfPageNo);
		return map;
	}

	/**
	 * @param pageNo
	 * @param showNums the max size of returned list if size of list is greater than showNums
	 * @param totalPages
	 * @return return a list of pageNos by given pageNo
	 */
	public static List<Integer> getListOfPageNo(Integer pageNo, Integer showNums, Integer totalPages) {
		// pageNo前pop 3个数，后pop 2个数，此时一共六个。
		int before = showNums / 2;
		int after = 0;
		if (showNums % 2 == 0) {
			after = before - 1;
		} else {
			after = before;
		}
		List<Integer> list = new ArrayList<>();
		if (showNums > totalPages) {
			for (int i = 1; i <= totalPages; i++) {
				list.add(i);
			}
//			System.out.println("1111111111111111111111111");
			// 当前页数满足如下条件，list存的数据：从左往右，最左边是第一页，一共显示showNums个。
		} else if (pageNo <= before + 1) {
			for (int i = 1; i <= showNums; i++) {
				list.add(i);
			}
//			System.out.println("22222222222222222222222222222");
			// 当前页数满足如下条件，list存的数据：从右往左，最右边是最大页数，一共显示showNums个。
		} else if (pageNo > totalPages - after) {
			for (int i = totalPages - showNums + 1; i <= totalPages; i++) {
				list.add(i);
			}
//			System.out.println("3333333333333333333333333333333");
			// 否则，在pageNo->当前页数前面列出before个页数，在后面列出after个页数
		} else {
			// 在pageNo前面添加before个页数
			for (int i = pageNo - before; i <= pageNo; i++) {
				list.add(i);
			}
			// 在pageNo后面添加after个页数
			for (int j = pageNo + 1; j <= pageNo + after; j++) {
				list.add(j);
			}
//			System.out.println("4444444444444444444444444444");
		}
		
		return list;
	}
	
	/*public static void updateCertainTimeOfBean(Class<?> clazz, String whichColunm, Map<String, String> mapOfParams) {
		String tableName = "bayernfeng_" + clazz.getSimpleName().toLowerCase();
		System.out.println("tableName : " + tableName);
		Timestamp time = BayernFengUtils.getTimestamp(new Date());
		Set<String> keys = mapOfParams.keySet();
		String[] colunmNames = new String[keys.size()];
		String[] colunmValues = new String[keys.size()];
		int index = 0;
		for (String key : keys) {
			colunmNames[index] = key;
			colunmValues[index] = mapOfParams.get(key);
			index++;
		}
		StringBuilder sb = new StringBuilder();
		sb.append("update " + tableName + " set " + whichColunm + " = " + time);
		if (colunmNames.length == 1) {
			sb.append(" where "+colunmNames[0]+" = ? ");
			String sql = sb.toString();
			System.out.println("sql -> " + sql);
			QueryRunner qr = new QueryRunner(BayernFengUtils.getDataSourceByC3P0());
			try {
				qr.update(sql, colunmValues[0]);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {			
			sb.append(" where "+colunmNames[0]+" = ? ");
			for (int i = 1; i < colunmValues.length; i++) {
				sb.append(" and "+colunmNames[i]+" = ? ");
			}
			String sql = sb.toString();
			System.out.println("sql -> " + sql);
			QueryRunner qr = new QueryRunner(BayernFengUtils.getDataSourceByC3P0());
			try {
				qr.update(sql, Arrays.asList(colunmValues));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}*/
	public static java.sql.Date updateCertainTimeOfBean(Class<?> clazz, String whichColunm, Integer id) {
		String tableName = "bayernfeng_" + clazz.getSimpleName().toLowerCase();
//		System.out.println("tableName : " + tableName);
		Timestamp time = BayernFengUtils.getTimestamp(new Date());
		String sql = "update " + tableName + " set " + whichColunm + " = ? where id = ?";
//		System.out.println("sql -> " + sql);
		QueryRunner qr = new QueryRunner(BayernFengUtils.getDataSourceByC3P0());
		try {
			qr.update(sql, time, id);
			String seleSql = "select " + whichColunm + " from " + tableName + " where id = ?";
			java.sql.Date date = qr.query(seleSql, new ResultSetHandler<java.sql.Date>() {

				@Override
				public java.sql.Date handle(ResultSet rs) throws SQLException {
					if (rs.next()) {
						return rs.getDate(whichColunm);
					}
					return null;
				}
			}, id);
			return date;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void test(Object arg) {
		if (arg.equals("feng")) {
			System.out.println("true");
		} else {
			System.out.println("false");
		}
	}
	
	/**
	 * @param clazz
	 * @param keyWords
	 * @return
	 */
	public static Integer getBeanCountOfTableOfByFuzzySearch(Class<?> clazz, String keyWords) {
		String tableName = clazz.getSimpleName().toLowerCase();
		String likekey = "%"+keyWords+"%";
		Connection conn = BayernFengUtils.getConnectionByC3P0();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select id from " + tableName + " where name like ? or description like ?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, likekey);
			pstm.setString(2, likekey);
			rs = pstm.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			}
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			BayernFengUtils.close(conn, pstm, rs);
		}
		
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param file
	 * @return 返回一个文件的相对位置如 -> images/tx.jpg
	 */
	public static String uploadFile(HttpServletRequest request, HttpServletResponse response) {
		Part part = null;
		InputStream is = null;
		FileOutputStream fos = null;
		try {
			part = request.getPart("userPhoto");
			String pathname = "images/feng.jpg";
			
			is = part.getInputStream();
			fos = new FileOutputStream(new File(pathname));
			byte[] buffer = new byte[1024];
			int hasRead = -1;
			while ((hasRead = is.read(buffer)) != -1) {
				fos.write(buffer, 0, hasRead);
			}
			
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			return "images/tx.jpg";
		} finally {
			try {
				if (fos != null)
					fos.close();
				if (is != null)
					is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	public static String uploadFile(HttpServletRequest request, String partName) {
		Part part = null;
		InputStream is = null;
		FileOutputStream fos2 = null;
		try {
			part = request.getPart(partName);
			is = part.getInputStream();
			String contentdisposition = part.getHeader("content-disposition");
			StringBuilder sb = new StringBuilder(UUID.randomUUID().toString());
			sb.setLength(10);
			String[] strs = contentdisposition.split("\"");
			String photoName = sb.toString() + strs[3];
			String photoPath = "photosOfUsers" + File.separator + photoName;
			
			/*String savePath = "D:\\ALiShanMyCodes\\eclipse-workspace\\bayernfeng\\WebContent" + File.separator + photoPath;
	//		System.out.println("savePath -> " + savePath);
			FileOutputStream fos = new FileOutputStream(new File(savePath));
			byte[] buffer = new byte[1024];
			int hasRead = -1;
			while ((hasRead = is.read(buffer)) != -1) {
				fos.write(buffer, 0, hasRead);
			}
			fos.close();*/
			
			
			// 以上把文件复制到web项目中了，但是没有在服务器（tomcat）部署的路径中，
			// 但是在项目运行时，相对路径是相对部署的路径中的。
			
			// 再多此一举的复制一下吧......但是只能在此项目中使用。。。。解决方法。。。。暂且不解决。
			// 此时并不可以。。。。。想多此一举的机会也没了。。。
			// 上面的输出流运行，影响下面面这个输出流的执行
//			String runtimePath = "C:\\apache-tomcat-9.0.31-windows-x64\\apache-tomcat-7.0.63\\webapps\\bayernfeng" + File.separator + photoPath;
			
			// 根据在tomcat设置的modules的路径进行
			String runtimePath = "C:\\Users\\24670\\Pictures" + File.separator + photoPath;
			System.out.println("runtimePath -> " + runtimePath);
			fos2 = new FileOutputStream(new File(runtimePath));
			byte[] buffer2 = new byte[1024];
			int hasRead2 = -1;
			while ((hasRead2 = is.read(buffer2)) != -1) {
				fos2.write(buffer2, 0, hasRead2);
			}
			return photoPath.replace("\\", "/");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (fos2 != null)
					fos2.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void showMessageIfWrong(HttpServletRequest request, HttpServletResponse response, String message, String nextpage) {
		request.setAttribute("message", message);
		request.setAttribute("nextpage", nextpage);
		try {
			request.getRequestDispatcher("message.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param givenStr
	 * @param splitstr
	 * @param String... conditions
	 * @return a string is not contained with given multiple conditions
	 * 			<br> and without duplicate character
	 */
	public static String[] getFromSplitedStringExcept(String givenStr, String splitstr, String... conditions) {
		Set<String> set = new HashSet<>();
		// 根据条件把字符串分割成字符串数组
		String[] strs = givenStr.split(splitstr);
//		System.out.println("conditions -> " + Arrays.toString(conditions));
		// 遍历每一个字符串数组里的元素，
		for (String str : strs) {
			boolean flag = true;
			// 把一个字符串和给定的所有的条件做比较
			inner:
			for (int i = 0; i < conditions.length; i++) {
				// 一旦相等，则把标记设为false，并且跳出此次循环
				if (str.equals(conditions[i])) {
					flag = false;
					break inner;
				}
			}
			// 在比较之前，flag为true，在比较的时候，字符串一旦和给定条件相等，则不满足需求
			// 把flag赋予false，并跳出循环，---》没必要接着往下比较。
			// ∴flag为true，代表遍历的字符串元素和给定的条件都不相等，则满足需求，
			if (flag) {
				set.add(str);
			}
		}
		
		String[] result = new String[set.size()];
		int index = 0;
		for (String str : set) {
			result[index++] = str;
		}
		
		return result;
	}
	
	/**
	 * @param givenJSONString
	 * @return a string array ids
	 */
	public static String[] makeArrayWithGivenJSONStringForIds(String givenJSONString) {
		return BayernFengUtils.getFromSplitedStringExcept(givenJSONString, "\"", "{", "}", ",", ":");
	}
	
	public static String uploadFileWithThirdParty(HttpServletRequest request) {
		DiskFileItemFactory dfifactory = new DiskFileItemFactory();
		ServletFileUpload sfupload = new ServletFileUpload(dfifactory);
		String filename = "";
		try {
			List<FileItem> fileItems = sfupload.parseRequest(request);
//			System.out.println("request : " + request);
			// fileItems1111111111111111111 []
			System.out.println("fileItems1111111111111111111 " + fileItems);
			for (FileItem fileItem : fileItems) {
				if (fileItem.isFormField()) {
					String fieldName = fileItem.getFieldName();
					String fieldValue = fileItem.getString();
					System.out.println(fieldName + " -> " + fieldValue);
				} else {
					String fileName = fileItem.getName();
					StringBuilder sb = new StringBuilder(UUID.randomUUID().toString());
					sb.setLength(10);
					filename = sb.toString() + fileName;
					System.out.println("filename : " + filename);
					String realPath = "C:\\Users\\24670\\Pictures\\photosOfUsers";
//					File file = new File(realPath, fileName);
					File file = new File(realPath, filename);
					try {
						fileItem.write(file);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
//			return "photosOfUsers" + File.separator + filename;
			return "photosOfUsers/" + filename;
		} catch (FileUploadException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 
	 * @param jobj
	 * @param code
	 * json对象put的key是code
	 */
	public static void jsonPutCode(JSONObject jobj, Object code) {
		jobj.put("code", code);
	}
	
	/**
	 * 
	 * @param jobj
	 * @param obj 
	 * json对象put的key是msg
	 */
	public static void jsonPutMsg(JSONObject jobj, Object obj) {
		jobj.put("msg", obj);
	}

	/**
	 * @param phone
	 * @return sendCode
	 */
	public static String getVerificationCode(String phone) {
		// 进行网易云手机验证码的调用
		String sendCode = "";
		try {
			sendCode = SendCode.getCode(phone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * sendCode：
		 * {"code":200,"msg":"2","obj":"1344"}
		 */
		String code = sendCode.split("\"")[9];
		System.out.println("手机验证码========================================================");
		System.out.println("sendCode -> " + sendCode);
		System.out.println("手机验证码code -> " + code);
		System.out.println("手机验证码========================================================");
		return code;
	}

	/**
	 * @param username
	 * @return
	 */
	public static String getTypeOfLogin(String account) {
		Pattern phoneP = Pattern.compile("^1[3|4|5|7|8][0-9]{9}$");
		Matcher phoneM = phoneP.matcher(account);
		boolean isPhone = phoneM.matches();
		
		Pattern emailP = Pattern.compile("^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$");
		Matcher emailM = emailP.matcher(account);
		boolean isEmail = emailM.matches();
		
		String type = null;
		if (isEmail) {
			type = "email";
		} else if (isPhone) {
			type = "phone";
		}
		return type;
	}
	
	public static Boolean isPositiveInteger(String str) {
		Pattern p = Pattern.compile("^[1-9]\\d*$");
		Matcher m = p.matcher(str);
		return m.matches();
	}

	/**
	 * @param goods
	 * @param string
	 * @return
	 */
	public static List<Object> getValuesOfJSONObjectByKey(String jsonStr, String key) {
		JSONObject jobj = JSONObject.parseObject(jsonStr);
		Map<String, Object> map = new HashMap<>();
		for (Entry<String, Object> entry : jobj.entrySet()) {
			map.put(entry.getKey(), entry.getValue());
		}
		Collection<Object> coll = map.values();
		List<Object> result = new ArrayList<>();
		for (Object obj : coll) {
			JSONObject jobj2 = JSONObject.parseObject(obj.toString());
			Map<String, Object> map2 = new HashMap<>();
			for (Entry<String, Object> entry : jobj2.entrySet()) {
				map2.put(entry.getKey(), entry.getValue());
			}
			result.add(map2.get(key));
		}
		return result;
	}

	/**
	 * @param i
	 * @return
	 */
	public static String getStatNameByStat(Integer stat) {
		String statName = "";
		switch (stat) {
		case 1:
			statName = "待支付订单";
			break;
		case 2:
			statName = "已支付订单";
			break;
		case 3:
			statName = "已发货订单";
			break;
		case 4:
			statName = "已完成订单";
			break;
		case 5:
			statName = "已取消订单";
			break;

		default:
			break;
		}
		return statName;
	}
	
}
