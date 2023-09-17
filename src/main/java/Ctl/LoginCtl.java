package Ctl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Employee;
import service.employeeService;

/**
 * Servlet implementation class LoginCtl
 */
@WebServlet("/LoginCtl")
public class LoginCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	employeeService es=new employeeService();
	RequestDispatcher rd;
	
    public LoginCtl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation = request.getParameter("operation");
		if(operation.equals("login")) {
		String UserName = request.getParameter("username");
		String Password = request.getParameter("password");
		
			Employee emp = es.login(UserName, Password);
			
			if (emp != null) {
				if(emp.isAdmin()) {
			    HttpSession session = request.getSession(); // Create a new session if it doesn't exist
			    session.setAttribute("emp", emp); // Store user information in the session
			    response.sendRedirect("home.jsp");}
				else {
					 HttpSession session = request.getSession(); // Create a new session if it doesn't exist
					    session.setAttribute("emp", emp); // Store user information in the session
					    response.sendRedirect("home.jsp");
				}
			}
			else
			{
				request.setAttribute("msg", "Invalid Credentials");
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		}
		
	}

}
