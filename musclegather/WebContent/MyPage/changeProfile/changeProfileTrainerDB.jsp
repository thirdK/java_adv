<%@page import="dto.TrainerDTO"%>
<%@page import="dao.TrainerDAO"%>
<%@page import="util.FileUtil"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
TrainerDTO trainer = new TrainerDTO();
String user_no = null;
String trainer_title = null;
String trainer_content = null;
String trainer_secret = null;
String trainer_addr = null;
String trainer_image = null;
byte[] trainer_file = null;

/* ArrayList<String> fileNames = new ArrayList<>(); */

ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
List<FileItem> items = sfu.parseRequest(request);
Iterator<FileItem> iter = items.iterator();

System.out.println(request.getParameter("user_no"));

while(iter.hasNext()){
	FileItem item = (FileItem)iter.next();
	String name = item.getFieldName();
	System.out.println(name);
	
	if(item.isFormField()){
		String value = item.getString("UTF-8");
		if(name.equals("user_no")) user_no = value;
		else if(name.equals("trainer_title")) trainer_title = value;
		else if(name.equals("trainer_content")) trainer_content = value;
		else if(name.equals("trainer_secret")) {
			trainer_secret = value.equals("true") ? "1" : "0";
		}
		else if(name.equals("trainer_addr")) trainer_addr = value;
	} else {
		if(name.equals("trainer_images")){//null이 아닌 경우의 조건을 추가해야할듯
			trainer_image = item.getName();
			trainer_file = item.get();
			
			String root = application.getRealPath(java.io.File.separator);
			FileUtil.saveImage(root, trainer_image, trainer_file);
		}
	}
}
	System.out.println(user_no);
	System.out.println(trainer_title);
	System.out.println(trainer_content);
	System.out.println(trainer_secret);
	System.out.println(trainer_addr);
	System.out.println(trainer_image);
/* 	System.out.println(trainer.getUser_no());
	System.out.println(trainer.getTrainer_title());
	System.out.println(trainer.getTrainer_content());
	System.out.println(trainer.getTrainer_secret());
	System.out.println(trainer.getTrainer_addr());
	System.out.println(trainer.getTrainer_images()); */

/* TrainerDAO dao = new TrainerDAO();
if(dao.changeTrainerProfile(trainer)) */
%>


















