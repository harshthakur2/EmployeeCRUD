package Ctl;
import service.employeeService;
import entity.Employee;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateEmp
 */
@WebServlet("/UpdateEmp")
public class UpdateEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        int empId = Integer.parseInt(request.getParameter("empId"));
	        String username = request.getParameter("username");
	        String firstname = request.getParameter("firstname");
	        String lastname = request.getParameter("lastname");
	        double salary = Double.parseDouble(request.getParameter("salary"));
	        boolean admin = Boolean.parseBoolean(request.getParameter("isAdmin"));
	        String password = request.getParameter("password");

	        Employee updatedEmployee = new Employee(empId, firstname, lastname, username, password, admin, salary);

	        employeeService es = new employeeService();
	        boolean success = es.updateEmployee(updatedEmployee);

	        if (success) {
	            response.sendRedirect("home.jsp"); 
	        } else {
	            response.getWriter().println("Failed to update data.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.getWriter().println("Error: " + e.getMessage());
	    }
	}



}
