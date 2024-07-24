package employee.servlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.doa.DBConnection;
import employee.model.Task_model;


@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int e_id=Integer.parseInt(request.getParameter("employeeId"));
		String s_date=request.getParameter("startDate");
		String s_time=request.getParameter("startTime");
		String e_date=request.getParameter("endDate");
		String e_time=request.getParameter("endTime");
		String task=request.getParameter("task");
		String duration=request.getParameter("duration");
		
		Task_model tm=new Task_model();
		
		tm.setEmp_id(e_id);
		tm.setS_date(s_date);
		tm.setS_time(s_time);
		tm.setE_date(e_date);
		tm.setE_time(e_time);
		tm.setTask(task);
		tm.setDuration(duration);
		
		DBConnection obj=new DBConnection();
		
		int is=0;
		try {
			is=obj.Add_task(tm);
			
			if(is==1) {
				response.sendRedirect("ViewTask.jsp");
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
