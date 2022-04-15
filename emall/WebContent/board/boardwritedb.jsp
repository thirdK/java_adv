<%@page import="jdbc.BoardDAO"%>
<%@page import="util.FileUtil"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	request.setCharacterEncoding("UTF-8");

// images로 전체 데이터가 넘어온다.
String btitle = null;
String bcontent = null;
String bimage = null;

byte[] bfile = null;

ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
// 추출 값들을 객체 형태로 저장할 준비

List items = sfu.parseRequest(request);
// 입력된 값들을 추출하여 객체에 저장

Iterator iter = items.iterator();
// 순차적으로 접근하기 위해 객체 생성

while (iter.hasNext()) { // 요소가 있으면 계속 반복 없으면 종료
	FileItem item = (FileItem) iter.next(); //요소를 하나씩 추출
	String name = item.getFieldName(); //요소의 이름 추출

	if (item.isFormField()) { //이름과 값으로 즉 맵 형태 쌍으로 구성되어 있는지 확인
		//텍스트를 추출		
		String value = item.getString("utf-8");
		if (name.equals("btitle"))	btitle = value;
		else if (name.equals("bcontent")) bcontent = value;
		
	} else {
		//사진을 추출
		if (name.equals("images")) {
			bimage = item.getName(); //사진이름
			bfile = item.get(); //사진내용
		
			//서버에 사진 저장
			String root = application.getRealPath(java.io.File.separator);
			FileUtil.saveImage(root, bimage, bfile);

		}
	}
}
//DB에 게시물 모든 정보 전달
BoardDAO dao = new BoardDAO();
String buser = (String)session.getAttribute("id");
if (dao.insert(btitle, bcontent, buser, bimage)) {
	response.sendRedirect("board.jsp");
}
%>
</body>
</html>