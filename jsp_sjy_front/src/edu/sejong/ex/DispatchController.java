package edu.sejong.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.RequestDispatcher;
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
@WebServlet("/dispatch")
public class DispatchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatchController() {
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

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		System.out.println("actionDo() ..");

		request.setAttribute("id","abcde");
		request.setAttribute("pw","12345");
		
		//서블릿파일에서 jsp로 forqading하는 구분	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/show.jsp");
		dispatcher.forward(request, response);		
		
	}
}
