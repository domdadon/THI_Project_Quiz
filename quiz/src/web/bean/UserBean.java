package web.bean;

import java.io.Serializable;

public class UserBean implements Serializable {
	private static final long serialVersionUID = 1L;
		
	//Passwort aus Sicherheitsgründen nicht in der Bean vorhanden
	private String nname, vname, user, mail;
	private int idUser;
	
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
}