package web.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import web.bean.HighscoreEntryBean;
import web.bean.QuestionBean;
import web.bean.UserBean;

/**
 * Servlet implementation class test
 */
@WebServlet("/quizmanagement")
public class QuizManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "jdbc/MyTHIPool")
	private DataSource ds;
	private String landing = "./html/landing.jsp";
	private String quiz = "./html/quiz.jsp";
	private String login = "./html/login.jsp";
	//private String register = "./html/register.jsp";
	private String personal = "./html/personal.jsp";
	private String statistik = "./html/statistik.jsp";
	

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
		
		// Sessionhandling init

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
		QuestionBean qb;

		try {
			if (action == null) {
				// Abfrage ob User bereits eine gueltige Session hat
				if (userID != -1) {
					// ja, check ob noch ein offenes Spiel besteht
					if (hasOpenGame(userID, session)) {
						qb = getNextQuestion(gameID, categoryID);
						request.setAttribute("QuestionBean", qb);
						dispatch(request, response,"quiz", userID);
					} else {
						dispatch(request, response,"landing", userID);
					}
				} else {
					// nein => login
					dispatch(request, response,"login", userID);
				}
			} else {
				// Passwort + Username aus Formular auslesen
				String password = request.getParameter("password");
				String userName = request.getParameter("userName");
				
				switch (action) {
				case "login":

					Integer id = checkUser(userName, password);
					if (id != -1) {
						session.setAttribute("userID", id);

						if (hasOpenGame(id, session)) {
							gameID = (Integer) session.getAttribute("gameID");
							categoryID = (Integer) session.getAttribute("categoryID");

							qb = getNextQuestion(gameID, categoryID);
							request.setAttribute("QuestionBean", qb);
							
							dispatch(request, response,"quiz", id);
							
						} else {
							dispatch(request, response,"landing", id);
						}
					} else {
						dispatch(request, response,"login", id);
					}

					break;
				case "register":
					String vName = request.getParameter("vName");
					String nName = request.getParameter("nName");
					String mail = request.getParameter("mail");
					Integer result = registerUser(vName, nName, userName, password, mail);
					session.setAttribute("userID", result);
					dispatch(request, response,"landing", result);
					break;
				case "checkLandingOrGame":
					if (hasOpenGame(userID,session)) {
						qb = getNextQuestion(gameID, categoryID);
						
						if (qb != null) 
						{
							request.setAttribute("QuestionBean", qb);
							dispatch(request, response,"quiz", userID);
						}
						else {
							dispatch(request, response,"landing", userID);
						}
					} else {
						dispatch(request, response,"landing", userID);
					}
					break;
				
				case "checkUsername":
					if (checkUsername(userName)) {
						response.getWriter().append("true");
					}
					else {
						response.getWriter().append("false");
					}						
					break;
				case "startGame1":
					session.setAttribute("categoryID", 1);
					gameID = startGame(userID, 1);
					session.setAttribute("gameID", gameID);
					qb = getNextQuestion(gameID, 1);
					request.setAttribute("QuestionBean", qb);
					dispatch(request, response,"quiz", userID);
					break;
				case "startGame2":
					session.setAttribute("categoryID", 2);
					gameID = startGame(userID, 2);
					session.setAttribute("gameID", gameID);
					qb = getNextQuestion(gameID, 2);
					request.setAttribute("QuestionBean", qb);
					dispatch(request, response,"quiz", userID);
					break;
				case "startGame3":
					session.setAttribute("categoryID", 3);
					gameID = startGame(userID, 3);
					session.setAttribute("gameID", gameID);
					qb = getNextQuestion(gameID, 3);
					request.setAttribute("QuestionBean", qb);
					dispatch(request, response,"quiz", userID);
					break;
				case "setAnswer":
					Integer q_ID = Integer.parseInt(request.getParameter("question"));
					Integer a_ID = Integer.parseInt(request.getParameter("answer"));

					
					if (checkAnswer(q_ID, a_ID, gameID)) {
						response.getWriter().append("true");
					}
					else {
						response.getWriter().append("false");
					}
					break;
				case "getNextQuestion":
					qb = getNextQuestion(gameID, categoryID);
					
					if (qb == null) {
						dispatch(request, response,"landing", userID);
					}
					else 
					{
						request.setAttribute("QuestionBean", qb);
						dispatch(request, response,"quiz", userID);
					}
					break;
				case "personal":
					dispatch(request, response,"personal", userID);
					break;
				case "logout":
					session.invalidate();
					request.setAttribute("UserData", new UserBean());
					dispatch(request, response,"login", -1);
			        break;
				case "landing":
					dispatch(request, response,"landing", userID);
			        break;
				case "statistik":
					dispatch(request, response,"statistik", userID);
			        break;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
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
		
		
		try (Connection cnx = ds.getConnection();) {
			String[] generatedKeys = new String[] {"idGame"};
			PreparedStatement sql = cnx.prepareStatement("INSERT INTO games (userID, categoryID, starttime, score) VALUES (?, ?, NOW(), 0)", generatedKeys);
			sql.setInt(1, userID);
			sql.setInt(2, categoryID);

			sql.executeUpdate();

			Integer result = -1;
			ResultSet rs = sql.getGeneratedKeys();
			while (rs.next()) {
				result = rs.getInt(1);
			}

			return result;
		} catch (Exception ex) {
			throw ex;
		}
	}

	protected Integer registerUser(String vName, String nName, String userName, String password, String mail)
			throws Exception {
		try (Connection cnx = ds.getConnection();) {
			String[] generatedKeys = new String[] {"idUser"};
			PreparedStatement sql = cnx.prepareStatement("INSERT INTO users (nName, vName, pw, username, mail) VALUES (?, ?, md5(?), ?, ?)", generatedKeys);
			sql.setString(1, nName);
			sql.setString(2, vName);
			sql.setString(3, password);
			sql.setString(4, userName);
			sql.setString(5, mail);

			sql.executeUpdate();
			Integer result = -1;
			ResultSet rs = sql.getGeneratedKeys();
			while (rs.next()) {
				result = rs.getInt(1);
			}

			return result;
		} catch (Exception ex) {
			throw ex;
		}

	}

	protected Boolean hasOpenGame(Integer userID, HttpSession session) throws Exception {
		try (Connection cnx = ds.getConnection();
				PreparedStatement sql = cnx
						.prepareStatement("SELECT * FROM games WHERE userID = ? AND endtime IS NULL");) {
			sql.setLong(1, userID);

			try (ResultSet rs = sql.executeQuery()) {
				if (rs != null && rs.next()) {
					session.setAttribute("gameID", rs.getInt(1));
					session.setAttribute("categoryID", rs.getInt(3));
					return true;
				} else {
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
				PreparedStatement sql = cnx.prepareStatement("SELECT * FROM users WHERE username = ?");) {
			sql.setString(1, userName);

			Boolean result = false;

			sql.executeQuery();

			try (ResultSet rs = sql.executeQuery()) {	
					if (rs != null && rs.next()) {
					result = true;
				} 
			}
			return result;

		} catch (Exception ex) {
			throw ex;

		}
	}

	protected QuestionBean getNextQuestion(Integer gameID, Integer categoryID) throws Exception {

		try (Connection cnx = ds.getConnection()) {
			QuestionBean qb = new QuestionBean();
			
			PreparedStatement sql = cnx.prepareStatement("SELECT COUNT(*) as Anzahl FROM thidb.results WHERE gameID = ?");
			
			sql.setInt(1, gameID);
			
			ResultSet rs = sql.executeQuery();
			
			Integer qCount = -1; 
			
			if (rs != null && rs.next()) {
				qCount = rs.getInt(1)+1;
			}
			else {
				return null;
			}
			
			if (qCount > 10) {
				endGame(gameID, categoryID);
				return null;
			}
			
			qb.setQ_Number(qCount);
			
			sql = cnx.prepareStatement("SELECT * FROM questions WHERE idQuestion NOT IN (SELECT questionID FROM results WHERE gameID = ?) AND categoryID = ? ORDER BY RAND() LIMIT 1;");
			
			sql.setLong(1, gameID);
			sql.setLong(2, categoryID);
			

			try {
				
				rs = sql.executeQuery();
				
				if (rs != null && rs.next()) {
					qb.setqID(rs.getInt(1));
					qb.setQ(rs.getString(2));

				}

				sql = cnx.prepareStatement(
						"SELECT qa.answerID, a.answer FROM questions_answers AS qa INNER JOIN answers AS a ON qa.answerID = a.idAnswer  WHERE qa.questionID = ?");

				sql.setInt(1, qb.getqID());

				rs = sql.executeQuery();

				if (rs != null) {

					for (Integer i = 0; i <= 3; i++) {
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
				
				sql = cnx.prepareStatement("INSERT INTO results (gameID, questionID, answerID) VALUES (?, ?, ?)");
				sql.clearParameters();
				sql.setInt(1, gameID);
				sql.setInt(2, qb.getqID());
				sql.setInt(3, -1);
				sql.executeUpdate();
				
				qb.setCurrentScore(getCurrentScore(gameID)*categoryID);
				
				return qb;

			} catch (Exception ex) {
				throw ex;
			}
		}
	}

	private Integer checkUser(String userName, String password) throws Exception {

		try (Connection cnx = ds.getConnection();
				PreparedStatement sql = cnx
						.prepareStatement("SELECT * FROM users WHERE username = ? AND pw = md5(?)");) {
			sql.setString(1, userName);
			sql.setString(2, password);

			Integer result = -1;
			try (ResultSet rs = sql.executeQuery()) {
				if (rs != null && rs.next()) {
					result = rs.getInt(1);
				}
			}
			return result;

		} catch (Exception ex) {
			throw ex;

		}
	}

	private Boolean checkAnswer(Integer questionID, Integer answerID, Integer gameID) throws Exception {
		try (Connection cnx = ds.getConnection()) {
			
			PreparedStatement sql = cnx.prepareStatement("SELECT * from results WHERE questionID = ? AND gameID = ? AND answerID != -1");
			sql.setInt(1, questionID);
			sql.setInt(2, gameID);
			
			ResultSet rs = sql.executeQuery();
			
			if (rs != null && rs.next()) {
				return false;
			}
			
			sql = cnx.prepareStatement("UPDATE results SET answerID = ? WHERE gameID = ? AND questionID = ?");
			sql.clearParameters();
			
			
			sql.setInt(1, answerID);
			sql.setInt(2, gameID);
			sql.setInt(3, questionID);
			
			sql.executeUpdate();
			
			Boolean result = false;

			sql = cnx.prepareStatement("SELECT * FROM questions_answers WHERE questionID = ? AND answerID = ? AND isRight=1");
			
			sql.clearParameters();
			
			sql.setInt(1, questionID);
			sql.setInt(2, answerID);
			
			rs = sql.executeQuery();
			
			if (rs != null && rs.next()) {
				sql = cnx.prepareStatement("UPDATE games SET score = score + 1 WHERE idGame = ?");
				sql.clearParameters();
				sql.setInt(1, gameID);
				sql.executeUpdate();
				result = true;
			}
						
			return result;

		} catch (Exception ex) {
			throw ex;

		}
	}
	
	private void endGame(Integer gameID, Integer categoryID) throws Exception{
		try (Connection cnx = ds.getConnection();
				PreparedStatement sql = cnx.prepareStatement("UPDATE games SET endtime = NOW(), score = score * ? WHERE idGame = ?");) {
			sql.setInt(1, categoryID);
			sql.setInt(2, gameID);
			sql.executeUpdate();
			
		} catch (Exception ex) {
			throw ex;

		}
	}
	
	private List<HighscoreEntryBean> getHighScoreEntries(Boolean getAllEntries) throws Exception{
		try (Connection cnx = ds.getConnection()) {
			
			String sqlS = "SELECT username, userID, MAX(score) AS score, MIN(Diff) AS Diff FROM (SELECT username, g1.userID, g1.score, TIMESTAMPDIFF(SECOND, g1.starttime, g1.endtime) AS Diff FROM thidb.games g1 LEFT JOIN thidb.games g2 ON g1.userID = g2.userID AND g1.score < g2.score INNER JOIN thidb.users u ON g1.userID = u.idUser WHERE g2.userID IS NULL) AS result GROUP BY username, userID ORDER BY score DESC, Diff ASC";
			
			if (!getAllEntries) {
				sqlS.concat(" LIMIT 10");
			}
			PreparedStatement sql = cnx.prepareStatement(sqlS);
			
			ResultSet rs = sql.executeQuery();
			
			List<HighscoreEntryBean> hs = new ArrayList<HighscoreEntryBean>();
			Integer rank = 1;
			
			while (rs != null && rs.next()) {
				hs.add(new HighscoreEntryBean(rs.getString(1), rs.getInt(3), rank, rs.getLong(4), rs.getInt(2)));
				rank++;
			}
			
			return hs;
			
		} catch (Exception ex) {
			throw ex;

		}
	}
	

	private UserBean getUserData(Integer UserID, Boolean complete) throws Exception {
		if (UserID != -1) {
			
		try (Connection cnx = ds.getConnection();) {
			
			PreparedStatement sql = cnx.prepareStatement("SELECT * FROM users WHERE idUser = ?");
			
			sql.setInt(1, UserID);
			
			ResultSet rs = sql.executeQuery();
			
			UserBean user = new UserBean();
			
			if (rs != null && rs.next()) {
				user.setMail(rs.getString(6));
				user.setNname(rs.getString(2));
				user.setVname(rs.getString(3));
				user.setUser(rs.getString(5));
				user.setIdUser(rs.getInt(1));
			}
			
			int rank = getCurrentRank(user.getIdUser());
			user.setCurrentRank(rank);
			
			int score = getLastScore(user.getIdUser());
			user.setLastScore(score);
			
			if (complete) {
				sql = cnx.prepareStatement("SELECT COUNT(*) as cout, SUM(score) as score FROM games WHERE userID = ? GROUP BY userID");
				sql.setInt(1, UserID);
				rs = sql.executeQuery();
				
				if (rs!= null && rs.next()) {
					user.setGamesPlayed(rs.getInt(1));
					user.setTotalScore(rs.getInt(2));
				}
				
				sql = cnx.prepareStatement("SELECT categoryID, COUNT(*) as count FROM games WHERE userID = ? GROUP BY userID, categoryID");
				sql.setInt(1, UserID);
				
				rs = sql.executeQuery();
				
				while (rs!= null && rs.next()) {
					if (rs.getInt(1) == 1)
					{
						user.setGamesPlayedEasy(rs.getInt(2));
					}
					else if (rs.getInt(1) == 2) {
						user.setGamesPlayedMiddle(rs.getInt(2));
					}
					else if (rs.getInt(1) == 3) {
						user.setGamesPlayedHard(rs.getInt(2));
					}
				}
				
				sql = cnx.prepareStatement("SELECT x.userID, x.answers, y.correct FROM (SELECT g.userID, COUNT(*) as answers FROM thidb.results r INNER JOIN thidb.games g ON r.gameID = g.idGame WHERE g.userID = ?) as x INNER JOIN (SELECT g.userID, COUNT(isRight) as correct FROM thidb.results r INNER JOIN thidb.games g ON r.gameID = g.idGame INNER JOIN thidb.users u ON g.userID = u.idUser INNER JOIN thidb.questions_answers q ON q.answerID = r.answerID AND isRight = 1 WHERE userID = ?) as y ON x.userID = y.userID");
				sql.setInt(1, UserID);
				sql.setInt(2, UserID);
				
				rs = sql.executeQuery();
				
				if (rs!= null && rs.next()) {
					int correct = rs.getInt(3);
					int total = rs.getInt(2);
							
					user.setQuoteAnswers((float)correct/(float)total*100.0);
				}
				
			}
			
			return user;
			
		} catch (Exception ex) {
			throw ex;

		}
		}
		else {
			return new UserBean();
		}
	}
	
	private int getCurrentRank(Integer userID) {
		if (userID > 0) {
			List<HighscoreEntryBean> list = new ArrayList<HighscoreEntryBean>();
			try {
				list = getHighScoreEntries(true);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			for (HighscoreEntryBean entry : list){
				if (entry.getId() == userID)
				{
					return entry.getRank();
				}
			}
		}
		
		return 0;
		
	}
	
	private int getLastScore(int userID) throws Exception{
		try (Connection cnx = ds.getConnection();
				PreparedStatement sql = cnx.prepareStatement("SELECT score FROM games WHERE userID = ? AND endtime IS NOT NULL ORDER BY starttime DESC LIMIT 1");) {
			
			sql.setInt(1, userID);
			
			ResultSet rs = sql.executeQuery();
			
			if (rs != null && rs.next()) {
				return rs.getInt(1);
			}
			else
			{
				return 0;
			}
			
		} catch (Exception ex) {
			throw ex;

		}
	}
	
	private int getCurrentScore(int gameID) throws Exception{
		try (Connection cnx = ds.getConnection();
				PreparedStatement sql = cnx.prepareStatement("SELECT score FROM games WHERE idGame = ?");) {
			
			sql.setInt(1, gameID);
			
			ResultSet rs = sql.executeQuery();
			
			if (rs != null && rs.next()) {
				return rs.getInt(1);
			}
			else
			{
				return 0;
			}
			
		} catch (Exception ex) {
			throw ex;

		}
	
	}
	
	protected void dispatch(HttpServletRequest request, HttpServletResponse response, String destination, Integer userID) throws ServletException, IOException {
		try {
			final RequestDispatcher dispatcher; 
			
			if (destination == "login") {
				request.setAttribute("HighScore", getHighScoreEntries(false));
				dispatcher = request.getRequestDispatcher(login);
				dispatcher.forward(request, response);
			}
			else if(destination == "landing") {
				request.setAttribute("UserData", getUserData(userID, false));
				request.setAttribute("HighScore", getHighScoreEntries(true));
				dispatcher = request.getRequestDispatcher(landing);
				dispatcher.forward(request, response);
				
			}
			else if(destination== "quiz") {
				request.setAttribute("UserData", getUserData(userID, false));
				request.setAttribute("HighScore", getHighScoreEntries(false));
				dispatcher = request.getRequestDispatcher(quiz);
				dispatcher.forward(request, response);
			}
			else if(destination == "personal") {
				request.setAttribute("UserData", getUserData(userID, false));
				request.setAttribute("HighScore", getHighScoreEntries(false));
				dispatcher = request.getRequestDispatcher(personal);
				dispatcher.forward(request, response);
			}
			else if(destination== "statistik") {
				request.setAttribute("UserData", getUserData(userID, true));
				request.setAttribute("HighScore", getHighScoreEntries(false));
				dispatcher = request.getRequestDispatcher(statistik);
				dispatcher.forward(request, response);
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
