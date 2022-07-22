package com.ifaSeriousGame.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.ifaSeriousGame.beans.Question;
import com.ifaSeriousGame.beans.Reponse;
import com.ifaSeriousGame.dao.DaoFactory;
import com.ifaSeriousGame.dao.QuestionDao;
import com.ifaSeriousGame.dao.QuestionDaoImpl;
import com.ifaSeriousGame.dao.ReponseDao;
import com.ifaSeriousGame.dao.ReponseDaoImpl;

public class AlgoJeu {
			
	public AlgoJeu() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String[] algoJeu(int idScenario, int idUtilisateur, int difficulte) {
		
		/*On crée les requetes Sql Les questions, les reponses possibles, les reponses deja données*/
		
		QuestionDao questionDao;
	    ReponseDao reponseDao;
	    
	    
	    DaoFactory daoFactory=DaoFactory.getInstance(); 
	    
    	questionDao=new QuestionDaoImpl(daoFactory);
    	reponseDao=new ReponseDaoImpl(daoFactory);
    	
    	
    	/*on crée  listes utiles toutes les question, toutes les reponses, les uqestions deja jouées, les questions- questions deja jouées 
    	 * (+ 1temporaire pour faire soustraction)*/
    	
		List<Question> listeQuestion= new ArrayList<Question>();
		listeQuestion=questionDao.listerParDifficulte(idScenario, difficulte);
		List<Reponse> listeReponse= new ArrayList<Reponse>();
		listeReponse=reponseDao.lister(idScenario);
		List<Question> listeDejaJouees=questionDao.listerDejaJouees(idUtilisateur);
		List<Question> temp=new ArrayList<Question>(); 
		temp.addAll(listeQuestion);
		
		for (Question question : listeQuestion) {
			for (Question question2 : listeDejaJouees) {
				if(question.getIdQuestion() == question2.getIdQuestion()) {
					temp.remove(question);
				}
			}
		}
		
		/*La liste de questions est soulagée des questions deja jouées*/
		
		listeQuestion.clear();
		listeQuestion.addAll(temp);
				
		for (Question question : listeQuestion) {
			System.out.println(question);
		}
		
		/*Parmi la liste nettoyée on tire au sort la question parmi les questions restantes, */

		Random ran= new Random();
		String questionAffiche=null;
		Integer indexrandom=null;
		Integer questionPosee=null;
		String reponseAfficheVraie;
		String reponseAfficheFausse;
		CalculStats points= new CalculStats();
		String score=(points.calculPoints(idUtilisateur,idScenario));
		String[] listeJeu= new String[9];
		
		/*on cree une liste contenant les index des questions encore disponibles, on tire au sort l'index de cette liste 
		 * et on recupere l'id de la question correspondante */
		
		if(!listeQuestion.isEmpty()) {
		
		List<Integer> listIndex= new ArrayList<Integer>();
		for (Question question : listeQuestion) {
			listIndex.add(question.getIdQuestion());
		}
		indexrandom=ran.nextInt(listIndex.size());
		System.out.println("l'index tiré au sort est  : "+indexrandom);
		questionPosee=listIndex.get(indexrandom);
		System.out.println("la question tirée au sort porte l'id"+questionPosee);
		
		/*On crée un tableau avec nos éléments necessaires a l'affichage de la page. 1 question+ 2 propositions 
		 * + 3 entiers index[3]=question.id index[4]=valeur de la reponse fausse et index [5]=valeur reponse vraie index[6]=difficulte index[7]=score index[8]=image*/
		
		
		
		
			for (Question question : listeQuestion) {
				if(question.getIdQuestion()== questionPosee) {
					questionAffiche=question.getQuestion();
					System.out.println("la question affichée est : "+questionAffiche);
					listeJeu[0]=questionAffiche;
					listeJeu[3]=String.valueOf(question.getIdQuestion());
					listeJeu[6]=String.valueOf(question.getDifficulte());
					listeJeu[8]=String.valueOf(question.getImage());
				}	
			}	
			
			System.out.println("limage est la question est : "+listeJeu[8]);
			
			for (Reponse reponse : listeReponse) {
				if(reponse.getIdQuestion()== questionPosee) {
					if(reponse.getValeur()==0) {
						reponseAfficheFausse=reponse.getReponse();
						listeJeu[1]=reponseAfficheFausse;
						listeJeu[4]=String.valueOf(reponse.getIdReponse());
					}else if(reponse.getValeur()!=0) {
						reponseAfficheVraie=reponse.getReponse();
						listeJeu[2]=reponseAfficheVraie;	
						listeJeu[5]=String.valueOf(reponse.getIdReponse());
					}					
				}
			}
			listeJeu[7]=score;
			questionPosee++;
		

		for (String string : listeJeu) {
			System.out.println(string);
		}
		return listeJeu;
		}else { 
			listeJeu[0]="Rendez vous sur le tableau de bord";
			return listeJeu;
		}
		
	}
	}
