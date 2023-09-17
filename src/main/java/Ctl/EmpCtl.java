package Ctl;

import entity.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.employeeService;

@WebServlet("/EmpCtl")
public class EmpCtl extends HttpServlet {
    private static final long serialVersionUID=1L;
    employeeService es=new employeeService();
    RequestDispatcher rd;
    public EmpCtl() {
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get the current session if it exists
        if (session != null) {
            session.invalidate(); // Invalidate (destroy) the session
        }
        response.sendRedirect("login.jsp");
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
//        String operation = request.getParameter("operation");
        
        String firstName=request.getParameter("firstname");
        String lastName=request.getParameter("lastname");
        String userName=request.getParameter("username");
        String password=request.getParameter("password");
        String isAdminParam = request.getParameter("isAdmin");
        String salary=request.getParameter("salary");
        
        PrintWriter out=response.getWriter();
        String empId = request.getParameter("empId");
        
        if (empId != null && !empId.isEmpty()) {
            int id = Integer.parseInt(empId);
            double empSalary=Double.parseDouble(salary);
            boolean isAdmin = Boolean.parseBoolean(isAdminParam);
            Employee emp=es.add(id,firstName,lastName,userName,password,isAdmin,empSalary);
            HttpSession session = request.getSession();
            session.setAttribute("employee", emp);
           response.sendRedirect("home.jsp");
            
        } else {
            // Handle the case where empId is null or empty, perhaps by showing an error message.
            out.println("Employee ID is required.");
        }
       
        
       
    }
}