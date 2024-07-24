package employee.doa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import employee.model.Admin_model;
import employee.model.Employee;
import employee.model.Employee_model;
import employee.model.Task_model;


public class DBConnection {
	public Connection DBC() throws ClassNotFoundException
	{
		String jbdcurl="jdbc:mysql://localhost:3306/ett";
        String jdbcuser="root";
        String jdbcPassword="zehruddin08";
        Connection con=null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(jbdcurl,jdbcuser,jdbcPassword);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // TODO Auto-generated constructor stub
        return con;
    }

	
	public boolean admin_login(Admin_model obj) throws SQLException, ClassNotFoundException{
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql = "SELECT user_name,password FROM admin_details WHERE user_name = ? AND password = ?;";
        ps = DBC().prepareStatement(sql);
        ps.setString(1, obj.getUsername());
        ps.setString(2, obj.getPassword());
        rs = ps.executeQuery();
       
        try {
			if (rs.next()) {
				return true;
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return false;
	}
	
	public boolean employee_login(Employee_model obj) throws SQLException, ClassNotFoundException{
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql = "SELECT emp_id,password FROM employee_details WHERE emp_id = ? AND password = ?;";
        ps = DBC().prepareStatement(sql);
        ps.setString(1, obj.getE_id());
        ps.setString(2, obj.getPass());
        rs = ps.executeQuery();
       
        try {
			if (rs.next()) {
				return true;
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return false;
	}
	
	public int Add_task(Task_model obj) throws ClassNotFoundException, SQLException {
		PreparedStatement ps=null;
		
		int result=0;
		ps=DBC().prepareStatement("INSERT into task (emp_id,s_date,s_time,e_date,e_time,task,duration) VALUES (?,?,?,?,?,?,?);");
		ps.setInt(1, obj.getEmp_id());
		ps.setString(2, obj.getS_date());
		ps.setString(3, obj.getS_time());
		ps.setString(4,  obj.getE_date());
		ps.setString(5, obj.getE_time());
		ps.setString(6, obj.getTask());
		ps.setString(7, obj.getDuration());
		
		try {
			result=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	
	}
	public ResultSet View_Employee_tasks() {
		ResultSet rs=null;
		try {
			Statement stmt=DBC().createStatement();
			rs=stmt.executeQuery("select * from task;");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public ResultSet View_One_Employee_task(Employee_model em) {
		ResultSet rs=null;
		try {
			PreparedStatement ps=null;
			ps=DBC().prepareStatement("select * from task where emp_id=?;");
			ps.setString(1,em.getE_id());
			rs=ps.executeQuery();
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public List<Task_model> Update_task_fetch(int id) {
		ResultSet rs=null; 
		List<Task_model> employees = new ArrayList<>();
		try {
			PreparedStatement ps=null;
			ps=DBC().prepareStatement("select * from task where task_id=?;");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
					Task_model tm=new Task_model();
					int task_id=rs.getInt("task_id");
				 	int empId=rs.getInt("emp_id");
	                String S_date = rs.getString("s_date");
	                String S_time = rs.getString("s_time");
	                String E_date = rs.getString("e_date");
	                String E_time = rs.getString("e_time");
	                String Task =rs.getString("task");
	                String Duration=rs.getString("duration");
	                tm.setTask_id(task_id);
	                tm.setEmp_id(empId);
	                tm.setS_date(S_date);
	                tm.setS_time(S_time);
	                tm.setE_date(E_date);
	                tm.setE_time(E_time);
	                tm.setTask(Task);
	                tm.setDuration(Duration);
	                employees.add(tm);
	                
	                
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return employees;
	}
	
	public int Update_task(Task_model tm) {
		int result=0;
		PreparedStatement ps=null;
		try {

			ps=DBC().prepareStatement("UPDATE task SET emp_id=?,s_date=?,s_time=?,e_date=?,e_time=?,task=?,duration=? WHERE task_id=?");
			ps.setInt(1, tm.getEmp_id());
			ps.setString(2, tm.getS_date());
			ps.setString(3, tm.getS_time());
			ps.setString(4, tm.getE_date());
			ps.setString(5, tm.getE_time());
			ps.setString(6, tm.getTask());
			ps.setString(7, tm.getDuration());
			ps.setInt(8, tm.getTask_id());
			result=ps.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int New_Employee_insert(Employee_model em) throws ClassNotFoundException, SQLException {
		PreparedStatement ps=null;
		//ResultSet rs=null;
		int result=0;
		ps=DBC().prepareStatement("INSERT into employee_details (firstname,lastname,role,email,password) VALUES (?,?,?,?,?);");
		ps.setString(1, em.getF_name());
		ps.setString(2, em.getL_name());
		ps.setString(3, em.getRole());
		ps.setString(4, em.getEmail());
		ps.setString(5, em.getPass());
		
		result=ps.executeUpdate();
		
		return result;
	}
	
	public List<Employee> View_All_Employees() {
		ResultSet rs=null; 
		List<Employee> employees = new ArrayList<>();
		try {
			Statement stmt=DBC().createStatement();
			rs=stmt.executeQuery("select * from employee_details;");
			
			while(rs.next()) {
				Employee emp = new Employee();
				 	int empId=rs.getInt("emp_id");
	                String firstName = rs.getString("firstname");
	                String lastName = rs.getString("lastname");
	                String role = rs.getString("role");
	                String email = rs.getString("email");
	                emp.setEmail(email);
	                emp.setEmpId(empId);
	                emp.setFirstName(firstName);
	                emp.setLastName(lastName);
	                emp.setRole(role);
	                employees.add(emp);
	                
	                
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return employees;
	}
	
	public boolean Delete_task(Task_model tm)
	{
		PreparedStatement ps=null;
		boolean result=false;
		try {
			ps=DBC().prepareStatement("DELETE from task WHERE  task_id=?;");
			ps.setInt(1, tm.getTask_id());
			result=ps.execute();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}
}
