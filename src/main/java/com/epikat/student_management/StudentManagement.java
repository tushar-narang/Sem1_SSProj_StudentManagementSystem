package com.epikat.student_management;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.imageio.ImageIO;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.container.AsyncResponse;
import javax.ws.rs.container.Suspended;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import com.epikat.DAO.StudentDAO;
import com.epikat.bean.Comment;
import com.epikat.bean.Student;
import com.google.gson.Gson;

@Path("/student")
public class StudentManagement {

	
	final static Map<String, AsyncResponse> waiters = new ConcurrentHashMap<>();
    final static ExecutorService ex = Executors.newSingleThreadExecutor();

    @Path("/chat1/{nick}")
    @GET
    @Produces("text/plain")
    public void hangUp(@Suspended AsyncResponse asyncResp, @PathParam("nick") String nick) {

        waiters.put(nick, asyncResp);
    }

    @Path("/chat2/{nick}")
    @POST
    @Produces("text/plain")
    @Consumes("text/plain")
    public String sendMessage(final @PathParam("nick") String nick, final String message) {

        ex.submit(new Runnable() {
            @Override
            public void run() {
                Set<String> nicks = waiters.keySet();
                for (String n : nicks) {
                    // Sends message to all, except sender
                    if (!n.equalsIgnoreCase(nick))
                        waiters.get(n).resume(nick + " said that: " + message);
                }
            }
        });

        return "Message is sent..";
    }
    
    
	
	 @Path("/list")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getStudents() {

		 GenericEntity<List<Student>> entity;
	
		 entity  = new GenericEntity<List<Student>>( StudentDAO.getAllStudents() ) { };
		
		 return Response.ok(entity).build();
	
	    }
 
	
	@POST 
	@Path("/addStuds")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response addNewStudents(
			@FormDataParam("addImageSelect") InputStream uploadedInputStream,
			@FormDataParam("addImageSelect") FormDataContentDisposition fileDetail,
			@FormDataParam("addName") String name,
			@FormDataParam("addRollno") String roll,
			@FormDataParam("addPhysicsMarks") int pm,
			@FormDataParam("addChemistryMarks") int cm,
			@FormDataParam("addMathsMarks") int mm){
		//change @FormDataParam("XXXXXX") according to your form element name
		
		
		Student st=new Student();
		st.setName(name);
		st.setRno(roll);
		st.setMarksPhysics(pm);
		st.setMarksChemistry(cm);
		st.setMarksMaths(mm);
		
		System.out.println("file details" + fileDetail.toString());
		//String uploadedFileLocation = "C:/Users/Rikki/Desktop/pics/" + roll + "." +  fileDetail.getFileName().split("\\.")[1];
		String uploadedFileLocation = "C:\\Users\\Rikki\\eclipse-workspace\\student-management-system\\src\\main\\webapp\\imageData\\" + roll + "." +  fileDetail.getFileName().split("\\.")[1];
	
		String storeUrl = "imageData/" +  roll + "." +  fileDetail.getFileName().split("\\.")[1];
		st.setPicUrl(storeUrl);
		
//		String storeUrl = "C:/Users/Rikki/eclipse-workspace/student-management-system/src/main/webapp/imageData/" + roll + "." +  fileDetail.getFileName().split("\\.")[1];
//		st.setPicUrl(storeUrl);
//		
		
		
		// save it
		writeToFile(uploadedInputStream, uploadedFileLocation);

	//	String output = "File uploaded to : " + uploadedFileLocation+" name : "+name+" roll : "+roll;
		
		
		 int resp = StudentDAO.AddStudent(st);
		 if(resp >0)
		 {
			 String result = "Record saved";
			 return Response.status(201).entity(result).build();
		 }
		 else
		 {
			 String result = "Roll No already exists";
			 return Response.status(201).entity(result).build();
		 }
		
	}


		private void writeToFile(InputStream uploadedInputStream,
			String uploadedFileLocation) {
			try {
				OutputStream out = new FileOutputStream(new File(uploadedFileLocation));
				int read = 0;
				byte[] bytes = new byte[1024];

				out = new FileOutputStream(new File(uploadedFileLocation));
				while ((read = uploadedInputStream.read(bytes)) != -1) {
					out.write(bytes, 0, read);
				}
				out.flush();
				out.close();
			} catch (Exception e) {
				System.out.println("Exception "+e);
				//e.printStackTrace();
			}

		}

	
	 @Path("/getStudent/{id}")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getStudentWithId(@PathParam("id") String id) {

		 List<Student> students = StudentDAO.getAllStudents();
		 for(Student stud: students)
		 {
			 if(stud.getRno().equals(id))
			 {
				 stud.setGrade( getGrade((stud.getMarksPhysics() + stud.getMarksChemistry() + stud.getMarksMaths())/3) );
				// stud.setImgarray(getFullImage(stud.getPicUrl()));
				 System.out.println(stud.toString());
				 return Response.ok(stud).build();
			 }
		 }
		 return Response.status(404).entity("No student found").build();
	
	    }
	 
	 @Path("/getStudent/{id1}/{id2}")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getStudentWithId(@PathParam("id1") String fromid, @PathParam("id2") String toid) {
		
		 GenericEntity<List<Student>> entity;
			
		 entity  = new GenericEntity<List<Student>>( StudentDAO.getStudentsInRange(fromid, toid) ) { };
		
		 return Response.ok(entity).build();
	
	    }
	 
	 @Path("/getStudent/{id1}/{id2}/orderBy={order}")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getStudentWithIdWithOrder(@PathParam("id1") String fromid, @PathParam("id2") String toid, @PathParam("order") String orderby) {
		
		 GenericEntity<List<Student>> entity;
			
		 entity  = new GenericEntity<List<Student>>( StudentDAO.getStudentsInRangeWithOrder(fromid, toid, orderby) ) { };
		
		 return Response.ok(entity).build();
	
	    }
	 
	 @Path("/getStudentByGradeOrder/{id1}/{id2}")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getStudentWithIdWithGradeOrder(@PathParam("id1") String fromid, @PathParam("id2") String toid) {
		
		 GenericEntity<List<Student>> entity;
			
		 entity  = new GenericEntity<List<Student>>( StudentDAO.getStudentsOrderByGrade(fromid, toid) ) { };
		
		 return Response.ok(entity).build();
	
	    }
	 
	 @Path("/editStudent")
	 @PUT
	 @Consumes(MediaType.APPLICATION_JSON)
	 @Produces(MediaType.APPLICATION_JSON)
	 public Response editStudent(Student stud) {
		 StudentDAO.editStudent(stud);	
		 stud.setGrade( getGrade((stud.getMarksPhysics() + stud.getMarksChemistry() + stud.getMarksMaths())/3) );
		 Gson gson = new Gson();
		 String resultinJson = gson.toJson(stud);
		 return Response.ok(resultinJson).build();
	     }
	 
	 public static char getGrade(int marks)
	 {
		 if(marks > 90)
			 return 'A';
		 else if(marks > 70)
			 return 'B';
		 else if(marks > 40)
			 return 'C';
		 else
			 return 'F';
	 }
	 
//	 
//	 public byte[] getFullImage(String url) {
//		    try {
//		    	BufferedImage img = ImageIO.read(new File (url));
//			     ByteArrayOutputStream baos = new ByteArrayOutputStream();
//			     ImageIO.write(img, "png", baos);
//			     byte[] imageData = baos.toByteArray();
//			     return imageData;
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	    return null; 
//	 }
	 
	 
//	 	@POST 
//		@Path("/addComment")
//		@Consumes(MediaType.MULTIPART_FORM_DATA)
//		public Response addComment(@FormDataParam("topicno") Integer topicno,
//				@FormDataParam("postedby") Integer postedby,
//				@FormDataParam("comment") String comment){
//	 		
//	 		Comment comm = new Comment();
//	 		comm.setTopicno(topicno);
//	 		comm.setPostedby(postedby);
//	 		comm.setComment(comment);
//	 		
//	 		java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
//	 		comm.setTimestamp(sqlDate);
//	 		
//	 		int resp = StudentDAO.AddComment(comm);
//	 		
//	 		 if(resp >0)
//			 {
//				 String result = "Comment Added";
//				 return Response.status(201).entity(result).build();
//			 }
//			 else
//			 {
//				 String result = "Comment Add Failed";
//				 return Response.status(201).entity(result).build();
//			 }
//		}
	 	
	 	@Path("/getComments/{topicno}")
		 @GET
		 @Produces(MediaType.APPLICATION_JSON)
		    public Response getCommentsForTopic(@PathParam("topicno") Integer id) {

			 List<Comment> comments = StudentDAO.getAllComments(id);
			 GenericEntity<List<Comment>> entity;
			 entity  = new GenericEntity<List<Comment>>( comments ) { };
			 if(comments.isEmpty())
				 return Response.status(404).entity("No comments found").build();
			 else
				 return Response.ok(entity).build();
			 
		
		    }
	 
	 	@POST 
		@Path("/checkLogin")
		@Consumes(MediaType.MULTIPART_FORM_DATA)
		public Response checkLogin(
				@FormDataParam("username") String username,
				@FormDataParam("password") String password){
			
	 		System.out.println(username + " " + password);
			 int resp = StudentDAO.CheckLogin(username, password);
			 if(resp >0)
			 {
				 String result = "User Found";
				 return Response.status(201).entity(result).build();
			 }
			 else
			 {
				 String result = "User Not Found";
				 return Response.status(404).entity(result).build();
			 }
			
		}
	 	
	 	@POST 
		@Path("/addAdmin")
		@Consumes(MediaType.MULTIPART_FORM_DATA)
		public Response addNewAdmin(
				@FormDataParam("addAdminName") String name,
				@FormDataParam("addAdminPassword") String pass){
			//change @FormDataParam("XXXXXX") according to your form element name
			
			System.out.println(name + " " + pass);
			
			 int resp = StudentDAO.AddAdmin(name, pass);
			 if(resp >0)
			 {
				 String result = "Admin Added";
				 return Response.status(201).entity(result).build();
			 }
			 else
			 {
				 String result = "Admin not added";
				 return Response.status(201).entity(result).build();
			 }
			
		}
}
