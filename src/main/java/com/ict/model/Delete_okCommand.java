package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;

public class Delete_okCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		String idx = request.getParameter("idx");
		int result = DAO.getInstance().getDelete(idx);
		System.out.println(result + ": È®ÀÎ");
		if(result>0){ 
			return "MyController?cmd=list";
		} 
		return null;
	}
}
