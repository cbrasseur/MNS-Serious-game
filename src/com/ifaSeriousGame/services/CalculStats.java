package com.ifaSeriousGame.services;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ifaSeriousGame.beans.Question;
import com.ifaSeriousGame.dao.DaoFactory;
import com.ifaSeriousGame.dao.QuestionDao;
import com.ifaSeriousGame.dao.QuestionDaoImpl;
import com.ifaSeriousGame.dao.RepondDao;
import com.ifaSeriousGame.dao.RepondDaoImpl;
import com.ifaSeriousGame.dao.ReponseDao;
import com.ifaSeriousGame.dao.ReponseDaoImpl;

public class CalculStats {
	 
	public CalculStats() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String calculPoints(int idUtilisateur, int idScenario) {
		
		RepondDao repondDao;
		ReponseDao reponseDao;
		DaoFactory daoFactory=DaoFactory.getInstance(); 
		repondDao=new RepondDaoImpl(daoFactory);
		reponseDao= new ReponseDaoImpl(daoFactory);
		
		List<Integer> listePointsJoueur= new ArrayList<Integer>();
		listePointsJoueur=repondDao.listePointsJoueurParScenario(idUtilisateur, idScenario);
		
		int score=listePointsJoueur.stream().mapToInt(Integer::intValue).sum();
		
		List<Integer> listePointsJeu = new ArrayList<Integer>();
		listePointsJeu= reponseDao.listePointsJeu(idScenario);
		
		int total=listePointsJeu.stream().mapToInt(Integer::intValue).sum();
		
		if(repondDao.toutJuste(idUtilisateur, idScenario)) {
			score=total;
		}
			
		return (score+" / "+total);
	}
	
	public int calculTotalJoueur(int idUtilisateur,int idScenario) {
		RepondDao repondDao;
		ReponseDao reponseDao;
		DaoFactory daoFactory=DaoFactory.getInstance(); 
		repondDao=new RepondDaoImpl(daoFactory);
		reponseDao= new ReponseDaoImpl(daoFactory);
		
		int valeur1=repondDao.totalPointsTousScenariosJoues(idUtilisateur);
		List<Integer> listePointsJeu = new ArrayList<Integer>();
		listePointsJeu= reponseDao.listePointsJeu(idScenario);
		
		int total=listePointsJeu.stream().mapToInt(Integer::intValue).sum();
		
		if(repondDao.toutJuste(idUtilisateur, idScenario)) {
			valeur1=total;
		}
		return (valeur1);
	}
	public int calculTotalPossible(int idUtilisateur) {
		RepondDao repondDao;
		DaoFactory daoFactory=DaoFactory.getInstance(); 
		repondDao=new RepondDaoImpl(daoFactory);
		
		int valeur2=repondDao.totalPointsTousScenariosInscrit(idUtilisateur);
		
		return (valeur2);
	}
	
	public double progression(int idUtilisateur,int idScenario) {
		int enCours=0;
		RepondDao repondDao;
		QuestionDao questionDao;
		DaoFactory daoFactory=DaoFactory.getInstance();
		repondDao=new RepondDaoImpl(daoFactory);
		questionDao=new QuestionDaoImpl(daoFactory);
		
		enCours=repondDao.nbDeReponsesDonnees(idUtilisateur, idScenario);
		
		List<Question> listeQuestionParJeu=questionDao.lister(idScenario);
		int total=0;
		for (Question question : listeQuestionParJeu) {
			total++;
		}
		Double pourcentage= (double) ((enCours*100)/total);
		return pourcentage;
	}
	
	public String tempsDeJeu(int idUtilisateur,int idScenario) {
		String tempsJeu=null;
		
		RepondDao repondDao;
		DaoFactory daoFactory=DaoFactory.getInstance();
		repondDao=new RepondDaoImpl(daoFactory);
		Duration duration=repondDao.tempsJeu(idUtilisateur,idScenario);
		
		if(duration.getSeconds() <60) {
			tempsJeu="Vous avez terminé ce jeu en : "+duration.getSeconds()+" secondes";
		}else if(duration.getSeconds() >=60 && duration.toMinutes()<60) {
			double s = (duration.getSeconds())%60;
			tempsJeu="Vous avez terminé ce jeu en : "+duration.toMinutes()+" minutes "+s+" secondes";
		}else if(duration.getSeconds() >=60 && duration.toMinutes()>=60 && duration.toHours()<24) {
			double s = (duration.getSeconds())%60;
			double m = (duration.toMinutes())%60;
			tempsJeu="Vous avez terminé ce jeu en : "+duration.toHours()+" heures "+m+" minutes "+s+" secondes";
		}else {
			tempsJeu="C'est beaucoup trop long !";
		}
		return tempsJeu;
	}
}
