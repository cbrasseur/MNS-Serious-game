package com.ifaSeriousGame.dao;

import java.util.List;

import com.ifaSeriousGame.beans.Question;

public interface QuestionDao {
	List<Question> lister(int idScenario);
	List<Question> listerParDifficulte(int idScenario, int difficulte);
	List<Question> listerDejaJouees(int idUtilisateur);
	void ajouterQuestion(String question,String image, int difficulte , int idScenario);
	int dernierIdEnregistre();
	List<Integer> listeIdParScenario(int idScenario);
	void supprimerQuestionsParScenario(List<Integer> listQuestions);
	int nbQuestionsPrevues(int idScenario);
}
