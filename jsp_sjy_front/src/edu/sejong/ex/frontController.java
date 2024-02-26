package edu.sejong.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sejong.ex.dao.MemberDao;
import edu.sejong.ex.dto.MemberDto;
import edu.sejong.ex.service.MemberCommand;
import edu.sejong.ex.service.MemberInsertCommand;
import edu.sejong.ex.service.MemberModifyCommand;
import edu.sejong.ex.service.MemberService;
import edu.sejong.ex.service.MemberServiceImpl;
import edu.sejong.ex.service.MemberdeleteCommand;

/**
 * Servlet implementation class frontController
 */
@WebServlet("*.do")
public class frontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public frontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doGet() ..");
		actionDo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() ..");
		actionDo(request,response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("actionDo() ..");
		
		String uri  = request.getRequestURI();
		System.out.println("uri: "+uri);
		
		String contextPath  = request.getContextPath();
		System.out.println("contextPath: "+contextPath);
		
		String command  = uri.substring(contextPath.length());
		System.out.println("command: "+command);	
		
		MemberService service = null;
		MemberCommand mCommand = null;

		
		if(command.contentEquals("/insert.do")) {
		System.out.println("데이터추가처리");
		System.out.println("-------------------------------------");
		mCommand = new MemberInsertCommand();
		mCommand.execute(request, response);
				
		response.setContentType("text/html; charset=UTF-8");
	     PrintWriter writer = response.getWriter();
                
        writer.println("유저가 추가되었습니다.");
	
		}else if(command.contentEquals("/select.do")) {
			System.out.println("데이터보여주기");
			System.out.println("-------------------------------------");
			
			response.setContentType("text/html; charset=UTF-8");
		     PrintWriter writer = response.getWriter();
	         
	         service = new MemberServiceImpl();
	         MemberDto member = service.execute(request,response);
	         
	         
	         writer.println("아이디:"+member.getId()+"<br>");
	         writer.println("패스워드:"+member.getPw()+"<br>");

	         writer.println("</body></html>");

			}else if(command.contentEquals("/modify.do")) {
			System.out.println("데이터갱신처리");
			System.out.println("-------------------------------------");
			mCommand = new MemberModifyCommand();
			mCommand.execute(request, response);
					
			response.setContentType("text/html; charset=UTF-8");
		     PrintWriter writer = response.getWriter();
	                
	        writer.println("유저가 갱신되었습니다.");
		}else if(command.contentEquals("/delete.do")) {
				System.out.println("데이터삭제처리");
				System.out.println("-------------------------------------");
				mCommand = new MemberdeleteCommand();
				mCommand.execute(request, response);
						
				response.setContentType("text/html; charset=UTF-8");
			     PrintWriter writer = response.getWriter();
		                
		        writer.println("유저가 삭제되었습니다.");
			}


	}

}
