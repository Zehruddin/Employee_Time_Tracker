package employee.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.doa.DBConnection;
import employee.model.Employee_model;



@WebServlet("/AddNewEmployeeServlet")
public class AddNewEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int pingenerator() {
    	int n=0;
    	Random random=new Random();
    	for(int i=0;i<4;i++) {
    		int digit=random.nextInt(1,10);
    		n=n*10+digit;
    	}
    	return n;
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String f_name=request.getParameter("firstName");
		String l_name=request.getParameter("lastName");
		String role=request.getParameter("role");
		String email=request.getParameter("email");
		String pass=Integer.toString(pingenerator());
		
		Employee_model em=new Employee_model();
		
		em.setF_name(f_name);
		em.setL_name(l_name);
		em.setRole(role);
		em.setEmail(email);
		em.setPass(pass);
		
		DBConnection obj=new DBConnection();
		
		int is=0;
		try {
			is=obj.New_Employee_insert(em);
			System.out.println(is);
			
			if(is==1) {
				response.sendRedirect("ViewAllEmployeeServlet");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
