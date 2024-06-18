package homePlanner;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.util.UUID;

/**
 * Servlet implementation class CreateTask
 */
public class CreateTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTask() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		@SuppressWarnings("unused")
		PrintWriter out=response.getWriter();
		String hid = request.getParameter("House_ID");
		String hs=request.getParameter("Status");
		String hl=request.getParameter("Location");
		String hsize=request.getParameter("Size");		
		String hc=request.getParameter("Color");
		String hb=request.getParameter("Budget");
		Task ct = new Task();
		ct.setHouse_ID(hid);
		ct.setStatus(hs);
		ct.setLocation(hl);
		ct.setSize(hsize);
		ct.setColor(hc);
		ct.setBudget(hb);
		request.setAttribute("ct",ct);       
		int result = 0;
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javafs","root","root");
	String query = "INSERT INTO createtask (House_ID, Status, Location, Size, Color, Budget) VALUES (?, ?, ?, ?, ?,?);";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
preparedStatement.setString(1, ct.getHouse_ID());
preparedStatement.setString(2, ct.getStatus());
preparedStatement.setString(3, ct.getLocation());
preparedStatement.setString(4, ct.getSize());
preparedStatement.setString(5, ct.getColor());
preparedStatement.setString(6, ct.getBudget());
            System.out.println(preparedStatement);
result = preparedStatement.executeUpdate();
            RequestDispatcher rd=request.getRequestDispatcher("Main.jsp");
rd.forward(request,response);

        } catch (Exception e) {
            System.err.println(e);
        }        
	// Method to generate unique ID
	}
	
}
