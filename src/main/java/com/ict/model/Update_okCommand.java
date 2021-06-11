package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class Update_okCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
	    VO vo = new VO();
	    vo.setIdx(request.getParameter("idx"));
		vo.setName(request.getParameter("name"));
		vo.setTitle(request.getParameter("title"));
		vo.setEmail(request.getParameter("email"));
		vo.setPw(request.getParameter("pw"));
		vo.setMsg(request.getParameter("msg"));
		
		int result = DAO.getInstance().getUpdate(vo);
		if(result>0){ 
			// response.sendRedirect("onelist.jsp?idx="+vo.getIdx());
			return "MyController?cmd=onelist&idx="+vo.getIdx();
		}
		return null;
	}
}
