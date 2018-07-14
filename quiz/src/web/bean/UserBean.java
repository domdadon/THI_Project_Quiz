package web.bean;

import java.io.Serializable;

public class UserBean implements Serializable {
	private static final long serialVersionUID = 1L;
		
	//Passwort aus Sicherheitsgruenden nicht in der Bean vorhanden
	private String nname, vname, user, mail;
	private int idUser;
	private int currentRank = 0;
	private int lastScore = 0;
	private int gamesPlayed = 0;
	private int gamesPlayedEasy = 0;
	private int gamesPlayedMiddle = 0;
	private int gamesPlayedHard = 0;
	private int totalScore = 0;
	private double quoteAnswers = 0.0;
	
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


	public double getQuoteAnswers() {
		return quoteAnswers;
	}


	public void setQuoteAnswers(double quote) {
		quote = quote*100.0;
		quote = Math.round(quote);
		quote = quote/100.0;
		this.quoteAnswers = quote;
	}


	public int getLastScore() {
		return lastScore;
	}


	public void setLastScore(int lastScore) {
		this.lastScore = lastScore;
	}	
}
