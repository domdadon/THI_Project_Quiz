package web.bean;

import java.io.Serializable;

public class UserBean implements Serializable {
	private static final long serialVersionUID = 1L;
		
	//Passwort aus Sicherheitsgruenden nicht in der Bean vorhanden
	private String nname, vname, user, mail;
	private int idUser;
	private int currentRank = 1;
	private int lastScore = 1;
	private int gamesPlayed = 1;
	private int gamesPlayedEasy = 1;
	private int gamesPlayedMiddle = 1;
	private int gamesPlayedHard = 1;
	private int totalScore = 1;
	private int quoteAnswers = 100;
	
	public UserBean(String nName, String vName, String user, String mail, int idUser) {
		this.nname = nName;
		this.vname = vName;
		this.user = user;
		this.mail = mail;
		this.idUser = idUser;
	}
	
	
	public UserBean() {
		// TODO Auto-generated constructor stub
	}


	public String getNname() {
		return nname;
	}
	public void setNname(String nname) {
		this.nname = nname;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}


	public int getCurrentRank() {
		return currentRank;
	}


	public void setCurrentRank(int currentRank) {
		this.currentRank = currentRank;
	}


	public int getGamesPlayed() {
		return gamesPlayed;
	}


	public void setGamesPlayed(int gamesPlayed) {
		this.gamesPlayed = gamesPlayed;
	}


	public int getGamesPlayedEasy() {
		return gamesPlayedEasy;
	}


	public void setGamesPlayedEasy(int gamesPlayedEasy) {
		this.gamesPlayedEasy = gamesPlayedEasy;
	}


	public int getGamesPlayedMiddle() {
		return gamesPlayedMiddle;
	}


	public void setGamesPlayedMiddle(int gamesPlayedMiddle) {
		this.gamesPlayedMiddle = gamesPlayedMiddle;
	}


	public int getGamesPlayedHard() {
		return gamesPlayedHard;
	}


	public void setGamesPlayedHard(int gamesPlayedHard) {
		this.gamesPlayedHard = gamesPlayedHard;
	}


	public int getTotalScore() {
		return totalScore;
	}


	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}


	public int getQuoteAnswers() {
		return quoteAnswers;
	}


	public void setQuoteAnswers(int quoteAnswers) {
		this.quoteAnswers = quoteAnswers;
	}


	public int getLastScore() {
		return lastScore;
	}


	public void setLastScore(int lastScore) {
		this.lastScore = lastScore;
	}	
	
	
	
}