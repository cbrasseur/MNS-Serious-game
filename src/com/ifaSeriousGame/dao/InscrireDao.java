package com.ifaSeriousGame.dao;

public interface InscrireDao {
	public void inscrireJoueur(int idJoueur, int idScenario);
	public void radierJoueur(int idJoueur, int idScenario);
	public void supprimerInscriptionsJeu(int idScenario);
}
