package edu.sejong.ex.service ;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sejong.ex.dto.MemberDto;

public interface MemberCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response);
}


