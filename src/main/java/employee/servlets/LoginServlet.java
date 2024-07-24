package employee.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import employee.doa.DBConnection;
import employee.model.Admin_model;
import employee.model.Employee_model;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String u_name=request.getParameter("username");
		String pass=request.getParameter("password");
		
		String role=request.getParameter("role");
		
		if(role.equals("admin")) {
			DBConnection obj=new DBConnection();
			
			Admin_model am=new Admin_model();
			am.setUsername(u_name);
			am.setPassword(pass);
			
			boolean is=false;
			try {
				is=obj.admin_login(am);
				
				if(is) {
					response.sendRedirect("AdminDashboard.jsp");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		}
		else
		{
			response.sendRedirect("LoginFailure.jsp");
		}
		if(role.equals("employee")) {
			
			DBConnection obj=new DBConnection();
			Employee_model em=new Employee_model();
			em.setE_id(u_name);
			em.setPass(pass);
			
			boolean is=false;
			try {
				is=obj.employee_login(em);
				
				HttpSession session=request.getSession();
				session.setAttribute("emp_id", u_name);
				
				if(is)
				{
					response.sendRedirect("EmployeeDashboard.jsp");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			response.sendRedirect("LoginFailure.jsp");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
