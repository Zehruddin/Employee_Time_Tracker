package employee.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import employee.doa.DBConnection;
import employee.model.Task_model;  

@WebServlet("/FetchTaskServlet")
public class FetchTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DBConnection con=new DBConnection();
		int task_id = Integer.parseInt(request.getParameter("task_id"));
		
		HttpSession session=request.getSession();
		session.setAttribute("TASK_ID", task_id);
		
		Task_model tm=new Task_model();
		tm.setTask_id(task_id);
		List<Task_model> task_model = new ArrayList<>();
		task_model = con.Update_task_fetch(task_id);
		
		request.setAttribute("task_model", task_model);
        request.getRequestDispatcher("UpdateTask.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
