<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.ict.db.DAO"%>
<%@page import="com.ict.db.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
 
	String path = request.getServletContext().getRealPath("/upload");
	MultipartRequest mr = 
		new MultipartRequest(request,path,100*1024*1024,"utf-8",new DefaultFileRenamePolicy());
	VO vo = new VO();
	vo.setIdx(mr.getParameter("idx"));
	vo.setName(mr.getParameter("name"));
	vo.setTitle(mr.getParameter("title"));
	vo.setEmail(mr.getParameter("email"));
	vo.setPw(mr.getParameter("pw"));
	vo.setMsg(mr.getParameter("msg"));
	String f_name2 = mr.getParameter("f_name2");
	
	//첨부파일이 없으면 이전파일로 대체한다.	
	if(mr.getFile("f_name")==null){
		vo.setF_name(f_name2);
	  }else{//있으면 이걸로 한다.
		vo.setF_name(mr.getFilesystemName("f_name"));
	  }
	
	int result = DAO.getInstance().getUpdate(vo);
	if(result>0){
		response.sendRedirect("onelist.jsp?idx="+vo.getIdx());
	}
%>