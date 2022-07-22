package com.ifaSeriousGame.Servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ifaSeriousGame.beans.Utilisateur;
import com.ifaSeriousGame.dao.DaoFactory;
import com.ifaSeriousGame.dao.QuestionDao;
import com.ifaSeriousGame.dao.QuestionDaoImpl;
import com.ifaSeriousGame.dao.RepondDao;
import com.ifaSeriousGame.dao.RepondDaoImpl;
import com.ifaSeriousGame.dao.ReponseDao;
import com.ifaSeriousGame.dao.ReponseDaoImpl;
import com.ifaSeriousGame.services.AlgoJeu;
import com.ifaSeriousGame.services.CalculStats;
import com.ifaSeriousGame.services.EnvoyerMail;
import com.ifaSeriousGame.services.ExceptionPerso;

@WebServlet("/pageJeu")
public class PageJeu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("unused")
	private QuestionDao questionDao;
    @SuppressWarnings("unused")
	private ReponseDao reponseDao;
    private RepondDao repondDao;
    
    public PageJeu() {
        super();
       
    }
    
    @Override
    public void init() throws ServletException {
    	DaoFactory daoFactory=DaoFactory.getInstance();    
    	questionDao=new QuestionDaoImpl(daoFactory);
    	reponseDao=new ReponseDaoImpl(daoFactory);
    	repondDao=new RepondDaoImpl(daoFactory);
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		if(session.getAttribute("connectedUser")==null) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			
			Utilisateur user=(Utilisateur) session.getAttribute("connectedUser");
			int idUtilisateur=user.getIdUtilisateur();
			
			String idJeu= request.getParameter("idJeu");
			Integer id1=Integer.parseInt(idJeu);
			boolean dejaJoue=repondDao.checkDejaJoue(idUtilisateur, id1);
			
			if(!dejaJoue) {
				
				request.setAttribute("idScenario",id1);
				
				AlgoJeu jeu = new AlgoJeu();
				String[] listeJeu=jeu.algoJeu(id1,idUtilisateur,1);
				
				if(listeJeu[0]!= null) {
					
					request.setAttribute("jeu", listeJeu);
				
					int chance= (int) ((Math.random() *10)%2);
					request.setAttribute("chance", chance);
					
					CalculStats progression= new CalculStats();
					Double progres=progression.progression(idUtilisateur, id1);
					request.setAttribute("progression", progres);
				
					this.getServletContext().getRequestDispatcher("/WEB-INF/pageJeu.jsp").forward(request,response);
				}else {
					response.sendRedirect("/Serious_Game/pageTableauBord");
				}
			}else {
				EnvoyerMail reset = new EnvoyerMail();
				reset.demandeReset(idUtilisateur, id1);
				response.sendRedirect("/Serious_Game/validation");}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		if(session.getAttribute("connectedUser")==null) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			
			Utilisateur user=(Utilisateur) session.getAttribute("connectedUser");
			int idUtilisateur=user.getIdUtilisateur();
			System.out.println("lid du utilisateur est : "+idUtilisateur);
			
			String idScenario=request.getParameter("idJeu");
			System.out.println("lid du scenario est : "+idScenario);
			
			String idQuestion=request.getParameter("idQuestion");
			int id1=Integer.parseInt(idQuestion);
			
			String difficult=request.getParameter("difficulte");
			int difficulte=Integer.parseInt(difficult);
			
			System.out.println("l id de la bonne est "+request.getParameter("valeurVraie"));
			System.out.println("l id de la mauvaise est "+request.getParameter("valeurFausse"));	
		
			if(request.getParameter("action").equals("BonneReponse")) {
				String idReponse=request.getParameter("valeurVraie");
				request.setAttribute("idJeu", idScenario);
				Integer idR=Integer.parseInt(idReponse);
				
				
				try {
					repondDao.enregistrerReponse(idUtilisateur, id1, idR);
				} catch (ExceptionPerso e) {
					
					e.printStackTrace();
				}
				repondDao.enregistrerHeureReponse(idUtilisateur, id1, idR);
				System.out.println("Bonne reponse");
				request.setAttribute("difficulte", difficulte);
				this.getServletContext().getRequestDispatcher("/WEB-INF/bonnereponse.jsp").forward(request,response);
			
			}else if(request.getParameter("action").equals("MauvaiseReponse")) {
				String idReponse=request.getParameter("valeurFausse");
				request.setAttribute("idJeu", idScenario);
				Integer idR=Integer.parseInt(idReponse);
				
				String solution= (String) request.getParameter("solution");
				request.setAttribute("solution", solution);
				
				try {
					repondDao.enregistrerReponse(idUtilisateur, id1, idR);
					
				} catch (ExceptionPerso e) {
					
					e.printStackTrace();
				}
				
				repondDao.enregistrerHeureReponse(idUtilisateur, id1, idR);
				System.out.println("Mauvaise reponse");
				request.setAttribute("difficulte", difficulte);
				this.getServletContext().getRequestDispatcher("/WEB-INF/mauvaisereponse.jsp").forward(request,response);
			}
			
			
		}
		
	}

}
