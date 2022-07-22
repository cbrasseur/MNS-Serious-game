package com.ifaSeriousGame.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ifaSeriousGame.beans.Utilisateur;
import com.ifaSeriousGame.dao.DaoFactory;
import com.ifaSeriousGame.dao.InscrireDao;
import com.ifaSeriousGame.dao.InscrireDaoImpl;
import com.ifaSeriousGame.dao.QuestionDao;
import com.ifaSeriousGame.dao.QuestionDaoImpl;
import com.ifaSeriousGame.dao.RepondDao;
import com.ifaSeriousGame.dao.RepondDaoImpl;
import com.ifaSeriousGame.dao.ReponseDao;
import com.ifaSeriousGame.dao.ReponseDaoImpl;
import com.ifaSeriousGame.dao.ScenarioDao;
import com.ifaSeriousGame.dao.ScenarioDaoImpl;


@WebServlet("/supprimerJeu")
public class SupprimerJeu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InscrireDao inscrireDao;
	private QuestionDao questionDao;
	private ScenarioDao scenarioDao;
	private RepondDao repondDao;
	private ReponseDao reponseDao;
    
    public SupprimerJeu() {
        super();
        
    }
    
    @Override
    public void init() throws ServletException {
    	DaoFactory daoFactory = DaoFactory.getInstance();
    	scenarioDao = new ScenarioDaoImpl(daoFactory);
    	inscrireDao = new InscrireDaoImpl(daoFactory);
    	questionDao = new QuestionDaoImpl(daoFactory);
    	repondDao =new RepondDaoImpl(daoFactory);
    	reponseDao = new ReponseDaoImpl(daoFactory);
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2) {
			response.sendRedirect("/Serious_Game/login");
		} else {
		this.getServletContext().getRequestDispatcher("/WEB-INF/pageCreation1.jsp").forward(request,response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Utilisateur user = (Utilisateur) session.getAttribute("connectedUser");
		
		if(session.getAttribute("connectedUser")==null || user.getProfil()!=2) {
			response.sendRedirect("/Serious_Game/login");
		} else {
			if(request.getParameter("action").equals("retour")) {
				response.sendRedirect("/Serious_Game/pageCreation1");
			}else if(request.getParameter("action").equals("supprimer")) {
				Integer idJeu = Integer.parseInt(request.getParameter("idJeu"));
				inscrireDao.supprimerInscriptionsJeu(idJeu);
				List<Integer> listQuestions =questionDao.listeIdParScenario(idJeu);
				repondDao.supprimerReponsesJoueurParScenario(listQuestions);
				reponseDao.supprimerReponsesParScenario(listQuestions);
				questionDao.supprimerQuestionsParScenario(listQuestions);
				scenarioDao.supprimer(idJeu);
				response.sendRedirect("/Serious_Game/pageCreation1");
			}
		}
	}

}
