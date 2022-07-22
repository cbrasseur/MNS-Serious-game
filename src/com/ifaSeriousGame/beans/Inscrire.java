package com.ifaSeriousGame.beans;

public class Inscrire {
	
	private int idUtilisateur;
	private int IdScenario;
	
	public Inscrire() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Inscrire(int idUtilisateur, int idScenario) {
		super();
		this.idUtilisateur = idUtilisateur;
		IdScenario = idScenario;
	}

	public int getIdUtilisateur() {
		return idUtilisateur;
	}

	public void setIdUtilisateur(int idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}

	public int getIdScenario() {
		return IdScenario;
	}

	public void setIdScenario(int idScenario) {
		IdScenario = idScenario;
	}
	
	
	
	
	

}
