package employee.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.doa.DBConnection;
import employee.model.Task_model;


@WebServlet("/UpdateTaskServlet")
public class UpdateTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		int T_id= Integer.parseInt(request.getParameter("task_id"));
		int E_id=Integer.parseInt(request.getParameter("emp_id"));
		String S_date=request.getParameter("s_date");
		String S_time=request.getParameter("s_time");
		String E_date=request.getParameter("e_date");
		String E_time=request.getParameter("e_time");
		String Task=request.getParameter("task");
		String Duration=request.getParameter("duration");
		
		Task_model tm=new Task_model();
		
		tm.setTask_id(T_id);
		tm.setEmp_id(E_id);
		tm.setS_date(S_date);
		tm.setS_time(S_time);
		tm.setE_date(E_date);
		tm.setE_time(E_time);
		tm.setTask(Task);
		tm.setDuration(Duration);
		
		DBConnection obj=new DBConnection();
		
		int res=0;
		res=obj.Update_task(tm);
		if(res==1) {
			response.sendRedirect("ViewTask.jsp");
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
