package com.ifaSeriousGame.beans;

import java.sql.Date;

public class Scenario {
	
	private int idScenario;
	private String nom;
	private Date date_crea;
	private Date date_modif;
	private int idUtilisateur;
	private String description;
	private String illustration;
	private Integer nbQuestions;
	


	private boolean dejaJoue;
	
	
	
	public Scenario(int idScenario, String nom, String description) {
		super();
		this.idScenario = idScenario;
		this.nom = nom;
		this.description = description;
	}


	public Scenario() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Scenario(int idScenario, String nom, Date date_crea, Date date_modif, int idUtilisateur,
			String description, String illustration) {
		super();
		this.idScenario = idScenario;
		this.nom = nom;
		this.date_crea = date_crea;
		this.date_modif = date_modif;
		this.idUtilisateur = idUtilisateur;
		this.description = description;
		this.illustration= illustration;
	}
	
	public Scenario(int idScenario, String nom, Date date_crea, Date date_modif, int idUtilisateur, String description,
			String illustration,boolean dejaJoue) {
		super();
		this.idScenario = idScenario;
		this.nom = nom;
		this.date_crea = date_crea;
		this.date_modif = date_modif;
		this.idUtilisateur = idUtilisateur;
		this.description = description;
		this.description = description;
		this.dejaJoue = dejaJoue;
			
	}
	public Integer getNbQuestions() {
			return nbQuestions;
		}
	
	
		public void setNbQuestions(Integer nbQuestions) {
			this.nbQuestions = nbQuestions;
		}

	public String getIllustration() {
		return illustration;
	}


	public void setIllustration(String illustration) {
		this.illustration = illustration;
	}


	public boolean isDejaJoue() {
		return dejaJoue;
	}


	public void setDejaJoue(boolean dejaJoue) {
		this.dejaJoue = dejaJoue;
	}


	public int getIdScenario() {
		return idScenario;
	}


	public void setIdScenario(int idScenario) {
		this.idScenario = idScenario;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public Date getDate_crea() {
		return date_crea;
	}


	public void setDate_crea(Date date_crea) {
		this.date_crea = date_crea;
	}


	public Date getDate_modif() {
		return date_modif;
	}


	public void setDate_modif(Date date_modif) {
		this.date_modif = date_modif;
	}


	public int getIdUtilisateur() {
		return idUtilisateur;
	}


	public void setIdUtilisateur(int idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
	
	

}
