package com.epikat.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import com.epikat.bean.Comment;
import com.epikat.bean.Student;
import com.epikat.student_management.StudentManagement;
import com.epikat.util.DBConnection;

public class StudentDAO {

	
	
	public static List<Student> getAllStudents() {
		List<Student> students = new ArrayList<>();
		Connection con=null;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="select name,rno,marksPhysics,marksChemistry,marksMaths,picUrl from student;";
			ResultSet rs=st.executeQuery(sql);
			Student stud=null;
			while(rs.next()) {
				stud=new Student();
				stud.setName(rs.getString("name"));
				stud.setRno(rs.getString("rno"));
				stud.setMarksPhysics(rs.getInt("marksPhysics"));
				stud.setMarksChemistry(rs.getInt("marksChemistry"));
				stud.setMarksMaths(rs.getInt("marksMaths"));
				stud.setPicUrl(rs.getString("picUrl"));
				students.add(stud);
				stud=null;
			}
			if(rs!=null)rs=null;
			if(st!=null)st.close();
		}catch(Exception e) {
			System.out.println("getAllStudents :: Exception :: "+e);
		}finally {
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return students;
	}
	
	public static int AddStudent(Student stud) {
		Connection con=null;
		int resp =0;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="insert into student values('" + stud.getName() + "','" + stud.getRno() + "'," + stud.getMarksPhysics() + "," + stud.getMarksChemistry() + "," + stud.getMarksMaths() + ",'" + stud.getPicUrl() + "');" ;			
			System.out.println(sql);
			resp=st.executeUpdate(sql);
			if(st!=null)st.close();
		}catch(Exception e) {
			System.out.println("getAllStudents :: Exception :: "+e);
		}finally {
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return resp;
	}
	
	public static int AddAdmin(String name, String pass) {
		Connection con=null;
		int resp =0;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="insert into admin values('" + name + "','" + pass + "')" ;		
			System.out.println(sql);
			resp=st.executeUpdate(sql);
			if(st!=null)st.close();
		}catch(Exception e) {
			System.out.println("getAllStudents :: Exception :: "+e);
		}finally {
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return resp;
	}
	
	public static List<Student> getStudentsInRange(String fromid, String toid)
	{
		List<Student> list = new ArrayList<>();
		Connection con=null;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="select name,rno,marksPhysics,marksChemistry,marksMaths,picUrl from student where rno between " + fromid + " and " + toid;
			ResultSet rs=st.executeQuery(sql);
			Student stud=null;
			while(rs.next()) {
				stud=new Student();
				stud.setName(rs.getString("name"));
				stud.setRno(rs.getString("rno"));
				stud.setMarksPhysics(rs.getInt("marksPhysics"));
				stud.setMarksChemistry(rs.getInt("marksChemistry"));
				stud.setMarksMaths(rs.getInt("marksMaths"));
				stud.setPicUrl(rs.getString("picUrl"));
				stud.setGrade( StudentManagement.getGrade((stud.getMarksPhysics() + stud.getMarksChemistry() + stud.getMarksMaths())/3));
				list.add(stud);
				stud=null;
			}
			if(rs!=null)rs=null;
			if(st!=null)st.close();
		}catch(Exception e) {
			System.out.println("getAllStudents :: Exception :: "+e);
		}finally {
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return list;
		
	}
	
	public static List<Student> getStudentsInRangeWithOrder(String fromid,String toid,String orderby)
	{
		List<Student> list = new ArrayList<>();
		Connection con=null;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="select name,rno,marksPhysics,marksChemistry,marksMaths,picUrl from student where rno between " + fromid + " and " + toid + " order by " + orderby;
			ResultSet rs=st.executeQuery(sql);
			Student stud=null;
			while(rs.next()) {
				stud=new Student();
				stud.setName(rs.getString("name"));
				stud.setRno(rs.getString("rno"));
				stud.setMarksPhysics(rs.getInt("marksPhysics"));
				stud.setMarksChemistry(rs.getInt("marksChemistry"));
				stud.setMarksMaths(rs.getInt("marksMaths"));
				stud.setPicUrl(rs.getString("picUrl"));
				stud.setGrade( StudentManagement.getGrade((stud.getMarksPhysics() + stud.getMarksChemistry() + stud.getMarksMaths())/3));
				list.add(stud);
				stud=null;
			}
			if(rs!=null)rs=null;
			if(st!=null)st.close();
		}catch(Exception e) {
			System.out.println("getAllStudents :: Exception :: "+e);
		}finally {
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return list;
		
	}
	
	public static List<Student> getStudentsOrderByGrade(String fromid,String toid)
	{
		List<Student> list = new ArrayList<>();
		Connection con=null;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="select name,rno,marksPhysics,marksChemistry,marksMaths,picUrl from student where rno between " + fromid + " and " + toid;
			ResultSet rs=st.executeQuery(sql);
			Student stud=null;
			while(rs.next()) {
				stud=new Student();
				stud.setName(rs.getString("name"));
				stud.setRno(rs.getString("rno"));
				stud.setMarksPhysics(rs.getInt("marksPhysics"));
				stud.setMarksChemistry(rs.getInt("marksChemistry"));
				stud.setMarksMaths(rs.getInt("marksMaths"));
				stud.setPicUrl(rs.getString("picUrl"));
				stud.setGrade( StudentManagement.getGrade((stud.getMarksPhysics() + stud.getMarksChemistry() + stud.getMarksMaths())/3));
				list.add(stud);
				stud=null;
			}
			Collections.sort(list);
			if(rs!=null)rs=null;
			if(st!=null)st.close();
		}catch(Exception e) {
			System.out.println("getAllStudents :: Exception :: "+e);
		}finally {
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return list;
		
	}
	
	public static void editStudent(Student stud) {
		
		Connection con=null;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="UPDATE student " +
	                   "SET marksPhysics=" + stud.getMarksPhysics() + ", marksChemistry=" + stud.getMarksChemistry() + ", marksMaths=" + stud.getMarksMaths() + " WHERE rno = '" + stud.getRno() + "';";		
			System.out.println(sql);
			int e=st.executeUpdate(sql);
			if(st!=null)st.close();
		}catch(Exception e) {
			System.out.println("getAllStudents :: Exception :: "+e);
		}finally {
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}
	
	public static int AddComment(Comment comm) {
		Connection con=null;
		int resp =0;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="insert into comments values(" + comm.getTopicno() + "," + comm.getPostedby() + ",'" + comm.getComment() + "','" + comm.getTimestamp() +  "',0);" ;			
			System.out.println(sql);
			resp=st.executeUpdate(sql);
			if(st!=null)st.close();
		}catch(Exception e) {
			System.out.println("addComment :: Exception :: "+e);
		}finally {
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return resp;
	}
	
	
	public static int CheckLogin(String username, String password) {
		Connection con=null;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="select * from admin where userid='" + username + "'";
			
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()) {
				if(password.equals(rs.getString("password")))
					return 1;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	
	public static List<Comment> getAllComments(int id) {
		List<Comment> comments = new ArrayList<>();
		Connection con=null;
		try {
			con=DBConnection.getDBConnection();
			Statement st=con.createStatement();
			String sql="select * from comments where topicno=" + id + ";";
			ResultSet rs=st.executeQuery(sql);
			Comment comm=null;
			while(rs.next()) {
				comm=new Comment();
				comm.setTopicno(rs.getInt("topicno"));
				comm.setPostedby(rs.getInt("postedby"));
				comm.setComment(rs.getString("comment"));
				comm.setTimestamp(rs.getDate("timestamp"));
				comments.add(comm);
				comm=null;
			}
			if(rs!=null)rs=null;
			if(st!=null)st.close();
		}catch(Exception e) {
			System.out.println("getComments :: Exception :: "+e);
		}finally {
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return comments;
	}
}
