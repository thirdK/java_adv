<%@page import="util.FileUtil"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="jdbc.FeedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%
String uid = null;
String ucon = null;
String ufname = null;
byte[] ufile = null;

ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
List<FileItem> items = sfu.parseRequest(request);
Iterator<FileItem> iter = items.iterator();

while(iter.hasNext()){
	FileItem item = (FileItem)iter.next();
	String name = item.getFieldName();
	if(item.isFormField()){
		String value = item.getString("utf-8");
		if(name.equals("uid")) uid = value;
		else if(name.equals("ucon")) ucon = value;
	} else {
		if(name.equals("uimage")){
			ufname = item.getName();
			ufile = item.get();
			
			String root = application.getRealPath(java.io.File.separator);
			FileUtil.saveImage(root, ufname, ufile);
		}
	}
}



FeedDAO dao = new FeedDAO();
if(dao.insert(uid,ucon,ufname)){
	response.sendRedirect("main.jsp");
}
%>