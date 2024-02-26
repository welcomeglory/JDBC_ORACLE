package edu.sejong.ex.service ;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sejong.ex.dao.MemberDao;
import edu.sejong.ex.dto.MemberDto;

public class MemberdeleteCommand implements MemberCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		MemberDto dto = new MemberDto(id,null,null,null);
		
		MemberDao dao = new MemberDao();
		
		dao.deleteMember(dto);		
	}
}


