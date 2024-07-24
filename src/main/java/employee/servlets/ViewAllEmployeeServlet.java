package employee.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.doa.DBConnection;
import employee.model.Employee;

@WebServlet("/ViewAllEmployeeServlet")
public class ViewAllEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		List<Employee> employees = new ArrayList<>();
		
		DBConnection obj=new DBConnection();
		
		employees=obj.View_All_Employees();


		request.setAttribute("employees", employees);
        request.getRequestDispatcher("ViewAllEmployee.jsp").forward(request, response);

		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
