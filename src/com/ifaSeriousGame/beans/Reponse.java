package com.ifaSeriousGame.beans;

public class Reponse {
	private int idReponse;
	private String reponse;
	private int valeur;
	private int idQuestion;
	
	public Reponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reponse(int idReponse, String reponse, int valeur, int idQuestion) {
		super();
		this.idReponse = idReponse;
		this.reponse = reponse;
		this.valeur = valeur;
		this.idQuestion = idQuestion;
	}

	public int getIdReponse() {
		return idReponse;
	}

	public void setIdReponse(int idReponse) {
		this.idReponse = idReponse;
	}

	public String getReponse() {
		return reponse;
	}

	public void setReponse(String reponse) {
		this.reponse = reponse;
	}

	public int getValeur() {
		return valeur;
	}

	public void setValeur(int valeur) {
		this.valeur = valeur;
	}

	public int getIdQuestion() {
		return idQuestion;
	}

	public void setIdQuestion(int idQuestion) {
		this.idQuestion = idQuestion;
	}

	@Override
	public String toString() {
		return "Reponse [idReponse=" + idReponse + ", reponse=" + reponse + ", valeur=" + valeur + ", idQuestion="
				+ idQuestion + "]";
	}
	
	
	
	
	

}
