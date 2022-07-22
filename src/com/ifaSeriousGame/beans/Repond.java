package com.ifaSeriousGame.beans;

public class Repond {
	private int idUtilisateur;
	private int idQuestions;
	private int idReponse;
	
	public Repond() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Repond(int idUtilisateur, int idQuestions, int idReponse) {
		super();
		this.idUtilisateur = idUtilisateur;
		this.idQuestions = idQuestions;
		this.idReponse = idReponse;
	}
	
	public int getIdUtilisateur() {
		return idUtilisateur;
	}

	public void setIdUtilisateur(int idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}

	public int getIdQuestions() {
		return idQuestions;
	}

	public void setIdQuestions(int idQuestions) {
		this.idQuestions = idQuestions;
	}

	public int getIdReponse() {
		return idReponse;
	}

	public void setIdReponse(int idReponse) {
		this.idReponse = idReponse;
	}

	@Override
	public String toString() {
		return "Repond [idUtilisateur=" + idUtilisateur + ", idQuestions=" + idQuestions + ", idReponse=" + idReponse
				+ "]";
	}
	
	
	

}
