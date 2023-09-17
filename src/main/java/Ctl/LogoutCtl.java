package Ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutCtl")
public class LogoutCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutCtl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession(false); // Get the current session if it exists
            if (session != null) {
            	boolean isAdmin=(boolean) session.getAttribute("isAdmin");
            	if(isAdmin) {
            		System.out.println("Admin session expired");
                session.invalidate(); // Invalidate (destroy) the session
                response.sendRedirect("login.jsp");
            	}	
            	else {
            		System.out.println("User session expired");
                    session.invalidate(); // Invalidate (destroy) the session
                    response.sendRedirect("login.jsp");
                	
            	}
            }
        }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
