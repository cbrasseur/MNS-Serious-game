package com.ifaSeriousGame.dao;

import java.util.List;

import com.ifaSeriousGame.beans.Reponse;

public interface ReponseDao {
	List<Reponse> lister(int idScenario);
	List<Integer> listePointsJeu(int idScenario);
	void ajouterReponse(String reponse, int valeur, int id_Questions );
	void supprimerReponsesParScenario(List<Integer> listQuestions);
}
