package com.ifaSeriousGame.dao;


import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

import com.ifaSeriousGame.beans.Repond;
import com.ifaSeriousGame.beans.Scenario;
import com.ifaSeriousGame.services.ExceptionPerso;

public interface RepondDao {
	List<Repond> lister(int idUtilisateur);
	void enregistrerReponse(int idUtilisateur, int idQuestion, int idReponse) throws ExceptionPerso;
	void enregistrerHeureReponse(int idUtilisateur, int idQuestion, int idReponse);
	List<Integer> listePointsJoueurParScenario(int idUtilisateur, int idScenario);
	List<Scenario> listeJeuxJoues (int idUtilisateur);
	boolean toutJuste(int idUtilisateur, int idScenario);
	int totalPointsTousScenariosJoues(int idUtilisateur);
	int totalPointsTousScenariosInscrit(int idUtilisateur);
	boolean checkDejaJoue(int idUtilisateur,int idScenario);
	int nbDeReponsesDonnees(int idUtilisateur,int idScenario);
	void effacerReponsesJoueur(int idUtilisateur);
	LocalDateTime debutJoueur(int idUtilisateur,int idScenario);
	LocalDateTime finJoueur(int idUtilisateur,int idScenario);
	Duration tempsJeu(int idUtilisateur,int idScenario);
	void supprimerReponsesJoueurParScenario(List<Integer> listQuestions);
	
	}
