package com.ifaSeriousGame.dao;

import java.util.List;

import com.ifaSeriousGame.beans.Utilisateur;

public interface UtilisateurDao {
	public  Utilisateur isValidLogin( String login, String password );
	public void ajouterUtilisateur(Utilisateur u);
	public int idDernierAjout();
	public boolean joueurDejaInscrit(String email);
	public Utilisateur lecture(int idUtilisateur);
	public void updateUtilisateur(Utilisateur joueur);
}
