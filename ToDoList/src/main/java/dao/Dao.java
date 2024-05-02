package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import dto.Task;
import dto.User;

public class Dao {
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todolist","root","root");
		return con;
	}
	
	public  int saveUser(User user) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("insert into user values(?,?,?,?,?,?)");
		pst.setInt(1, user.getUserid());
		pst.setString(2, user.getUsername());
		pst.setString(3, user.getUseremail());
		pst.setLong(4, user.getUsercontact());
		pst.setString(5, user.getUserpassword());
		
		Blob imageBlob = new SerialBlob(user.getUserimage());
		pst.setBlob(6, imageBlob);
		int res = pst.executeUpdate();
		return res;
			
	}
	
	public User findByEmail(String email) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from user where useremail = ?");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		if(rs.next()) {
			User u = new User();
			u.setUserid(rs.getInt(1));
			u.setUsername(rs.getString(2));
			u.setUseremail(rs.getString(3));
			u.setUsercontact(rs.getLong(4));
			u.setUserpassword(rs.getString(5));
			// convert blob image to byte[]
			Blob imageBlob = rs.getBlob(6);
			byte[] image = imageBlob.getBytes(1, (int)imageBlob.length());
			
			u.setUserimage(image);
			
			return u;
			
			
		}else {
			return null;
		}
		
	}
	
	public int createtask(Task task) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("insert into task values(?,?,?,?,?,?,?)");
		pst.setInt(1, task.getTaskid());
		pst.setString(2,task.getTasktitle());
		pst.setString(3, task.getTaskdescription());
		pst.setString(4,task.getTaskpriority());
		pst.setString(5,task.getTaskduedate());
		pst.setString(6,task.getTaskstatus());
		pst.setInt(7, task.getUserid());
		
		int res = pst.executeUpdate();
		return res;
		
	}
	
	public List<Task> getalltasksByUserId(int userid) throws SQLException, ClassNotFoundException{
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from task where userid = ?");
		pst.setInt(1, userid);
		ResultSet rs = pst.executeQuery();
		List<Task> tasks = new ArrayList<Task>();
		while(rs.next()) {
			Task task = new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			tasks.add(task);
		}
		return tasks;
		
	}
	
	
	public int deleteTaskById(int taskid) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("delete from task where taskid = ? ");
		pst.setInt(1, taskid);
		int res = pst.executeUpdate();
		return res;
	}
	
	public int getTaskId() throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("SELECT max(taskid) from task");
		ResultSet rs = pst.executeQuery();
		if(rs.next()) {
			int id = rs.getInt(1);
			return id+1;
		}
		else {
			return 1;
		}
	}

	
	public int getUserId() throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("SELECT max(userid) from user");
		ResultSet rs = pst.executeQuery();
		if(rs.next()) {
			int id = rs.getInt(1);
			return id+1;
		}
		else {
			return 1;
		}
	}

	public Task findtaskById(int taskid) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("SELECT * from task where taskid = ?");
		pst.setInt(1, taskid);
		ResultSet rs = pst.executeQuery();
		rs.next();
		Task task = new Task(taskid, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
		return task;
		
	}
	
	public void updateTask(Task task) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("update task set tasktitle=? ,taskdescription=? , taskpriority=?, taskduedate=?, taskstatus=?, userid=? where taskid =? ");
		
		pst.setString(1,task.getTasktitle());
		pst.setString(2, task.getTaskdescription());
		pst.setString(3,task.getTaskpriority());
		pst.setString(4,task.getTaskduedate());
		pst.setString(5,task.getTaskstatus());
		pst.setInt(6, task.getUserid());
		
		pst.executeUpdate();
		
	}
	
	public void updatePriorityBasedOnDuration() throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		Statement st = con.createStatement();
		st.execute("UPDATE task SET taskpriority = 'high' WHERE taskduedate BETWEEN CURDATE() AND CURDATE() +  INTERVAL 3 DAY");
		st.execute("UPDATE task SET taskpriority = 'medium' WHERE taskduedate BETWEEN CURDATE() + INTERVAL 4 DAY AND CURDATE() + INTERVAL 7 DAY");
		st.execute("UPDATE task SET taskpriority = 'low' WHERE taskduedate > CURDATE() + INTERVAL 7 DAY");
	}
	
	public int updateUserPassword(User u) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("update user set userpassword = ? where userid = ?");
		pst.setString(1, u.getUserpassword());
		pst.setInt(2,u.getUserid());
		
		return pst.executeUpdate();
	}
	
	
}