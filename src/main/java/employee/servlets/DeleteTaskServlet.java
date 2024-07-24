package employee.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.doa.DBConnection;
import employee.model.Task_model;

@WebServlet("/DeleteTaskServlet")
public class DeleteTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//int e_id=Integer.parseInt(request.getParameter("emp_id"));
		int t_id=Integer.parseInt(request.getParameter("task_id"));
		
		Task_model tm=new Task_model();
		
		//tm.setEmp_id(e_id);
		tm.setTask_id(t_id);
		
		DBConnection obj=new DBConnection();
		
		boolean res=false;
		res=obj.Delete_task(tm);
		System.out.print(res);
		
		if(!res) {
			response.sendRedirect("ViewTask.jsp");
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
