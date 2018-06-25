package web.servlets;

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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import web.bean.QuestionBean;

/**
 * Servlet implementation class test
 */
@WebServlet("/quizmanagement")
public class QuizManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "jdbc/MyTHIPool")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuizManagement() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		final HttpSession session = request.getSession();
		Integer userID = -1;
		Integer gameID = -1;
		Integer categoryID = -1;
		
		//Sessionhandling init
		
		if (session.getAttribute("userID") != null) {
			userID = (Integer) session.getAttribute("userID");
		}

		if (session.getAttribute("gameID") != null) {
			gameID = (Integer) session.getAttribute("gameID");
		}
		
		if (session.getAttribute("categoryID") != null) {
			categoryID = (Integer) session.getAttribute("categoryID");
		}

		String action = request.getParameter("action");
		
		try {
			if (action == null) {
				// Abfrage ob User bereits eine gültige Session hat
				if (userID != -1) {
					//ja, check ob noch ein offenes Spiel besteht
					if (hasOpenGame(userID, session)) {
						QuestionBean qb = getNextQuestion(gameID, categoryID);
						request.setAttribute("QuestionBean", qb);
						final RequestDispatcher dispatcher = request.getRequestDispatcher("/home/html/quiz.jsp");
						dispatcher.forward(request, response);
					}
					else {
						final RequestDispatcher dispatcher = request.getRequestDispatcher("/home/html/landing.jsp");
						dispatcher.forward(request, response);
					}
				} 
				else {
					//nein => login
					final RequestDispatcher dispatcher = request.getRequestDispatcher("/home/html/login.jsp");
					dispatcher.forward(request, response);
				}
			} else {
				String password = request.getParameter("password");;
				String userName = request.getParameter("userName");
				final RequestDispatcher dispatcher;
				switch (action) {
				case "login":
					
					Integer id = checkUser(userName, password);
					if (id != -1) {
						session.setAttribute("userID", id);
						
						if (hasOpenGame(id, session)) {
							gameID = (Integer) session.getAttribute("gameID");
							categoryID = (Integer) session.getAttribute("categoryID");
									
							QuestionBean qb = getNextQuestion(gameID, categoryID);
							request.setAttribute("QuestionBean", qb);
							dispatcher = request.getRequestDispatcher("/home/html/quiz.jsp");
							dispatcher.forward(request, response);
						}
						else {
						dispatcher = request.getRequestDispatcher("/home/html/landing.jsp");
						dispatcher.forward(request, response);
						}
					}
					else {
						dispatcher = request.getRequestDispatcher("/home/html/login.jsp");
						dispatcher.forward(request, response);
					}
						
					break;
				case "register":
					String vName = request.getParameter("vName");
					String nName = request.getParameter("nName");
					String mail = request.getParameter("mail");
					Integer result = registerUser(vName, nName, userName, password, mail);
					session.setAttribute("userID", result);
					dispatcher = request.getRequestDispatcher("/home/html/landing.jsp");
					dispatcher.forward(request, response);
					break;
				case "checkUsername":
					if (checkUsername(userName)) {
						response.getWriter().println("true");
					}
					break;
				case "startGame":
					categoryID =  (Integer) request.getAttribute("categoryID");
					session.setAttribute("categoryID", categoryID);
					gameID = startGame(userID, categoryID);
					session.setAttribute("gameID", gameID);
					QuestionBean qb = getNextQuestion(gameID, categoryID);
					request.setAttribute("QuestionBean", qb);
					dispatcher = request.getRequestDispatcher("/home/html/quiz.jsp");
					dispatcher.forward(request, response);
					
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected Integer startGame(Integer userID, Integer categoryID) throws Exception {
			try (Connection cnx = ds.getConnection();){
			
			PreparedStatement sql = cnx.prepareStatement("INSERT INTO games (userID, categoryID, starttime) VALUES (?, ?, NOW())");
			sql.setInt(1, userID);
			sql.setInt(2, categoryID);
			
			
			sql.executeUpdate();
			
			Integer result = -1;
			ResultSet rs = sql.getGeneratedKeys();
				while (rs.next()) {
					result = rs.getInt(1);
				}
				
			return result;
		} 
		catch (Exception ex) {
			throw ex;
		}
	}
	
	protected Integer registerUser(String vName, String nName, String userName, String password, String mail) throws Exception{
		try (Connection cnx = ds.getConnection();){
			
			PreparedStatement sql = cnx.prepareStatement("INSERT INTO players (nName, vName, pw, username) VALUES (?, ?, ?, ?)");
			sql.setString(1, nName);
			sql.setString(2, vName);
			sql.setString(3, password);
			sql.setString(4, userName);
			
			sql.executeUpdate();
			Integer result = -1;
			ResultSet rs = sql.getGeneratedKeys();
				while (rs.next()) {
					result = rs.getInt(1);
				}
				
			return result;
		} 
		catch (Exception ex) {
			throw ex;
		}
		
		
	}

	protected Boolean hasOpenGame(Integer userID, HttpSession session) throws Exception {
		try (Connection cnx = ds.getConnection();
				PreparedStatement sql = cnx.prepareStatement("SELECT * FROM games WHERE userID = ? AND endtime IS NULL");) {
			sql.setLong(1, userID);

			try (ResultSet rs = sql.executeQuery()) {
				if (rs != null && rs.next()) { 
					session.setAttribute("gameID", rs.getInt(1));
					session.setAttribute("categoryID", rs.getInt(3));
					return true;
				}
				else {
					session.setAttribute("gameID", -1);
					session.setAttribute("categoryID", -1);
					return false;
				}
			}
			

		} catch (Exception ex) {
			throw ex;

		}
	}
	
	protected Boolean checkUsername(String userName) throws Exception {
		try (Connection cnx = ds.getConnection();
				 PreparedStatement sql = cnx.prepareStatement("SELECT * FROM users WHERE username = ?");)
			{
				sql.setString(1, userName);
				
				Boolean result = false;
				
				sql.executeQuery();
				
				try (ResultSet rs = sql.executeQuery()){
					if (rs != null && rs.next()) {
						result = true;
					}
				}
				return result;
				
			}
			catch (Exception ex){
				throw ex;
				
			}
	}

	protected QuestionBean getNextQuestion(Integer gameID, Integer categoryID) throws Exception{
		
		try (Connection cnx = ds.getConnection()){ 
			
			PreparedStatement sql = cnx.prepareStatement("SELECT * FROM questions WHERE idQuestion NOT IN (SELECT questionID FROM results WHERE gameID = ?) AND categoryID = ? ORDER BY RAND() LIMIT 1;");
			
				sql.setLong(1, gameID);
				sql.setLong(2, categoryID);
				QuestionBean qb = new QuestionBean();
				
				try {
					ResultSet rs = sql.executeQuery();
					
					if (rs != null && rs.next()) {
						qb.setqID(rs.getInt(1));
						qb.setQ(rs.getString(2));
						
					}
					
					sql = cnx.prepareStatement("SELECT qa.answerID, a.answer FROM questions_answers AS qa INNER JOIN answers AS a WHERE qa.questionID = ?");
					
					sql.setInt(1, qb.getqID());
					
					rs = sql.executeQuery();
					
					if (rs != null) {
						
						for (Integer i = 0; i<=3; i++)
						{
							rs.next();
							switch (i) {
							case 0:
								qb.setA_ID1(rs.getInt(1));
								qb.setA_1(rs.getString(2));
								break;
							case 1:
								qb.setA_ID2(rs.getInt(1));
								qb.setA_2(rs.getString(2));
								break;
							case 2:
								qb.setA_ID3(rs.getInt(1));
								qb.setA_3(rs.getString(2));
								break;
							case 3:
								qb.setA_ID4(rs.getInt(1));
								qb.setA_4(rs.getString(2));
								break;
							}
						}
						
					}	
				
				return qb;
				
			}
			catch (Exception ex){
				throw ex;	
			}
		}
	}
	
	private Integer checkUser(String userName, String password) throws Exception {
		
		try (Connection cnx = ds.getConnection();
				 PreparedStatement sql = cnx.prepareStatement("SELECT * FROM users WHERE username = ? AND pw = md5(?)");)
			{
				sql.setString(1, userName);
				sql.setString(2, password);
				
				
				Integer result = -1;
				try (ResultSet rs = sql.executeQuery()){
					if (rs != null && rs.next()) {
						result = rs.getInt(1);
					}
				}
				return result;
				
			}
			catch (Exception ex){
				throw ex;
				
			}
	}
}
