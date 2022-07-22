package com.ifaSeriousGame.services;

import com.ifaSeriousGame.beans.Scenario;
import com.ifaSeriousGame.dao.DaoFactory;
import com.ifaSeriousGame.dao.QuestionDao;
import com.ifaSeriousGame.dao.QuestionDaoImpl;
import com.ifaSeriousGame.dao.ReponseDao;
import com.ifaSeriousGame.dao.ReponseDaoImpl;

public class ScenarioJouable {
	private QuestionDao questionDao;
	private ReponseDao reponseDao;
	
	public ScenarioJouable() {
		super();
		DaoFactory daoFactory=DaoFactory.getInstance();
		questionDao =new QuestionDaoImpl(daoFactory);
		reponseDao= new ReponseDaoImpl(daoFactory);
	}
	
	public boolean scenarioIsValid(int idScenario) {
		int nbTotalQuestions=questionDao.lister(idScenario).size();
		int nbTotalQuestionsNiveau1=questionDao.listerParDifficulte(idScenario, 1).size();
		int nbTotalQuestionsNiveau2=questionDao.listerParDifficulte(idScenario, 2).size();
		int nbTotalQuestionsNiveau3=questionDao.listerParDifficulte(idScenario, 3).size();
		int nbQuestionsPrevues= questionDao.nbQuestionsPrevues(idScenario);
		
		if( nbQuestionsPrevues == nbTotalQuestions 
			&& nbTotalQuestionsNiveau1== nbQuestionsPrevues/3 
			&& nbTotalQuestionsNiveau2== nbQuestionsPrevues/3 
			&& nbTotalQuestionsNiveau3== nbQuestionsPrevues/3) {
			return true;
		}
		
		return false;
		
	}

}
