package com.ifaSeriousGame.beans;

public class Utilisateur {
	
	private int idUtilisateur;
	private String nom;
	private String prenom;
	private String email;
	private String password;
	private String niveau;
	private int profil;
	
	
	public Utilisateur() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Utilisateur(int idUtilisateur, String nom, String prenom, String email, String password, String niveau,
			int profil) {
		super();
		this.idUtilisateur = idUtilisateur;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.password = password;
		this.niveau = niveau;
		this.profil = profil;
	}
	public int getIdUtilisateur() {
		return idUtilisateur;
	}
	public void setIdUtilisateur(int idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNiveau() {
		return niveau;
	}
	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}
	public int getProfil() {
		return profil;
	}
	public void setProfil(int profil) {
		this.profil = profil;
	}


	@Override
	public String toString() {
		return "Utilisateur [idUtilisateur=" + idUtilisateur + ", nom=" + nom + ", prenom=" + prenom + ", email="
				+ email + ", password=" + password + ", niveau=" + niveau + ", profil=" + profil + "]";
	}
	
}
