package com.ifaSeriousGame.beans;

public class Satisfaction {
	private int IdSatisfaction;
	private int note;
	private String commentaire;
	private int idUtilisateur;
	
	public Satisfaction() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Satisfaction(int idSatisfaction, int note, String commentaire, int idUtilisateur) {
		super();
		IdSatisfaction = idSatisfaction;
		this.note = note;
		this.commentaire = commentaire;
		this.idUtilisateur = idUtilisateur;
	}

	public int getIdSatisfaction() {
		return IdSatisfaction;
	}

	public void setIdSatisfaction(int idSatisfaction) {
		IdSatisfaction = idSatisfaction;
	}

	public int getNote() {
		return note;
	}

	public void setNote(int note) {
		this.note = note;
	}

	public String getCommentaire() {
		return commentaire;
	}

	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}

	public int getIdUtilisateur() {
		return idUtilisateur;
	}

	public void setIdUtilisateur(int idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}

	@Override
	public String toString() {
		return "Satisfaction [IdSatisfaction=" + IdSatisfaction + ", note=" + note + ", commentaire=" + commentaire
				+ ", idUtilisateur=" + idUtilisateur + "]";
	}
	
	
	
	

}
