<%@page import="dao.GymDAO"%>
<%@page import="dto.GymDTO"%>
<%@page import="util.FileUtil"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
GymDTO gym = new GymDTO();
String user_no = null;
String gym_name = null;
String gym_content = null;
String gym_secret = null;
String gym_addr = null;
String gym_salary = null;
String gym_image = null;
byte[] gym_file = null;

ArrayList<String> fileNames = new ArrayList<>();

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
		System.out.println(value);
		if (name.equals("user_no"))	gym.setUser_no(value);
		else if (name.equals("gym_name")) gym.setGym_name(value);
		else if (name.equals("gym_content")) gym.setGym_content(value);
		else if (name.equals("gym_secret")) gym.setGym_secret(value);
		else if (name.equals("gym_addr")) gym.setGym_addr(value);
		else if (name.equals("gym_salary")) gym.setGym_salary(value);
	} else {
		if (name.equals("gym_images")) {//null이 아닌 경우의 조건을 추가해야할듯
			if (item.getSize() != 0) {
				gym_image = item.getName();
				fileNames.add(gym_image);
				gym_file = item.get();
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root, gym_image, gym_file);
			} 
		}
	}
}

if(gym.getGym_secret() == null){
	gym.setGym_secret("0");
}
if(fileNames.size() != 0){
	gym_image = "";
	for(String name : fileNames){
		gym_image += name + "/";
	}
	gym.setGym_images(gym_image);
} else {
	gym.setGym_images("/");
}

GymDAO dao = new GymDAO();
if (dao.changeGymProfile(gym)) {
	response.sendRedirect("changeProfileGym.jsp");
}
%>


















