package project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/project_servlet/*")
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse 
			response) throws ServletException, IOException {
		
		String uri=request.getRequestURI();
		ProjectDAO dao=new ProjectDAO();
		
		 if(uri.indexOf("project.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디:"+userid);
			System.out.println("패스워드:"+passwd);
			ProjectDTO dto=new ProjectDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/Project/project_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		 }else if(uri.indexOf("projectmembership.do") != -1) {
				String userid=request.getParameter("userid");
				String passwd=request.getParameter("passwd");
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String hp=request.getParameter("hp");
				ProjectDTO dto=new ProjectDTO();
				dto.setUserid(userid);
				dto.setPasswd(passwd);
				dto.setName(name);
				dto.setEmail(email);
				dto.setHp(hp);
				dao.insert(dto);
		 }		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
