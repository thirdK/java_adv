<%@page import="dto.TrainerDTO"%>
<%@page import="dao.TrainerDAO"%>
<%@page import="util.FileUtil"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
// 추출 값들을 객체 형태로 저장할 준비
List items = sfu.parseRequest(request);
// 입력된 값들을 추출하여 객체에 저장
Iterator iter = items.iterator();
// 순차적으로 접근하기 위해 객체 생성

while (iter.hasNext()) {
	FileItem item = (FileItem) iter.next();
	String name = item.getFieldName();

	if (item.isFormField()) {
		String value = item.getString("UTF-8");
		if (name.equals("user_no"))	user_no = value;
		else if (name.equals("trainer_title")) trainer_title = value;
		else if (name.equals("trainer_content")) trainer_content = value;
		else if (name.equals("trainer_secret")) trainer_secret = value;
		else if (name.equals("trainer_addr")) trainer_addr = value;
	} else {
		if (name.equals("trainer_images")) {//null이 아닌 경우의 조건을 추가해야할듯
			if (item.getSize() != 0) {
				trainer_image = item.getName();
				trainer_file = item.get();
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root, trainer_image, trainer_file);
			}
		}
	}
}
trainer.setUser_no(user_no);
trainer.setTrainer_title(trainer_title);
trainer.setTrainer_content(trainer_content);
trainer.setTrainer_secret(trainer_secret == null ? "0" : "1");
//체크안하면 trainer_secret 자체가 안넘어와서 null이 됨 -> 0으로 변경
trainer.setTrainer_addr(trainer_addr);
trainer.setTrainer_images(trainer_image == null ? "/" : trainer_image);
//이미지 입력안하면 null로 인해 오류발생하므로 "/"를 보내준다.

TrainerDAO dao = new TrainerDAO();
if (dao.changeTrainerProfile(trainer)) {
	response.sendRedirect("changeProfileTrainer.jsp");
}
%>


















