package web.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class UserManagement
 */
@WebServlet("/UserManagement")
public class UserManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup="jdbc/MyTHIPool")
	private DataSource ds;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		final String user = request.getParameter("username");
		final String pw = request.getParameter("password");
		
		Boolean bol = false;
		try {
			bol = checkUser(user, pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (bol)
		{
			final RequestDispatcher dispatcher = request.getRequestDispatcher("/examples/passt.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			final RequestDispatcher dispatcher = request.getRequestDispatcher("/examples/login.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private Boolean checkUser(String userName, String password) throws Exception {
		
		try (Connection cnx = ds.getConnection();
				 PreparedStatement sql = cnx.prepareStatement("SELECT * FROM users WHERE username = ? AND pw = md5(?)");)
			{
				sql.setString(1, userName);
				sql.setString(2, password);
				
				
				
				try (ResultSet rs = sql.executeQuery()){
					if (rs != null && rs.next()) {
						return true;
					}
				}
				return false;
				
			}
			catch (Exception ex){
				throw ex;
				
			}
	}
		

	
	@SuppressWarnings("unused")
	private int registerUser(String username, String password, String nName, String vName) {
		
		return 0;
	}
	
}
